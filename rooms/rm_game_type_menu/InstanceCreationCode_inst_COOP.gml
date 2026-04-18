my_text = "Cooperative";
my_text_2 = "Players are working with each other towards completing goals or getting high scores. \nEach player's score is combined to make a team score"
selectable = false;
//button_xscale = 1.6;

activate_button = function(){
	obj_game.multiplayer_mode = 1;
	obj_game.sbvs = false;
	selected = true;

	inst_COMP.selected = false;
	if (inst_BLOCKOUT.selected == true){
		obj_game.game_type = -1;
		inst_BLOCKOUT.selected = false;
	}
	if (inst_COLOR_CLASH.selected == true){
		obj_game.game_type = -1;
		inst_COLOR_CLASH.selected = false;
	}
	
	//inst_START.selectable = true;
	
	//game type may have been chosen already, if so, you can open start option
	if (obj_game.number_of_players > 1){
		//if (inst_CLASSIC.selected == true) or (inst_ENDURANCE.selected == true) or (inst_MARATHON.selected == true) or (inst_CLEANUP.selected == true){
		if (inst_CLASSIC.selected == true) or (inst_MARATHON.selected == true) or (inst_CLEANUP.selected == true){
			inst_START.selectable = true;
		}
	}
	
	inst_CLASSIC.selectable = true;
	//inst_ENDURANCE.selectable = true;
	inst_MARATHON.selectable = true;
	inst_CLEANUP.selectable = true;
	inst_BLOCKOUT.selectable = false;
	inst_COLOR_CLASH.selectable = false;
	
	//obj_menu_cursor.position_index = 6;
	//obj_menu_cursor.position_index = 4;
	with(obj_menu_cursor){
		//player select positionns
		position[0] = [55, 63];
		position[1] = [55, 87];
		position[2] = [55, 199];
		position[3] = [55, 223];
		position[4] = [260,63];
		position[5] = [260,87];
		position[6] = [260,111];
		//position[7] = [260,135];
		position[7] = [470,199];
		position[8] = -1; //must be reset in case it's switched from comp to coop
		position[9] = -1;
		
		position_index = 4;
	}
	
	
}

