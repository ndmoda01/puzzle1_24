my_text = "Blockout (VS)";
my_text_2 = "This is a two player battle mode.\nCollect large item lines to send rocks to opponent's play board.\nIf your board fills up, you are knocked out and lose a life.\nLose all your lives and you lose the game.";
selectable = false;
//button_xscale = 1.6;

activate_button = function(){
	obj_game.game_type = BLOCKOUT;
	selected = true;

	inst_CLASSIC.selected = false;
	//inst_ENDURANCE.selected = false;
	inst_MARATHON.selected = false;
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
	if (obj_game.number_of_players >= 2){
		with(obj_menu_cursor){
			
			//if the last position is full,over write it and add
			if (position[8] != -1) {
				position[0] = [55, 63];
				position[1] = [55, 87];
				
				position[2] = [55, 199];
				position[3] = [55, 223];
				
				position[4] = [260,63];
				position[5] = [260,87];
				position[6] = [260,111];
				position[7] = [260,135];
				
				position[8] = [470,159];	
				position[9] = [470,199];	
			
				position_index = 8;
			}
			//if it's not full, then overwrite 8 and add position 9
			if (position[8] == -1){
				position[0] = [55, 63];
				position[1] = [55, 87];
				
				position[2] = [55, 199];
				position[3] = [55, 223];
				
				position[4] = [260,63];
				position[5] = [260,87];
				position[6] = [260,111];
				
				position[7] = [470,159];	
				position[8] = [470,199];	
				position[9] = -1;
				
				position_index = 7;
			}
		}
	}
}