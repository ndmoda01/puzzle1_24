my_text = "Competitive";
my_text_2 = "Players are competing against each other for high scores or to complete level goals."; 
selectable = false;
//button_xscale = 1.6;

activate_button = function(){
	obj_game.multiplayer_mode = 2;
	obj_game.sbvs = true;
	selected = true;

	inst_COOP.selected = false;
	//inst_START.selectable = true;
	//game type may have been chosen already, if so, you can open start option
	if (obj_game.number_of_players > 1){
		//if (inst_CLASSIC.selected == true) or (inst_ENDURANCE.selected == true) or (inst_MARATHON.selected == true) or (inst_CLEANUP.selected == true) or (inst_BLOCKOUT.selected == true){
		if (inst_CLASSIC.selected == true) or (inst_MARATHON.selected == true) or (inst_CLEANUP.selected == true) or (inst_BLOCKOUT.selected == true){
			inst_START.selectable = true;
		}
	}
	
	inst_CLASSIC.selectable = true;
	//inst_ENDURANCE.selectable = true;
	inst_MARATHON.selectable = true;
	inst_CLEANUP.selectable = true;
	inst_BLOCKOUT.selectable = true;
	
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
		position[7] = [260,135];
		//position[8] = [260,159];
		position[8] = [470,199];
		position[9] = -1;
		
		position_index = 4;
	}
}