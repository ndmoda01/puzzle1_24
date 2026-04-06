///@arg x
///@arg y

function scr_player_controls_display(argument0,argument1){

	var _x, _y;
	//_x = 120;
	_x = argument0;
	_x_buffer = 270;
	_y = argument1;
	_y_buffer = 36;
	
	draw_line(_x-6,_y+20,1600,_y+20);
	
	draw_set_halign(fa_right);
	draw_text(_x-10,_y+_y_buffer, "Move: ");
	draw_text(_x-10,_y+(_y_buffer*2), "Move Fast (Hold): ");
	draw_text(_x-10,_y+(_y_buffer*3), "Pickup / Drop: ");
	draw_text(_x-10,_y+(_y_buffer*4), "Controller #: ");
				
	draw_set_halign(fa_left);
	draw_text(_x,_y-15, "Player 1");
	draw_text(_x,_y+_y_buffer, "W,S,A,D");
	draw_text(_x,_y+(_y_buffer*2), "Shift");
	draw_text(_x,_y+(_y_buffer*3), "E");
	draw_text(_x,_y+(_y_buffer*4), "1");
				
	draw_text(_x+(_x_buffer*1),_y-15, "Player 2");
	draw_text(_x+(_x_buffer*1),_y+_y_buffer, "I,K,J,L");
	draw_text(_x+(_x_buffer*1),_y+(_y_buffer*2), "Space");
	draw_text(_x+(_x_buffer*1),_y+(_y_buffer*3), "U");
	draw_text(_x+(_x_buffer*1),_y+(_y_buffer*4), "2");
	
	draw_text(_x+(_x_buffer*2),_y-15, "Controller");
	draw_text(_x+(_x_buffer*2),_y+_y_buffer, "D-pad");
	draw_text(_x+(_x_buffer*2),_y+(_y_buffer*2), "X Button"); 
	draw_text(_x+(_x_buffer*2),_y+(_y_buffer*3), "A Button"); 
	
	//draw_text(_x+(_x_buffer*2),_y-15, "Player 3");
	//draw_text(_x+(_x_buffer*2),_y+_y_buffer, "Arrow U,D,L,R");
	//draw_text(_x+(_x_buffer*2),_y+(_y_buffer*2), "Right Ctrl"); 
	//draw_text(_x+(_x_buffer*2),_y+(_y_buffer*3), "Right Shift"); 
	//draw_text(_x+(_x_buffer*2),_y+(_y_buffer*4), "3");
				
	//draw_text(_x+(_x_buffer*3),_y-15, "Player 4"); 
	//draw_text(_x+(_x_buffer*3),_y+_y_buffer, "Num 8,5,4,6");
	//draw_text(_x+(_x_buffer*3),_y+(_y_buffer*2), "Num 0"); 
	//draw_text(_x+(_x_buffer*3),_y+(_y_buffer*3), "Num 7"); 
	//draw_text(_x+(_x_buffer*3),_y+(_y_buffer*4), "4");
				
	//draw_text(_x+(_x_buffer*4),_y-15, "Controller");
	//draw_text(_x+(_x_buffer*4),_y+_y_buffer, "D-pad");
	//draw_text(_x+(_x_buffer*4),_y+(_y_buffer*2), "X Button"); 
	//draw_text(_x+(_x_buffer*4),_y+(_y_buffer*3), "A Button"); 
}