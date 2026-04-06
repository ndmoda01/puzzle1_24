my_text = "4 Players";
activate_button = function(){
	obj_game.number_of_players = 4;
	selected = true;
	inst_1P.selected = false;
	inst_2P.selected = false;
	inst_3P.selected = false;
	
	inst_COOP.selectable = true;
	inst_COMP.selectable = true;
	
	inst_COOP.selected = false;
	inst_COMP.selected = false;
	obj_game.game_mode = 0;
	
	inst_START.selectable = false;
	
	obj_menu_cursor.position_index = 4;
}