function scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height){
	
	var _shoot_dir = irandom_range(1,4);
	switch(_shoot_dir){
			
		//bottom wall
		case 1:
					
			//x value min to outside the view, y at the bottom of view
			x = irandom_range(_view_x,_view_x+_view_width);
			y = _view_y+_view_height;
					
			image_angle = 90;
		break;
		//top wall
		case 2:
					
			//x value min to outside the view, y at the top of view
			x = irandom_range(_view_x,_view_x+_view_width);
			y = _view_y;
					
			image_angle = 270;
		break;
		//left wall
		case 3:
					
			//x as far to the right, y random range from min to max value
			x = _view_x;
			y = irandom_range(_view_y, _view_y+_view_height);
						
			image_angle = 0;
		break;

		//right wall
		case 4:
					
			//x as far to the right, y random range from min to max value
			x = _view_x+_view_width;
			y = irandom_range(_view_y, _view_y+_view_height);
					
			image_angle = 180;
		break;
	}

}