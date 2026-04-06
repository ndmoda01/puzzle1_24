if (my_target_id != noone){
	
	//determine type of object to create
	if (my_type_unknown = true){
		var _type = noone;
		switch(my_type){
			
			case BANANA: _type = obj_banana;
					sprite_index = spr_banana2_p1_imposter;
					my_target_id.image_blend = #F7D554;	
			break;
			
			case APPLE: _type = obj_apple;
					sprite_index = spr_apple2_p1_imposter;
					my_target_id.image_blend = #C33846;
			break;
			
			case LIME: _type = obj_lime;
					sprite_index = spr_lime2_p1_imposter;
					my_target_id.image_blend = #8DA24E;
			break;
			
			case BLUEBERRY: _type = obj_blueberry;
					sprite_index = spr_blueberry4_imposter;
					my_target_id.image_blend = #5E80B2;
			break;
			
			case ORANGE: _type = obj_orange;
					sprite_index = spr_orange_p1_imposter;
					my_target_id.image_blend = #E78C5B;
			break;
			
			case LEMON: _type = obj_lemon;
					sprite_index = spr_lemon_p1_imposter;
					my_target_id.image_blend = #F7D554;
			break;
			
			case PEAR: _type = obj_pear;
					sprite_index = spr_pear_p1_imposter;
					my_target_id.image_blend = #8DA24E;
			break;
			
			case PUMPKIN: _type = obj_pumpkin;
					sprite_index = spr_pumpkin_p1_imposter;
					my_target_id.image_blend = #E78C5B;
			break;
			
			case STRAWBERRY: _type = obj_strawberry;
					sprite_index = spr_strawberry_p1_imposter;
					my_target_id.image_blend = #933942;
			break;
			
			case WATERMELON: _type = obj_watermelon;
					sprite_index = spr_watermelon_p1_imposter;
					my_target_id.image_blend = #627057;
			break;
			
			case BLOCK: _type = obj_block;
					sprite_index = spr_block_1x1_imposter_2;
			break;
			
			case ROCK: _type = obj_rock;
					sprite_index = spr_rock_1x1_imposter_2;
			break;
			//this code can't actually run and seems
			//to error out if you put it in each case statement
			//becaues the else  statement below is using _type and it will be locked
			//into this code block
			my_type_unknown = false;
		}	
	}
	
	//set in motion toward target
	if (!point_in_rectangle(x,y,my_target_center_x-1,my_target_center_y-1,my_target_center_x+1,my_target_center_y+1)){
		//point toward the middle of your target
		direction = point_direction(x,y,my_target_center_x,my_target_center_y);
		if (distance_to_point(my_target_center_x,my_target_center_y) > my_speed){
			x +=lengthdir_x(my_speed,direction);
			y +=lengthdir_y(my_speed,direction);
		}
		//if your speed would push you past the target, incriment until you get there
		else{
			while(!point_in_rectangle(x,y,my_target_center_x-1,my_target_center_y-1,my_target_center_x+1,my_target_center_y+1)){
				x +=lengthdir_x(1,direction);
				y +=lengthdir_y(1,direction);
			}
		}
	}
	//once you've reached your target
	else{
		var _new_item = instance_create_layer(my_target_id.x,my_target_id.y,"Instances_1", _type);
		_new_item.special_power = special_power;
		_new_item.my_player_board = my_player_board;
		
		//destroy target and imposter
		instance_destroy(my_target_id);
		instance_destroy();
	}
}