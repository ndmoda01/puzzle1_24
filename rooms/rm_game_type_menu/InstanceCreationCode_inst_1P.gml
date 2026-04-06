my_text = "1 Player";
my_text_x_offset = 24;
my_text_2 = "One player game";

activate_button = function(){
	obj_game.number_of_players = 1;
	obj_game.sbvs = false;
	selected = true;
	
	inst_2P.selected = false;
	if (instance_exists(inst_3P) and (instance_exists(inst_4P))){
		inst_3P.selected = false;
		inst_4P.selected = false;
	}
	
	inst_COOP.selectable = false;
	inst_COMP.selectable = false;
	
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
	
	if (inst_BLOCKOUT.selected == true){
		obj_game.game_type = -1;
		inst_START.selectable = false;
		inst_BLOCKOUT.selected = false;
	}
	
	//inst_START.selectable = true;
	inst_CLASSIC.selectable = true;
	//inst_ENDURANCE.selectable = true;
	inst_MARATHON.selectable = true;
	inst_CLEANUP.selectable = true;
	inst_BLOCKOUT.selectable = false;
	
	//next position to go to when clicked
	//game types (classic, endurance, etc)
	with(obj_menu_cursor){
		//player select positionns
		position[0] = [55, 63];
		position[1] = [55, 87];
		position[2] = [260,63];
		position[3] = [260,87];
		position[4] = [260,111];
		//position[5] = [260,135];
		position[5] = [470,199];
		position[7] = -1;
		position[8] = -1;
		position[9] = -1;
		
		position_index = 2;
	}
	//obj_menu_cursor.position_index = 4;
	//obj_menu_cursor.position_index = 6;
}