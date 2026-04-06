if (live_call()) return live_result;

//so you can't look too far outside room
x = clamp(x, view_w_half + buff, room_width -view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height -view_h_half - buff);

//screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length)*shake_magnitude));

	//camera_set_view_size(cam,640,360);
	//camera_set_view_pos(cam,0,0);
	//x_room_offset = 0;
	//y_room_offset = 0;
	
//update camera view
if (obj_game.paused == true){
	paused = true;
	
	if (current_camera_saved == false){
		//get current view variables
		//must have "view_camera[0]" instead of 0 as the argument now
		current_camera_width = camera_get_view_width(view_camera[0]);
		current_camera_height = camera_get_view_height(view_camera[0]);
		current_x_room_offset = x_room_offset;
		current_y_room_offset = y_room_offset;
		current_camera_x = x;
		current_camera_y = y;
		current_camera_saved = true;
	}
	//set view back to normal for pause menu
	camera_set_view_size(cam,640,360);
	camera_set_view_pos(cam,0,0);
	x_room_offset = 0;
	y_room_offset = 0;

}
else{
	if (paused == true){
		paused = false;
	
		//reset all view variables back
		camera_set_view_size(cam,current_camera_width, current_camera_height);
		camera_set_view_pos(cam,current_camera_x,current_camera_y);
		x_room_offset = current_x_room_offset;
		y_room_offset = current_y_room_offset;	
		
	}
	camera_set_view_pos(cam,x -view_w_half+x_room_offset,y -view_h_half+y_room_offset);
}