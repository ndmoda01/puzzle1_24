my_text = "Endurance";
my_text_2 = "Difficulty gradually increases every level.\nEarn points while progressing through as many stages as possible.\nLevels are completed once all the current level's lines have been scored. \nBonus given based on the amount of the play board cleared at the end of the level.\nBlocks are gathered into the middle of the play board at the end of each level.";
selectable = false;
//button_xscale = 1.6;

activate_button = function(){
	obj_game.game_type = ENDURANCE;
	selected = true;

	inst_CLASSIC.selected = false;
	inst_MARATHON.selected = false;
	inst_BLOCKOUT.selected = false;
	inst_CLEANUP.selected = false;
	
	
	//confirm scoring mode has been chosen if more than one player selected
	if (obj_game.number_of_players > 1){
		if (inst_COOP.selected == true) or (inst_COMP.selected == true){
			inst_START.selectable = true;
		}
		
	}
	else {
		if (inst_1P.selected == true) inst_START.selectable = true;
	}
	
	//obj_menu_cursor.position_index = 8;
	//obj_menu_cursor.position_index = 9;
	if (obj_game.number_of_players == 1){
		with(obj_menu_cursor){
			//player select positionns
			position[0] = [55, 63];
			position[1] = [55, 87];
			position[2] = [260,63];
			position[3] = [260,87];
			position[4] = [260,111];
			position[5] = [260,135];
			position[6] = [470,159];
			position[7] = [470,199];
		
			position_index = 6;
		}
	}
	if (obj_game.number_of_players >= 2){
		with(obj_menu_cursor){
			
			//if the last position is full,over write it and add
			if (position[9] != -1) {
				position[9] = [470,159];	
				position[10] = [470,199];	
				position_index = 9;
			}
			//if it's not full, then overwrite 8 and add position 9
			if (position[9] == -1){
				position[8] = [470,159];	
				position[9] = [470,199];	
				position_index = 8;
			}
		}
	}
}