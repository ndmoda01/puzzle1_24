//effect for split board knockouts
if (instance_exists(obj_player1)) and (obj_player1.knocked_out == true) and (my_player_board == 1){
	instance_create_layer(x+8,y+8,"Instances_1",obj_implosion);
}
if (instance_exists(obj_player2)) and (obj_player2.knocked_out == true) and (my_player_board == 2){
	instance_create_layer(x+8,y+8,"Instances_1",obj_implosion);
}

//effect for regular game over
if (obj_game.game_over == true){
	instance_create_layer(x+8,y+8,"Instances_1",obj_implosion);
}
else{
	
	//changing explosion color based on scored direction
	//switch(my_score_direction){
	//	case -1: my_color = c_white; break;		
	//	case 0: my_color = c_green; break;	
	//	case 1: my_color = c_yellow; break;	
	//	case 2: my_color = c_blue; break;	
	//	case 3: my_color = c_red; break;	
	//}
	

	
	/*
	//changing explosion color based on scored direction
	switch(my_score_direction){
		case -1: 
			var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
			_dir.image_index = 4;
		break;		
		case 0: 
			var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
			_dir.image_index = 0;
		break;	
		case 1: 
			var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
			_dir.image_index = 1;
	
		break;	
		case 2: 
			var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
			_dir.image_index = 2;
	
		break;	
		case 3: 
			var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
			_dir.image_index = 3;
	
		break;	
	}
	*/
	
	//loop through multiple times if needed to show all directions
	for (var i = 0; i < array_length(my_score_direction_array);i++){
		var _score_dir = my_score_direction_array[i];
		
		//changing explosion color based on scored direction
		switch(_score_dir){
			case -1: 
				var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
				_dir.image_index = 4;
			break;		
			case 0: //horizontal
				var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
				_dir.image_index = 0;
				//var _slice = instance_create_layer(x,y,"Instances_1",obj_sliced_item);
				//    _slice.sprite_index = spr_apple2_p1_split_h_2;
			break;	
			case 1: //vertical
				var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
				_dir.image_index = 1;
				//var _slice = instance_create_layer(x,y,"Instances_1",obj_sliced_item);
				//_slice.sprite_index = spr_apple2_p1_split_v_2;
	
			break;	
			case 2: //forward slash
				var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
				_dir.image_index = 2;
				//var _slice = instance_create_layer(x,y,"Instances_1",obj_sliced_item);
				//_slice.sprite_index = spr_apple2_p1_split_fs_2;
				
			break;	
			case 3: //back slash
				var _dir = instance_create_layer(x,y,"Walls",obj_score_direction_card); 
				_dir.image_index = 3;
				//var _slice = instance_create_layer(x,y,"Instances_1",obj_sliced_item);
				//_slice.sprite_index = spr_apple2_p1_split_bs_2;
	
			break;	
		}
	}
	
	//repeat(8){
	var _parts_qty = my_collection_qty*2;
	var _buff = round(360/_parts_qty);
	var i=0;
	
	repeat(_parts_qty){
		var _part = instance_create_layer(x+8,y+8,"Instances_1",obj_explode_particle);
		_part.image_blend = my_color;
		//_part.my_lifespan = irandom_range(my_collection_qty*4,my_collection_qty*10);
		_part.my_lifespan = my_collection_qty*5;
		//_part.my_lifespan = 30;
		//_part.move_speed = irandom_range(round(my_collection_qty/9)+1,(my_collection_qty/3)+1);
		_part.move_speed = round(my_collection_qty/2);
		//_part.move_speed = 2;
		_part.my_creator_id = id;
		var _offset = 0; //i*;
		_part.direction = (_buff*i)+_offset;
		i++;
	}
}