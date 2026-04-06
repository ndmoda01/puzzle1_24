if (sprite_index != -1){
		
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1);
	image_angle +=10;
	
	switch(special_power){
		case noone:
			draw_self();
		break;
	
		case FROZEN:
			draw_self();
			image_blend = c_blue;
		break;

	}
}
