my_text = "2 Players";
my_text_x_offset = 24;
my_text_2 = "Two player game";

activate_button = function(){
	obj_game.number_of_players = 2;
	//obj_game.sbvs = false;
	selected = true;
	inst_1P.selected = false;
	if (instance_exists(inst_3P) and (instance_exists(inst_4P))){
		inst_3P.selected = false;
		inst_4P.selected = false;
	}
	
	inst_COOP.selectable = true;
	inst_COMP.selectable = true;
	
	inst_COOP.selected = false;
	inst_COMP.selected = false;
	
	inst_CLASSIC.selectable = false;
	inst_MARATHON.selectable = false;
	inst_BLOCKOUT.selectable = false;
	inst_CLEANUP.selectable = false;
	
	inst_CLASSIC.selected = false;
	inst_MARATHON.selected = false;
	inst_BLOCKOUT.selected = false;
	inst_CLEANUP.selected = false;
	
	obj_game.multiplayer_mode = 0;
	
	inst_START.selectable = false;
	
	//obj_menu_cursor.position_index = 4;
	//obj_menu_cursor.position_index = 2;
	
	with(obj_menu_cursor){
		position[0] = [55, 63];
		position[1] = [55, 87];
		//game mode positions (coop or competitive)
		position[2] = [55, 199];
		position[3] = [55, 223];
		position[4] = [470,199];
		position[5] = -1;
		position[6] = -1;
		position[7] = -1;
		position[8] = -1;
		position[9] = -1;
		
		position_index = 2;
	}
}