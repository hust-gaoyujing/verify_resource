/****************************************************************
* FILENAME: iso14443b.c
*
* BRIEF: Contain functions to search ISO14443B standardized tags
* in stand alone mode and execute ISO14443B Anticollision in
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


#include "iso14443b.h"

//===============================================================

extern u08_t buf[300];
extern u08_t i_reg;
extern u08_t irq_flag;
extern u08_t rx_error_flag;
extern s08_t rxtx_state;
extern u08_t stand_alone_flag;
extern u08_t host_control_flag;

//===============================================================

void iso14443bSlotMarkerCommand(u08_t number);

//===============================================================
// NAME: void Iso14443aFindTag(void)
//
// BRIEF: Is used to detect ISO14443B conform tags in stand alone 
// mode.
//
// INPUTS:
//	
// OUTPUTS:
//
// PROCESS:	[1] turn on RF driver
//			[2] do a complete anti-collision sequence
//			[3] turn off RF driver
//
// NOTE: If ISO14443B conform Tag is detected, ISO14443B LED will
//       be turned on.
//
// CHANGE:
// DATE  		WHO	DETAIL
// 23Nov2010	RP	Original Code
//===============================================================

void
Iso14443bFindTag(void)
{	
	Trf797xTurnRfOn();
	
	Trf797xWriteIsoControl(0x0C);
	
	// When a PICC is exposed to an unmodulated operating field
	// it shall be able to accept a quest within 5 ms.
	// PCDs should periodically present an unmodulated field of at least
	// 5,1 ms duration. (ISO14443-3)
	McuDelayMillisecond(6);

	iso14443bAnticollision(0xB0, 0x00); 		// 16 slots (0xB0, 0x00) for 16 slots

//    Trf797xReset();

	Trf797xTurnRfOff();

	Trf797xResetIrqStatus();
//	UartPutCrlf();
}

//===============================================================
// NAME: void Iso14443bAnticollision(u08_t command, u08_t slots)
//
// BRIEF: Is used to perform ISO14443B anticollision sequence.
//
// INPUTS:
//	Parameters:
//		U08_t		command		REQB or WUPB
//		u08_t		slots		number of slots
//	
// OUTPUTS:
//
// PROCESS:	[1] PCD sends REQB with number of slots N
//			[2] PICC generates random number R from 1 to N
//			[3] PCD sends Slot-Marker command during every
//			    timeslot
//			[4] PICC respons only if R matches N
//			[5] When multiple PICCs respond, PCD makes a note of
//			    collision and generates a new N. Steps 1 to 4
//			    will be repeated.
//
// NOTE: Collisions returned as �[z]�.
//       Timeouts returned as �[]�.
//
// CHANGE:
// DATE  		WHO	DETAIL
// 23Nov2010	RP	Original Code
//===============================================================

void
iso14443bAnticollision(u08_t command, u08_t n)
{
	u08_t	apn, slots, collision = 0x00, j, found = 0;		//apn: will be used in slot marker command
	u08_t 	pupi[20];
	#ifdef ENABLE_HOST
		u08_t rssi[2];
	#endif
	switch ((n & 0x07))
	{
	case 0x00:
		slots = 1;
		break;
	case 0x01:
		slots = 2;
		break;
	case 0x02:
		slots = 4;
		break;
	case 0x03:
		slots = 8;
		break;
	case 0x04:
		slots = 16;
		break;
	}

//	buf[0] = ISO_CONTROL;
//	buf[1] = 0x0C;							// recieve with no CRC
//	Trf797xWriteIsoControl(buf[1]);
//	Trf797xReadSingle(buf,1);
//	McuDelayMillisecond(6);
	
	rx_error_flag = 0x00;

	buf[0] = 0x8F;
	buf[1] = 0x91;
	buf[2] = 0x3D;
	buf[3] = 0x00;
	buf[4] = 0x30;
	buf[5] = 0x05;
	buf[6] = 0x00;
	buf[7] = n;
	if(command == 0xB1)
	{
		buf[7] |= 0x08; 					// WUPB command else REQB command
	}
	rxtx_state = 1;						// the response will be stored in buf[1] upwards
	i_reg = 0x01;

	Trf797xRawWrite(&buf[0], 8);

	IRQ_CLR;								// PORT2 interrupt flag clear
	IRQ_ON;

	j = 0;
	while((i_reg == 0x01) && (j < 2))
	{
		j++;
		McuCounterSet();					// TimerA set
		COUNT_VALUE = COUNT_1ms * 5;		// 2ms
		START_COUNTER;
		irq_flag = 0x00;
		while(irq_flag == 0x00)
		{
		}
		STOP_COUNTER;
	}										// wait for end of TX

	i_reg = 0x01;
	while(i_reg == 0x01)		// wait for end of RX or timeout
	{
		McuCounterSet();
		COUNT_VALUE = COUNT_1ms * 5;
		irq_flag = 0x00;
		START_COUNTER;						// start timer up mode
		while(irq_flag == 0x00)
		{
		}									// wait for interrupt
		STOP_COUNTER;
	}
	apn = 0;
	while (apn < slots)
	{
		if (apn > 0)
		{
			j = (apn << 4) | 0x05;
			iso14443bSlotMarkerCommand(j);
		}

		if(rx_error_flag == 0x02)
		{
			i_reg = 0x02;
		}
		if(i_reg == 0xFF)					// recieved PUPI in buffer
		{
//	        for(j = 2; j < 6; j++)
//			{
//				pupi[j-2] = buf[j];
//			}
	        for(j = 1; j < rxtx_state; j++)
			{
				pupi[j-1] = buf[j];
			}
			if (1) //Iso14443b_halt(&pupi[1]))
			{
//				if(stand_alone_flag == 1)
//				{
					found = 1;

					#ifdef ENABLE_HOST
					if(stand_alone_flag == 1)
					{
						UartSendCString("ISO14443 type B: ");
					}
			        rssi[0] = RSSI_LEVELS;			// read RSSI levels
			        Trf797xReadSingle(rssi, 1);

			        UartPutChar('[');
//			        for(j = 0; j < 4; j++)
//					{
//						UartPutByte(pupi[j]);
//					}
			        rxtx_state = j;
			        for(j = 0; j < rxtx_state-1; j++)
			        					{
			        						UartPutByte(pupi[j]);
			        					}
			        UartPutChar(',');
//			        UartPutChar('(');
			        UartPutByte(rssi[0]);
//			        UartPutChar(')');
			        UartPutChar(']');
			        UartPutCrlf();
					#endif
//				}
			}
			else
				i_reg = 0x02;
		}
		else if(i_reg == 0x02)				// collision occured
		{
//			if(stand_alone_flag == 1)
//			{
//				#ifdef ENABLE_HOST
//					UartSendCString("---collision---");
//					UartPutCrlf();
//				#endif
//			}
			collision = 0x01;
		}
//		else if(i_reg == 0x00)							// timer interrupt
//		{
//			if(stand_alone_flag == 1)
//			{
//				#ifdef ENABLE_HOST
//					UartPutChar('(');
//					UartSendCString("No tag found/Error");
//					UartPutChar(')');
//					UartPutCrlf();
//				#endif
//			}
//		}

//		if(stand_alone_flag == 1)
//		{
			if(found == 1)
			{
				LED_14443B_ON;
			}
			else
			{
				LED_14443B_OFF;
			}
//		}
		apn++;
	}
	if(collision)
	{	McuDelayMillisecond(6);
		iso14443bAnticollision(0x20, 0x02);	// Call this function for 4 timeslots
		iso14443bAnticollision(0x20, 0x00);	// Call this function for 1 timeslots
	}

//	buf[0] = 0x8F; // send WUPB to put card back in Ready-declared state
//	buf[1] = 0x91;
//	buf[2] = 0x3D;
//	buf[3] = 0x00;
//	buf[4] = 0x30;
//	buf[5] = 0x05;
//	buf[6] = 0x00;
//	buf[7] = 0x09;
//
//	rxtx_state = 1;						// the response will be stored in buf[1] upwards
//	i_reg = 0x01;
//
//	Trf797xRawWrite(&buf[0], 8);
//
//	IRQ_CLR;								// PORT2 interrupt flag clear
//	IRQ_ON;
//
//	j = 0;
//	while((i_reg == 0x01) && (j < 2))
//	{
//		j++;
//		McuCounterSet();					// TimerA set
//		COUNT_VALUE = COUNT_1ms * 5;		// 2ms
//		START_COUNTER;
//		irq_flag = 0x00;
//		while(irq_flag == 0x00)
//		{
//		}
//		STOP_COUNTER;
//	}										// wait for end of TX
//
//	i_reg = 0x01;
//	while(i_reg == 0x01)		// wait for end of RX or timeout
//	{
//		McuCounterSet();
//		COUNT_VALUE = COUNT_1ms * 5;
//		irq_flag = 0x00;
//		START_COUNTER;						// start timer up mode
//		while(irq_flag == 0x00)
//		{
//		}									// wait for interrupt
//		STOP_COUNTER;
//	}

}											// iso14443bAnticollision

u08_t Iso14443b_halt(u08_t *pupi)
{
	buf[0] = ISO_CONTROL;
	buf[1] = 0x0C;							// recieve with no CRC
	Trf797xWriteIsoControl(buf[1]);
	Trf797xReadSingle(buf,1);
	McuDelayMillisecond(6);

	buf[0] = 0x8F;
		buf[1] = 0x91;
	buf[2] = 0x3D;
	buf[3] = 0x00;
	buf[4] = 0x50;					// number of complete bytes
	buf[5] = 0x50;						//halt
	buf[6] = *pupi;
	buf[7] = *(pupi+1);
	buf[8] = *(pupi+2);
	buf[9] = *(pupi+3);

	rxtx_state = 1;
	i_reg = 0x01;

	Trf797xRawWrite(&buf[0], 10);

	IRQ_CLR;									//PORT2 interrupt flag clear
	IRQ_ON;

	while(i_reg == 0x01)
	{
		McuCounterSet();					// TimerA set
		COUNT_VALUE = COUNT_1ms * 5;
		START_COUNTER;
		irq_flag = 0x00;
		while(irq_flag == 0x00)
		{
		}
		STOP_COUNTER;
	}										// wait for end of TX

	i_reg = 0x01;
	while(i_reg == 0x01)		// wait for end of RX or timeout
	{
		McuCounterSet();
		COUNT_VALUE = COUNT_1ms * 10;
		irq_flag = 0x00;
		START_COUNTER;						// start timer up mode
		while(irq_flag == 0x00)
		{
		}									// wait for interrupt
		STOP_COUNTER;
	}										// wait for end of TX

	if (buf[1] != 0x00)				// if PICC doesn't response 0x00 means cannot do command Halt
	{
		i_reg = 0x02;
		//		UartSendCString("Halt command error \n \r");
		return 0;
	}
	else
		return 1;

}



//===============================================================
// NAME: void Iso14443bSlotMarkerCommand(u08_t number)
//
// BRIEF: Is used to execute ISO14443B Slot-Marker command.
//
// INPUTS:
//	Parameters:
//		U08_t	number		number of slots
//	
// OUTPUTS:
//
// PROCESS:	[1] Execute slot marker command
//
// CHANGE:
// DATE  		WHO	DETAIL
// 23Nov2010	RP	Original Code
//===============================================================

void
iso14443bSlotMarkerCommand(u08_t number)
{
	buf[0] = ISO_CONTROL;
	buf[1] = 0x0C;							// recieve with no CRC
	Trf797xWriteIsoControl(buf[1]);
	Trf797xReadSingle(buf,1);
	McuDelayMillisecond(6);

	buf[0] = 0x8F;
		buf[1] = 0x91;
	buf[2] = 0x3D;
	buf[3] = 0x00;
	buf[4] = 0x10;					// number of complete bytes
	buf[5] = number;

	rxtx_state = 1;
	i_reg = 0x01;

	Trf797xRawWrite(&buf[0], 6);

	IRQ_CLR;									//PORT2 interrupt flag clear
	IRQ_ON;

	while(i_reg == 0x01)
	{
		McuCounterSet();					// TimerA set
		COUNT_VALUE = COUNT_1ms * 5;
		START_COUNTER;
		irq_flag = 0x00;
		while(irq_flag == 0x00)
		{
		}
		STOP_COUNTER;
	}										// wait for end of TX

	i_reg = 0x01;
	while(i_reg == 0x01)		// wait for end of RX or timeout
	{
		McuCounterSet();
		COUNT_VALUE = COUNT_1ms * 10;
		irq_flag = 0x00;
		START_COUNTER;						// start timer up mode
		while(irq_flag == 0x00)
		{
		}									// wait for interrupt
		STOP_COUNTER;
	}

}

