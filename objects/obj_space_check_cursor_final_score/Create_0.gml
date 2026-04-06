empty_space_bonus = 10;

start_x = obj_space_check_start.x;
start_y = obj_space_check_start.y;

x = start_x;
y = start_y;

move_amount = 16;

final_level_score = 0;

//run through each row to see if space is free, 
var _row_number = 1;

while(!place_meeting(x,y,obj_space_check_stop)){

	//check to see if you're at the end of the line
	if (place_meeting(x,y,obj_space_check_wall)){
		
		//return back to the start x, and ofset y
		x = start_x;
		y = start_y+(move_amount*_row_number);
		
		//increase row number
		_row_number++;
	}
	
	//check to see if something is there
	if (place_free(x,y)){
		//no need to make these in competitive mode
		if (obj_game.multiplayer_mode == SINGLE_PLAYER) or (obj_game.multiplayer_mode == MULTI_COOP) or ((obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP)){
			var _inst_score_card = instance_create_layer(x,y,"Instances_1",obj_score_card);
			_inst_score_card.my_score = empty_space_bonus;
			_inst_score_card.my_lifespan = 30*SEC;
		
			//add your score to the final level score
			final_level_score += _inst_score_card.my_score
		}
		
	}
	
	//move
	x += move_amount;
}

if (place_meeting(x,y,obj_space_check_stop)){
	instance_destroy();
}