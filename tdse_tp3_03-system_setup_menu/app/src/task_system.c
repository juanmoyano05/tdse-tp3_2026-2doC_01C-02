/*
 * Copyright (c) 2026 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 */

/********************** inclusions *******************************************/
/* Project includes */
#include "main.h"

/* Demo includes */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes */
#include "board.h"
#include "app.h"

#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"
#include "task_display_attribute.h"
#include "task_display_interface.h"
#include "task_system_attribute.h"
#include "task_system_interface.h"

/********************** macros and definitions *******************************/
#define DEL_SYS_MIN			0ul
#define DEL_SYS_MED			250ul
#define DEL_SYS_MAX			500ul

/* Modes to excite Task System */
typedef enum task_system_mode {NORMAL, SETUP, MODE_QTY} task_system_mode_t;

#define SYSTEM_DTA_QTY	MODE_QTY

/********************** internal data declaration ****************************/
task_system_dta_t task_system_dta_list[SYSTEM_DTA_QTY];

/********************** internal functions declaration ***********************/
void task_system_normal_statechart(void);
void task_system_setup_statechart(void);

void task_system_set_mode(task_system_mode_t);

/********************** internal data definition *****************************/
const char *p_task_system 		= "Task System (System Statechart)";
const char *p_task_system_ 		= "Non-Blocking Code";
const char *p_task_system__ 	= "(Update by Time Code, period = 1mS)";

/********************** external data declaration ****************************/
task_system_mode_t g_task_system_mode;

/********************** private functions definition  ************************/
void print_motor_status(task_system_dta_t *p_task_system_dta)
{
	char str_motor1[16] = "MOTOR 1:        ";
	char str_motor2[16] = "MOTOR 2:        ";

	if ( p_task_system_dta->m1_power ) {
		str_motor1[9] = 'O';
		str_motor1[10] = 'N';
	} else {
		str_motor1[9] = 'O';
		str_motor1[10] = 'f';
	}
	if ( p_task_system_dta->m2_power ) {
		str_motor2[9] = 'O';
		str_motor2[10] = 'N';
	} else {
		str_motor2[9] = 'O';
		str_motor2[10] = 'f';
		str_motor2[11] = 'f';
	}
	//put_event_task_display(0, 0, "MOTOR 1:ON, 8, L");
	//put_event_task_display(0, 1, "MOTOR 2:ON, 8, L");

	snprintf(str_motor1+12, sizeof(str_motor1), "%d,%d", p_task_system_dta->m1_speed, p_task_system_dta->m1_spin);
	snprintf(str_motor2+12, sizeof(str_motor2), "%d,%d", p_task_system_dta->m2_speed, p_task_system_dta->m2_spin);

	put_event_task_display(0, 0, str_motor1);
	put_event_task_display(0, 1, str_motor2);
}


/********************** external functions definition ************************/
void task_system_init(void *parameters)
{
	uint32_t index;
	task_system_dta_t 	*p_task_system_dta;
	task_system_st_t	state;
	task_system_ev_t	event;
	bool b_event;

	/* Print out: Task Initialized */
	LOGGER_INFO(" ");
	LOGGER_INFO("  %s is running - Tick [mS] = %lu", GET_NAME(task_system_init), HAL_GetTick());
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system);
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system_);
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system__);

	init_event_task_system();

	task_system_set_mode(NORMAL);

	for (index = 0; SYSTEM_DTA_QTY > index; index++)
	{
		/* Update Task System Data Pointer */
		p_task_system_dta = &task_system_dta_list[index];

		/* Init & Print out: Task execution FSM */
		state = ST_SYS_MAIN;
		p_task_system_dta->state = state;

		event = EV_SYS_IDLE;
		p_task_system_dta->event = event;

		b_event = false;
		p_task_system_dta->flag = b_event;

		p_task_system_dta->index = 0;
		p_task_system_dta->m1_speed = 8;
		p_task_system_dta->m2_speed = 8;
		p_task_system_dta->m1_power = true;
		p_task_system_dta->m2_power = true;
		p_task_system_dta->m1_spin = M1_SPIN_LEFT;
		p_task_system_dta->m2_spin = M2_SPIN_LEFT;

		LOGGER_INFO(" ");
		LOGGER_INFO("   %s = %lu   %s = %lu   %s = %s",
					GET_NAME(state), (uint32_t)state,
					GET_NAME(event), (uint32_t)event,
					GET_NAME(b_event), (b_event ? "true" : "false"));
	}

	print_motor_status(p_task_system_dta);
	//put_event_task_display(0, 0, "MOTOR 1:ON, 8, L");
	//put_event_task_display(0, 1, "MOTOR 2:ON, 8, L");

	task_system_set_mode(NORMAL);
}

