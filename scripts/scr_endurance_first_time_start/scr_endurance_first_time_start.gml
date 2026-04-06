//this runs for the first time and sets up the mode's initial variables
///@arg numb_of_players

function scr_endurance_first_time_start(argument0){
	
	var _numb_of_players = argument0;	
	
	//variables that are the same for all player counts
	bg_color_index = 0;
	item_spawn_rate_max = 70; //higher = slower
	item_spawn_rate = item_spawn_rate_max;
	imposter_shoot_speed = 5;
	
	
	switch(_numb_of_players){
		case 1: 
			room_goto(rm_1P_level_EN);
			remaining_items_max = 20;
			remaining_items = remaining_items_max;
			level_item_percent_full = .60;			
		break;
		case 2: 
			//split board vs mode
			if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP){
				room_goto(rm_2P_level_EN_VS);
				remaining_items_max = 20;
				remaining_items = remaining_items_max;
				level_item_percent_full = .60;		
				
			}
			//coop or shared board comp
			else{
				room_goto(rm_2P_level_EN);
				remaining_items_max = 40;
				remaining_items = remaining_items_max;
				level_item_percent_full = .62;
			}
		
		break;
		case 3: room_goto(rm_3P_endurance);
			remaining_items_max = 60;
			remaining_items = remaining_items_max;
			level_item_percent_full = .64;
		break;
		case 4: room_goto(rm_4P_endurance);
			remaining_items_max = 80;
			remaining_items = remaining_items_max;
			level_item_percent_full = .68;
		break;
	
	}
}