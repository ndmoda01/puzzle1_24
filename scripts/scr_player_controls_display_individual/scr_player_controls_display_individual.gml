///@arg x
///@arg y
///@arg player_number

function scr_player_controls_display_individual(argument0,argument1,argument2){

	var _x, _y, _player_number;
	//_x = 120;
	_x = argument0;
	_x_buffer = 270;
	_y = argument1;
	_y_buffer = 30;
	_player_number = argument2;
	draw_set_font(fnt_game_gui_medium_2);
	
	switch(_player_number){
		case 1:
			//draw_set_halign(fa_right);
			//draw_text(_x,_y+_y_buffer, "Up: ");
			//draw_text(_x,_y+(_y_buffer*2), "Down: ");
			//draw_text(_x,_y+(_y_buffer*3), "Left: ");
			//draw_text(_x,_y+(_y_buffer*4), "Right: ");
			//draw_text(_x,_y+(_y_buffer*5), "Select: ");
			////draw_text(_x,_y+(_y_buffer*6), "PAD #: ");
				
			//draw_set_halign(fa_left);
			//draw_text(_x,_y, "Player 1");
			//draw_text(_x,_y+_y_buffer, "W / D-pad Up");
			//draw_text(_x,_y+(_y_buffer*2), "S / D-pad Down");
			//draw_text(_x,_y+(_y_buffer*3), "A / D-pad Left");
			//draw_text(_x,_y+(_y_buffer*4), "D / D-pad Right");
			//draw_text(_x,_y+(_y_buffer*5), "E / A Button");
			////draw_text(_x,_y+(_y_buffer*6), "Controller #1");
			//draw_set_font(fnt_game_gui);
			
			draw_set_halign(fa_right);
			draw_text(_x,_y+_y_buffer, "Move: ");
			draw_text(_x,_y+(_y_buffer+48), "Pick / Drop: ");
			//draw_text(_x,_y+(_y_buffer*6), "PAD #: ");
				
			draw_set_halign(fa_left);
			//draw_text(_x,_y, "Player 1");
			if (gamepad_is_connected(0)){ 
				draw_text(_x,_y+_y_buffer, "D-pad");
				draw_text(_x,_y+(_y_buffer+48), "A Button");
			}
			else{
				draw_text(_x,_y+_y_buffer, "W,A,S,D");
				draw_text(_x,_y+(_y_buffer+48), "E");
			}
			//draw_text(_x,_y+(_y_buffer*6), "Controller #1");
			draw_set_font(fnt_game_gui);
		break;
				
		case 2:
			//draw_set_halign(fa_right);
			//draw_text(_x,_y+_y_buffer, "Up: ");
			//draw_text(_x,_y+(_y_buffer*2), "Down: ");
			//draw_text(_x,_y+(_y_buffer*3), "Left: ");
			//draw_text(_x,_y+(_y_buffer*4), "Right: ");
			//draw_text(_x,_y+(_y_buffer*5), "Select: ");
			////draw_text(_x,_y+(_y_buffer*6), "PAD #: ");
		
			//draw_set_halign(fa_left);
			//draw_text(_x,_y, "Player 2");
			//draw_text(_x,_y+_y_buffer, "I / D-pad Up");
			//draw_text(_x,_y+(_y_buffer*2), "K / D-pad Down");
			//draw_text(_x,_y+(_y_buffer*3), "J / D-pad Left");
			//draw_text(_x,_y+(_y_buffer*4), "L / D-pad Right");
			//draw_text(_x,_y+(_y_buffer*5), "U / A Button");
			////draw_text(_x,_y+(_y_buffer*6), "Controller #2");
			//draw_set_font(fnt_game_gui);
			
			draw_set_halign(fa_right);
			draw_text(_x,_y+_y_buffer, "Move: ");
			draw_text(_x,_y+(_y_buffer+48), "Pick / Drop: ");
			//draw_text(_x,_y+(_y_buffer*6), "PAD #: ");
		
			draw_set_halign(fa_left);
			//draw_text(_x,_y, "Player 2");
			//draw_text(_x,_y+_y_buffer, "I,K,J,L / D-pad");
			//draw_text(_x,_y+(_y_buffer*2), "U / A Button");
			//draw_text(_x,_y+(_y_buffer*6), "Controller #2");
			if (gamepad_is_connected(1)){ 
				draw_text(_x,_y+_y_buffer, "D-pad");
				draw_text(_x,_y+(_y_buffer+48), "A Button");
			}
			else{
				draw_text(_x,_y+_y_buffer, "I,K,J,L");
				draw_text(_x,_y+(_y_buffer+48), "U");
			}
			draw_set_font(fnt_game_gui);
			
		break;
			
		case 3:
			draw_set_halign(fa_right);
			draw_text(_x,_y+_y_buffer, "Move: ");
			draw_text(_x,_y+(_y_buffer*2), "Select: ");
			
			draw_set_halign(fa_left);
			draw_text(_x,_y, "Player 3");
			draw_text(_x,_y+_y_buffer, "U,D,L,R / D-pad");
			draw_text(_x,_y+(_y_buffer*2), "Shift / A Button"); 
			//draw_text(_x,_y+(_y_buffer*6), "Controller #3");
			draw_set_font(fnt_game_gui);
		break;

		case 4:				
			draw_set_halign(fa_right);
			draw_text(_x,_y+_y_buffer, "Move: ");
			draw_text(_x,_y+(_y_buffer*2), "Select: ");
			
			draw_set_halign(fa_left);
			draw_text(_x,_y, "Player 4"); 
			draw_text(_x,_y+_y_buffer, "8,5,4,6 / D-pad");
			draw_text(_x,_y+(_y_buffer*2), "7 / A Button"); 
			//draw_text(_x,_y+(_y_buffer*6), "Controller #4");
			draw_set_font(fnt_game_gui);
		break;		
	}
}