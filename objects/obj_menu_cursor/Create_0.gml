/// @description Insert description here
if (live_call()) return live_result;
move_amount = 32;

position = array_create(20,-1);
position_index = 0;

if (room ==  rm_main_menu){
	position[0] = [285, 184]; 
	position[1] = [285, 216]; 
	position[2] = [285, 248]; 
	position[3] = [285, 280]; 
	position[4] = [285, 312];
}



if (room ==  rm_game_type_menu){
	
	//initial movement options when entering the room
	//remaining options are changed in the buttons when clicked to open up next menu options
	if (obj_game.number_of_players == 0){
		//player select positoins
		position[0] = [55, 63];
		position[1] = [55, 87];
		//position[2] = [80, 167];
		//position[3] = [80, 191];
	
		//back to main menu
		position[2] = [470,199];
	}
	
	//if (obj_game.number_of_players == 1){
	//	//player select positionns
	//	position[0] = [55, 63];
	//	position[1] = [55, 87];
			
	//	//game types (classic, endurance, etc)
	//	position[2] = [260,63];
	//	position[3] = [260,87];
	//	position[4] = [260,111];
	//	position[5] = [260,135];
	//	position[6] = [260,159];
			
	//	//back to main menu
	//	position[7] = [470,199];
	//}
	
//	if (obj_game.number_of_players >=2){
//		position[0] = [55, 63];
//		position[1] = [55, 87];
//		//game mode positions (coop or competitive)
//		position[2] = [55, 199];
//		position[3] = [55, 223];
	
//		//game types (classic, endurance, etc)
//		position[4] = [260,63];
//		position[5] = [260,87];
//		position[6] = [260,111];
//		position[7] = [260,135];
//		position[8] = [260,159];
	
//		//start
//		position[9] = [470,159];
	
//		//back to main menu
//		position[10] = [470,199];
//	}
}

if (obj_game.paused == true){
	position[0] = [260, 128]; //resume
	position[1] = [260, 173]; //end game
	position[2] = [260, 218]; //main menu
	//position[3] = [260, 160]; //controls
	//position[4] = [260, 200]; //quit
}