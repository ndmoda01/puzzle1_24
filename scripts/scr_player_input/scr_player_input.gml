///@arg player_number

function scr_player_input(argument0){
	
	var _player_number = argument0;
	
	switch(_player_number){
		
		case 1:
			key_left = gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check(0, gp_padl) || keyboard_check_pressed(ord("A")) || keyboard_check(ord("A"));
			key_right = gamepad_button_check_pressed(0, gp_padr) || gamepad_button_check(0, gp_padr) || keyboard_check_pressed(ord("D")) || keyboard_check(ord("D"));
			key_up = gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check(0, gp_padu) || keyboard_check_pressed(ord("W")) || keyboard_check(ord("W"));
			key_down = gamepad_button_check_pressed(0, gp_padd) || gamepad_button_check(0, gp_padd) || keyboard_check_pressed(ord("S")) || keyboard_check(ord("S"));
			
			key_run = gamepad_button_check(0, gp_face3) || keyboard_check(vk_lshift) || keyboard_check(ord("C"));
			key_select = gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(ord("Q"));
			//key_pause = gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_escape);
			
			//controller analog stick support, how to process directions if controller connected
			if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2) or (abs(gamepad_axis_value(0,gp_axislv)) > 0.2){
		
				//get raw analog data from stick
				var _axislh_input = gamepad_axis_value(0,gp_axislh);
				var _axislv_input = gamepad_axis_value(0,gp_axislv);
				
				//can only move in 1 direction at a time, so other directions must be zero out
				//if the horizontal value is higher, the intended direction is horizontal, so update only horizontal directions
				//ceil must be used to round up input to 1
				if (abs(_axislh_input) > abs(_axislv_input)){
					key_left = ceil(abs(min(gamepad_axis_value(0,gp_axislh),0))); //negative value
					key_right = ceil(max(gamepad_axis_value(0,gp_axislh),0));
					key_up = 0;
					key_down = 0;
				}

				if (abs(_axislh_input) < abs(_axislv_input)){
					key_left = 0;
					key_right = 0;
					key_up = ceil(abs(min(gamepad_axis_value(0,gp_axislv),0))); //negative value
					key_down = ceil(max(gamepad_axis_value(0,gp_axislv),0));
				}
			}
			
			
		break;
		
		case 2:
			key_left = gamepad_button_check_pressed(1, gp_padl) || gamepad_button_check(1, gp_padl) || keyboard_check_pressed(ord("J")) || keyboard_check(ord("J"));
			key_right = gamepad_button_check_pressed(1, gp_padr) || gamepad_button_check(1, gp_padr) || keyboard_check_pressed(ord("L")) || keyboard_check(ord("L"));
			key_up = gamepad_button_check_pressed(1, gp_padu) || gamepad_button_check(1, gp_padu) || keyboard_check_pressed(ord("I")) || keyboard_check(ord("I"));
			key_down = gamepad_button_check_pressed(1, gp_padd) || gamepad_button_check(1, gp_padd) || keyboard_check_pressed(ord("K")) || keyboard_check(ord("K"));
	
			key_run = gamepad_button_check(1, gp_face3) || keyboard_check(vk_space) || keyboard_check(ord("N"));
			key_select = gamepad_button_check_pressed(1, gp_face1) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(ord("U"));
			
			//controller analog stick support, how to process directions if controller connected
			if (abs(gamepad_axis_value(1,gp_axislh)) > 0.2) or (abs(gamepad_axis_value(1,gp_axislv)) > 0.2){
		
				//get raw analog data from stick
				var _axislh_input = gamepad_axis_value(1,gp_axislh);
				var _axislv_input = gamepad_axis_value(1,gp_axislv);
				
				if (abs(_axislh_input) > abs(_axislv_input)){
					key_left = ceil(abs(min(gamepad_axis_value(1,gp_axislh),0))); //negative value
					key_right = ceil(max(gamepad_axis_value(1,gp_axislh),0));
					key_up = 0;
					key_down = 0;
				}

				if (abs(_axislh_input) < abs(_axislv_input)){
					key_left = 0;
					key_right = 0;
					key_up = ceil(abs(min(gamepad_axis_value(1,gp_axislv),0))); //negative value
					key_down = ceil(max(gamepad_axis_value(1,gp_axislv),0));
				}
			}
		break;
		
		case 3:
			key_left = gamepad_button_check_pressed(2, gp_padl) || gamepad_button_check(2, gp_padl) || keyboard_check_pressed(vk_left) || keyboard_check(vk_left);
			key_right = gamepad_button_check_pressed(2, gp_padr) || gamepad_button_check(2, gp_padr) || keyboard_check_pressed(vk_right) || keyboard_check(vk_right);
			key_up = gamepad_button_check_pressed(2, gp_padu) || gamepad_button_check(2, gp_padu) || keyboard_check_pressed(vk_up) || keyboard_check(vk_up);
			key_down = gamepad_button_check_pressed(2, gp_padd) || gamepad_button_check(2, gp_padd) || keyboard_check_pressed(vk_down) || keyboard_check(vk_down) ;
			
			key_run = gamepad_button_check(2, gp_face3) || keyboard_check(vk_rcontrol) || keyboard_check(vk_enter);
			key_select = gamepad_button_check_pressed(2, gp_face1) || keyboard_check_pressed(vk_rshift);
		break;
		
		case 4:
			key_left = gamepad_button_check_pressed(3, gp_padl) || gamepad_button_check(3, gp_padl) || keyboard_check_pressed(vk_numpad4)|| keyboard_check(vk_numpad4) || keyboard_check_pressed(ord("F")) || keyboard_check(ord("F"));
			key_right = gamepad_button_check_pressed(3, gp_padr) || gamepad_button_check(3, gp_padr) || keyboard_check_pressed(vk_numpad6) || keyboard_check(vk_numpad6)|| keyboard_check_pressed(ord("H")) || keyboard_check(ord("H"));
			key_up = gamepad_button_check_pressed(3, gp_padu) || gamepad_button_check(3, gp_padu) || keyboard_check_pressed(vk_numpad8) || keyboard_check(vk_numpad8) || keyboard_check_pressed(ord("T")) || keyboard_check(ord("T"));
			key_down = gamepad_button_check_pressed(3, gp_padd) || gamepad_button_check(3, gp_padd) || keyboard_check_pressed(vk_numpad5) || keyboard_check(vk_numpad5) || keyboard_check_pressed(ord("G"))|| keyboard_check(ord("G"));
			
			key_run = gamepad_button_check(3, gp_face3) || keyboard_check(vk_numpad0) || keyboard_check(ord("V"));
			key_select = gamepad_button_check_pressed(3, gp_face1) || keyboard_check_pressed(vk_numpad7) || keyboard_check_pressed(vk_numpad9) || keyboard_check_pressed(ord("R")) || keyboard_check_pressed(ord("Y"));
		break;
		
	}
}