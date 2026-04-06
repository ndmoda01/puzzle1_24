// Inherit the parent event
event_inherited();
player_number = 1;

//update sprite index if there is a coop high score
if (obj_game.multiplayer_mode == MULTI_COOP){
	switch(obj_game.number_of_players){
		case 2: sprite_index = spr_high_score_letter_selector_2P_COOP;	
		break;
		case 3: sprite_index = spr_high_score_letter_selector_3P_COOP;	
		break;
		case 4: sprite_index = spr_high_score_letter_selector_4P_COOP;	
		break;
	}
}
