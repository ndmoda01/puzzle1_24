my_text = "START";
selectable = false;

activate_button = function(){
	if (selectable == true){
		switch(obj_game.number_of_players){
			case 1:
					room_goto(rm_1P_level0);
			break;
			
			case 2:
					room_goto(rm_2P_level0);
			break;
			
			case 3:
					room_goto(rm_3P_level0);
			break;
			
			case 4:
					room_goto(rm_4P_level0);
			break;
		}
	}
}