void task_system_update(void *parameters)
{
	/* Run Task Statechart */
	switch (g_task_system_mode)
	{
		case NORMAL:

			task_system_normal_statechart();

			break;

		case SETUP:

			task_system_setup_statechart();

			break;

		default:

			task_system_set_mode(NORMAL);

			break;
		}
}

void task_system_normal_statechart(void)
{
	task_system_dta_t *p_task_system_dta;

	/* Update Task System Data Pointer */
	p_task_system_dta = &task_system_dta_list[NORMAL];

	if (true == any_event_task_system())
	{
		p_task_system_dta->flag = true;
		p_task_system_dta->event = get_event_task_system();
	}

	switch (p_task_system_dta->state)
	{
		case ST_SYS_MAIN:

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 2;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 0, " ENTER/NEXT/ESC ");
					put_event_task_display(0, 1, "Motor 1         ");

					break;
				case 1:
					put_event_task_display(0, 0, " ENTER/NEXT/ESC ");
					put_event_task_display(0, 1, "Motor 2         ");
					break;
				}

				p_task_system_dta->state = ST_SYS_MAIN;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU1_M1;
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU1_M2;
					p_task_system_dta->index = 0;
					break;
				}
			}
			break;

		case ST_SYS_MENU1_M1:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 3;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Power           ");
					break;
				case 1:
					put_event_task_display(0, 1, "Speed           ");
					break;
				case 2:
					put_event_task_display(0, 1, "Spin            ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU1_M1;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				print_motor_status(p_task_system_dta);

				p_task_system_dta->state = ST_SYS_MAIN;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU2_M1_POWER;
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU2_M1_SPEED;
					p_task_system_dta->index = 0;
					break;
				case 2:
					p_task_system_dta->state = ST_SYS_MENU2_M1_SPIN;
					p_task_system_dta->index = 0;
					break;
				}
			}
			break;

		case ST_SYS_MENU1_M2:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 3;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Power           ");
					break;
				case 1:
					put_event_task_display(0, 1, "Speed           ");
					break;
				case 2:
					put_event_task_display(0, 1, "Spin            ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU1_M2;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				print_motor_status(p_task_system_dta);
				p_task_system_dta->state = ST_SYS_MAIN;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU2_M2_POWER;
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU2_M2_SPEED;
					p_task_system_dta->index = 0;
					break;
				case 2:
					p_task_system_dta->state = ST_SYS_MENU2_M2_SPIN;
					p_task_system_dta->index = 0;
					break;
				}
			}
			break;

		case ST_SYS_MENU2_M1_POWER:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 2;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Off             ");
					break;
				case 1:
					put_event_task_display(0, 1, "On              ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU2_M1_POWER;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU1_M1;
				put_event_task_display(0, 1, "Power         ");

				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU3_M1_POWER_OFF;
					put_event_task_display(0, 1, "Powered off M1  ");
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU3_M1_POWER_ON;
					put_event_task_display(0, 1, "Powered on M1   ");
					p_task_system_dta->index = 0;
					break;
				}
			}
			break;

		case ST_SYS_MENU2_M1_SPEED:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 10;
				char speed_str[16];
				snprintf(speed_str, sizeof(speed_str), "%d              ", p_task_system_dta->index);
				put_event_task_display(0, 1, speed_str);
				p_task_system_dta->state = ST_SYS_MENU2_M1_SPEED;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Power           ");
				p_task_system_dta->state = ST_SYS_MENU1_M1;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->m1_speed = p_task_system_dta->index;
				put_event_task_display(0, 1, "Speed set.      ");
				p_task_system_dta->state = ST_SYS_MENU3_M1_SPEED;
				p_task_system_dta->index = 0;
			}
			break;

		case ST_SYS_MENU2_M1_SPIN:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 2;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Left            ");
					break;
				case 1:
					put_event_task_display(0, 1, "Right           ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU2_M1_SPIN;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU1_M1;
				put_event_task_display(0, 1, "Power           ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU3_M1_SPIN_LEFT;
					put_event_task_display(0, 1, "Set spin left   ");
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU3_M1_SPIN_RIGHT;
					put_event_task_display(0, 1, "Set spin right  ");
					p_task_system_dta->index = 0;
					break;
				}
				p_task_system_dta->index = 0;
			}
			break;

		case ST_SYS_MENU3_M1_POWER_OFF:
			p_task_system_dta->m1_power = false;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M1_POWER_OFF;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU2_M1_POWER;
				put_event_task_display(0, 1, "Off             ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M1_POWER_ON:
			p_task_system_dta->m1_power = true;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M1_POWER_ON;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Off             ");
				p_task_system_dta->state = ST_SYS_MENU2_M1_POWER;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M1_SPEED:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M1_SPEED;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "0               ");
				p_task_system_dta->state = ST_SYS_MENU2_M1_SPEED;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M1_SPIN_LEFT:
			p_task_system_dta->m1_spin = M1_SPIN_LEFT;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M1_SPIN_LEFT;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Left           ");
				p_task_system_dta->state = ST_SYS_MENU2_M1_SPIN;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M1_SPIN_RIGHT:
			p_task_system_dta->m1_spin = M1_SPIN_RIGHT;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M1_SPIN_RIGHT;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU2_M1_SPIN;
				put_event_task_display(0, 1, "Left           ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

			// ----------------------  MOTOR 2 ----------------------------------

		case ST_SYS_MENU2_M2_POWER:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 2;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Off             ");
					break;
				case 1:
					put_event_task_display(0, 1, "On              ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU2_M2_POWER;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU1_M2;
				put_event_task_display(0, 1, "Power         ");

				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU3_M2_POWER_OFF;
					put_event_task_display(0, 1, "Powered off M2  ");
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU3_M2_POWER_ON;
					put_event_task_display(0, 1, "Powered on M2   ");
					p_task_system_dta->index = 0;
					break;
				}
			}
			break;

		case ST_SYS_MENU2_M2_SPEED:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 10;
				char speed_str[16];
				snprintf(speed_str, sizeof(speed_str), "%d              ", p_task_system_dta->index);
				put_event_task_display(0, 1, speed_str);
				p_task_system_dta->state = ST_SYS_MENU2_M2_SPEED;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Power           ");
				p_task_system_dta->state = ST_SYS_MENU1_M2;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->m2_speed = p_task_system_dta->index;
				put_event_task_display(0, 1, "Speed set.      ");
				p_task_system_dta->state = ST_SYS_MENU3_M2_SPEED;
				p_task_system_dta->index = 0;
			}
			break;

		case ST_SYS_MENU2_M2_SPIN:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->index = (p_task_system_dta->index + 1) % 2;

				switch( p_task_system_dta->index ) {
				case 0:
					put_event_task_display(0, 1, "Left            ");
					break;
				case 1:
					put_event_task_display(0, 1, "Right           ");
					break;
				}
				p_task_system_dta->state = ST_SYS_MENU2_M2_SPIN;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU1_M2;
				put_event_task_display(0, 1, "Power           ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				switch (p_task_system_dta->index) {
				case 0:
					p_task_system_dta->state = ST_SYS_MENU3_M2_SPIN_LEFT;
					put_event_task_display(0, 1, "Set spin left   ");
					p_task_system_dta->index = 0;
					break;
				case 1:
					p_task_system_dta->state = ST_SYS_MENU3_M2_SPIN_RIGHT;
					put_event_task_display(0, 1, "Set spin right  ");
					p_task_system_dta->index = 0;
					break;
				}
				p_task_system_dta->index = 0;
			}
			break;

		case ST_SYS_MENU3_M2_POWER_OFF:
			p_task_system_dta->m2_power = false;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M2_POWER_OFF;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU2_M2_POWER;
				put_event_task_display(0, 1, "Off             ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M2_POWER_ON:
			p_task_system_dta->m2_power = true;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M2_POWER_ON;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Off             ");
				p_task_system_dta->state = ST_SYS_MENU2_M2_POWER;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M2_SPEED:
			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M2_SPEED;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "0               ");
				p_task_system_dta->state = ST_SYS_MENU2_M2_SPEED;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M2_SPIN_LEFT:
			p_task_system_dta->m2_spin = M2_SPIN_LEFT;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M2_SPIN_LEFT;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_display(0, 1, "Left           ");
				p_task_system_dta->state = ST_SYS_MENU2_M2_SPIN;
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		case ST_SYS_MENU3_M2_SPIN_RIGHT:
			p_task_system_dta->m2_spin = M2_SPIN_RIGHT;

			if ((true == p_task_system_dta->flag) && (EV_SYS_NEXT == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU3_M2_SPIN_RIGHT;
			}
			else if ((true == p_task_system_dta->flag) && (EV_SYS_ESCAPE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				p_task_system_dta->state = ST_SYS_MENU2_M2_SPIN;
				put_event_task_display(0, 1, "Left           ");
				p_task_system_dta->index = 0;
			} else if ((true == p_task_system_dta->flag) && (EV_SYS_ENTER == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
			}
			break;

		default:

			p_task_system_dta->tick  = DEL_SYS_MIN;
			p_task_system_dta->state = ST_SYS_MAIN;
			p_task_system_dta->event = EV_SYS_IDLE;
			p_task_system_dta->flag = false;

			break;
	}
}

void task_system_setup_statechart(void)
{
	task_system_dta_t *p_task_system_dta;

	/* Update Task System Data Pointer */
	p_task_system_dta = &task_system_dta_list[SETUP];

	if (true == any_event_task_system())
	{
		p_task_system_dta->flag = true;
		p_task_system_dta->event = get_event_task_system();
	}

	switch (p_task_system_dta->state)
	{/*
		case ST_SYS_IDLE:

			if ((true == p_task_system_dta->flag) && (EV_SYS_BTN_A == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_actuator(EV_LED_ACTIVE, ID_LED_A);
				p_task_system_dta->state = ST_SYS_ACTIVE;

				put_event_task_display(0, 0, "task_system_mode");
				put_event_task_display(0, 1, " NORMAL         ");

				task_system_set_mode(NORMAL);
			}

			break;

		case ST_SYS_ACTIVE:

			if ((true == p_task_system_dta->flag) && (EV_SYS_IDLE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_actuator(EV_LED_IDLE, ID_LED_A);
				p_task_system_dta->state = ST_SYS_IDLE;
			}

			break;
*/
		default:

			p_task_system_dta->tick  = DEL_SYS_MIN;
			//p_task_system_dta->state = ST_SYS_IDLE;
			p_task_system_dta->event = EV_SYS_IDLE;
			p_task_system_dta->flag = false;

			break;
	}
}

void task_system_set_mode(task_system_mode_t task_system_mode)
{
	g_task_system_mode = task_system_mode;
}

/********************** end of file ******************************************/
