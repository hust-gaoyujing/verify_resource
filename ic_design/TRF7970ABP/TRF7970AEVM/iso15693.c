/****************************************************************
* FILENAME: iso15693.c
*
* BRIEF: Contain functions to search ISO15693 standardized tags
* in stand alone mode and execute ISO15693 Anticollision in
* remote mode.
*
* Copyright (C) 2010 Texas Instruments, Inc.
*
* AUTHOR(S): Reiser Peter		DATE: 02 DEC 2010
*
* EDITED BY:
* *
*
****************************************************************/

#include "iso15693.h"

//===============================================================

u08_t afi = 0;
u08_t flags = 0;							// stores the mask value (used in anticollision)
extern u08_t buf[300];
extern u08_t i_reg;
extern u08_t irq_flag;
extern s08_t rxtx_state;
extern u08_t rx_error_flag;
extern u08_t stand_alone_flag;
extern u08_t remote_flag;

//===============================================================
// NAME: void Iso15693FindTag(void)
//
// BRIEF: Is used to detect ISO15693 conform tags in stand alone
// mode.
//
// INPUTS:
//
// OUTPUTS:
//
// PROCESS:	[1] turn on RF driver
//			[2] do a complete anticollision sequence
//			[3] turn off RF driver
//
// NOTE: If ISO15693 conform Tag is detected, ISO15693 LED will
//       be turned on.
//
// CHANGE:
// DATE  		WHO	DETAIL
// 23Nov2010	RP	Original Code
//===============================================================

void
Iso15693FindTag(void)
{
	Trf797xTurnRfOn();

	Trf797xWriteIsoControl(0x02);

	// The VCD should wait at least 1 ms after it activated the
	// powering field before sending the first request, to
	// ensure that the VICCs are ready to receive it. (ISO15693-3)
	McuDelayMillisecond(6);

	flags = SIXTEEN_SLOTS;
//	flags = ONE_SLOT;

	buf[20] = 0x00;
	Iso15693Anticollision(&buf[20], 0x00);					// send Inventory request

	Trf797xTurnRfOff();

	Trf797xResetIrqStatus();
	// clear any IRQs
}

//===============================================================
// NAME: void Iso15693Anticollision(u08_t *mask, u08_t length)
//
// BRIEF: Is used to perform a inventory cycle of 1 or 16
// timeslots.
//
// INPUTS:
//	Parameters:
//		u08_t		*mask		mask value
//		u08_t		length		number of significant bits of
//								mask value
//
// OUTPUTS:
//
// PROCESS:	[1] send command
//			[2] receive respond
//			[3] send respond to host
//
// CHANGE:
// DATE  		WHO	DETAIL
// 23Nov2010	RP	Original Code
//===============================================================

