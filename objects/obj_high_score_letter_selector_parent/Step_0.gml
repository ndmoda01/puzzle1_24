if (has_control == true){
	scr_player_input(player_number);
}

//set up a movement manager to limit the number of movements when a key is held down
if (movement_manager < 3){
	if (key_right){
		if ((x+x_jump) <= max_x){
			x = x+x_jump;
			x_pos +=1;
			
			if (x != xprevious){
				//incriment this only after moving
				movement_manager+=movement_timer;
			}
		}
	}
	if (key_left){
		if ((x-x_jump) >= min_x){
			x = x-x_jump;
			x_pos -=1;
			
			if (x != xprevious){
				//incriment this only after moving
				movement_manager+=movement_timer;
			}
		}
	}
	if (key_up){
		if ((y-y_jump) >= min_y){
			y = y-y_jump;
			y_pos -=1;
			
			if (y != yprevious){
				movement_manager+=movement_timer;
			}
		}
	}
	if (key_down){
		if ((y+y_jump) <= max_y){
			y = y+y_jump;
			y_pos +=1;
			
			if (y != yprevious){
				movement_manager+=movement_timer;
			}
		}
	}
}

//reduce the movement delay
movement_manager--;
movement_manager = max(0, movement_manager);

if (key_select){
	
	//filter by row
	switch(y_pos){
		
		//top row
		case 0:
			switch(x_pos){
				case 0: scr_add_letter_to_initials("A");
				break;
				case 1: scr_add_letter_to_initials("B");
				break;
				case 2: scr_add_letter_to_initials("C");
				break;
				case 3: scr_add_letter_to_initials("D");
				break;
				case 4: scr_add_letter_to_initials("E");
				break;
				case 5: scr_add_letter_to_initials("F");
				break;
				case 6: scr_add_letter_to_initials("G");
				break;
				case 7: scr_add_letter_to_initials("H");
				break;
				case 8: scr_add_letter_to_initials("I");
				break;
				case 9: scr_add_letter_to_initials("J");
				break;
			}
		break;
		
		//middle row
		case 1:
			switch(x_pos){	
				case 0: scr_add_letter_to_initials("K");
				break;
				case 1: scr_add_letter_to_initials("L");
				break;
				case 2: scr_add_letter_to_initials("M");
				break;
				case 3: scr_add_letter_to_initials("N");
				break;
				case 4: scr_add_letter_to_initials("O");
				break;
				case 5: scr_add_letter_to_initials("P");
				break;
				case 6: scr_add_letter_to_initials("Q");
				break;
				case 7: scr_add_letter_to_initials("R");
				break;
				case 8: scr_add_letter_to_initials("S");
				break;
				case 9: scr_add_letter_to_initials("T");
				break;
			}	
		break;
		
		//bottom row
		case 2:
			switch(x_pos){	
				case 0: scr_add_letter_to_initials("U");
				break;
				case 1: scr_add_letter_to_initials("V");
				break;
				case 2: scr_add_letter_to_initials("W");
				break;
				case 3: scr_add_letter_to_initials("X");
				break;
				case 4: scr_add_letter_to_initials("Y");
				break;
				case 5: scr_add_letter_to_initials("Z");
				break;
				case 6: scr_add_letter_to_initials(".");
				break;
				case 7: scr_add_letter_to_initials("-");
				break;
				//del
				case 8: 
						if (initial != ""){
							
							//string delete index starts at position 1
							initial = string_delete(initial,number_of_initials_entered,2);
							number_of_initials_entered--;
							
							
						}
				break;
				//end
				case 9: 
						if (score_entered = false){
							has_control = false;
							sprite_index = -1;
							audio_play_sound(snd_button_selected,5,false);
							obj_game.number_of_high_scores_entered ++;
							if (obj_game.number_of_high_scores_entered >= obj_game.number_of_new_high_score_entries){
								obj_game.registration_completed = true;
							}
							score_entered = true;
						}
				break;
			}
		break;
	}	
}