my_text = "Start Game"
my_text_x_offset = 20;
my_text_2 = "Start the game with the current settings";

selectable = false;

activate_button = function(){
	if (selectable == true){
		//instance_create_depth(x,y,-1000,obj_room_transition);
		switch(obj_game.number_of_players){
			case 1:
					//room_goto(rm_1P_level0);
					scr_room_goto_transition(rm_1P_level_00);
			break;
			
			case 2:
					//room_goto(rm_2P_level0);
					scr_room_goto_transition(rm_2P_level_00);
			break;
			
			case 3:
					//room_goto(rm_3P_level0);
					scr_room_goto_transition(rm_3P_level0);
			break;
			
			case 4:
					//room_goto(rm_4P_level0);
					scr_room_goto_transition(rm_4P_level0);
			break;
		}
	}
}