void
Iso15693Anticollision(u08_t *mask, u08_t length)		// host command 0x14
{
	u08_t	i = 1, j = 1, command[2], no_slots, found = 0;

	u08_t	*p_slot_no, slot_no[17];
	u08_t	new_mask[8], new_length, mask_size;
	u32_t	size;

	u08_t	fifo_length = 0;

	u16_t	k;

	slot_no[0] = 0x00;

	if((flags & BIT5) == 0x00)							// flag bit5 is the number of slots indicator
	{
		no_slots = 16;									// 16 slots if bit is cleared
		//Trf797xEnableSlotCounter();
	}
	else
	{
		no_slots = 1;									// 1 slot if bit is set
	}

	p_slot_no = &slot_no[0];							// slot number pointer

	mask_size = (((length >> 2) + 1) >> 1);				// mask_size is 1 for length = 4 or 8

	buf[0] = 0x8F;
	buf[1] = 0x91;										// send with CRC
	buf[2] = 0x3D;										// write continuous from 1D
	buf[5] = flags;										// ISO15693 flags
	buf[6] = 0x01;										// anticollision command code

	//optional afi should be here
	if(flags & 0x10)
	{
		// mask_size is 2 for length = 12 or 16 ;
		// and so on

		size = mask_size + 4;							// mask value + mask length + afi + command code + flags

		buf[7] = afi;
		buf[8] = length;								// masklength
		if(length > 0)
		{
			for(i = 0; i < mask_size; i++)
            {
            	buf[9 + i] = *(mask + i);
            }
		}
		fifo_length = 9;
	}
	else
	{
		// mask_size is 2 for length = 12 or 16
		// and so on

		size = mask_size + 3;							// mask value + mask length + command code + flags

		buf[7] = length;								// masklength
		if(length > 0)
		{
			for(i = 0; i < mask_size; i++)
			{
				buf[8 + i] = *(mask + i);
			}
		}
		fifo_length = 8;
	}

	buf[3] = (char) (size >> 8);
	buf[4] = (char) (size << 4);

	Trf797xResetIrqStatus();

	McuCounterSet();									// TimerA set
	COUNT_VALUE = COUNT_1ms * 30;						// 30ms, not 20ms
	IRQ_CLR;											// PORT2 interrupt flag clear
	IRQ_ON;

	Trf797xRawWrite(&buf[0], mask_size + fifo_length);	// writing to FIFO

	i_reg = 0x01;
	irq_flag = 0x00;
	START_COUNTER;										//	start timer up mode

	while(irq_flag == 0x00)
	{
	}													// wait for end of TX interrupt
	STOP_COUNTER;

	for(j = 1; j <= no_slots; j++)						// 1 or 16 available timeslots
	{	rxtx_state = 1;									// prepare the extern counter

		// the first UID will be stored from buf[1] upwards
		McuCounterSet();								// TimerA set
		COUNT_VALUE = COUNT_1ms * 20;
		START_COUNTER;									// start timer up mode

		irq_flag = 0x00;

		while(irq_flag == 0x00)
		{
		}												// wait for interrupt
		STOP_COUNTER;

		while(i_reg == 0x01)							// wait for RX complete
		{
			k++;

			if(k == 0xFFF0)
			{
				i_reg = 0x00;
				rx_error_flag = 0x00;
			}
		}

		command[0] = RSSI_LEVELS;						// read RSSI levels
		Trf797xReadSingle(command, 1);
		switch(i_reg)
		{
			case 0xFF:									// if recieved UID in buffer
//				if(stand_alone_flag == 1)
//				{
					found = 1;
					#ifdef ENABLE_HOST
					UartPutCrlf();
					if(stand_alone_flag == 1)
						{
						UartSendCString("ISO15693: ");
						}
						UartPutChar('[');
						for(i = 3; i < 11; i++)
						{
							UartPutByte(buf[i]);		// send UID to host
						}
						UartPutChar(',');
						UartPutByte(command[0]);		// RSSI levels
						UartPutChar(']');
					#endif
//				}
				break;

			case 0x02:									// collision occured
//				if(stand_alone_flag == 1)
//				{
//					#ifdef ENABLE_HOST
//						UartPutChar('[');
//						UartPutChar('z');
//						UartPutChar(',');
//						UartPutByte(command[0]);		// RSSI levels
//						UartPutChar(']');
//						UartPutCrlf();
//					#endif
//				}

				p_slot_no++;							// remember a collision was detected
				*p_slot_no = j;
				break;

			case 0x00:									// timer interrupt
//				if(stand_alone_flag == 1)
//				{
//					#ifdef ENABLE_HOST
//						UartPutChar('[');				// send no-response massage to host
//						UartPutChar(',');
//						UartPutByte(command[0]);		// RSSI levels
//						UartPutChar(']');
//						UartPutCrlf();
//					#endif
//				}
				break;

			default:
				break;
		}

		Trf797xReset();									// FIFO has to be reset before recieving the next response

		if((no_slots == 16) && (j < 16))				// if 16 slots used send EOF(next slot)
		{
			Trf797xStopDecoders();
			Trf797xRunDecoders();
			Trf797xTransmitNextSlot();
		}
		else if((no_slots == 16) && (j == 16))			// at the end of slot 16 stop the slot counter
		{	Trf797xStopDecoders();
			Trf797xDisableSlotCounter();
		}
		else if(no_slots == 1)							// 1 slot is used
		{
			break;
		}

		if(stand_alone_flag == 0)
		{
			#ifdef ENABLE_HOST
				//UartPutCrlf();
			#endif
		}
	}													// for

	if(found == 1)									// LED on?
	{
		LED_15693_ON;								// LEDs indicate detected ISO15693 tag
	}
	else
	{
		LED_15693_OFF;
		LED_POWER_ON;
	}

	new_length = length + 4; 							// the mask length is a multiple of 4 bits

	mask_size = (((new_length >> 2) + 1) >> 1);

	while((*p_slot_no != 0x00) && (no_slots == 16) && (new_length < 61) && (slot_no[16] != 16))
	{
		*p_slot_no = *p_slot_no - 1;

		for(i = 0; i < 8; i++)
		{
			new_mask[i] = *(mask + i);				//first the whole mask is copied
		}

		if((new_length & BIT2) == 0x00)
		{
			*p_slot_no = *p_slot_no << 4;
		}
		else
		{
			for(i = 7; i > 0; i--)
			{
				new_mask[i] = new_mask[i - 1];
			}
			new_mask[0] &= 0x00;
		}
		new_mask[0] |= *p_slot_no;				// the mask is changed
		McuDelayMillisecond(2);

		Iso15693Anticollision(&new_mask[0], new_length);	// recursive call with new Mask

		p_slot_no--;
	}

	IRQ_OFF;
}														// Iso15693Anticollision

