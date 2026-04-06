// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_for_new_high_score(){

//check for high score
		switch (multiplayer_mode){
			
			case SINGLE_PLAYER:
				//check to see if higher than last place, if it is, set to register and enter name
				if (player1_score > high_score_array[SINGLE_PLAYER,10]){
					player1_new_high_score = true;
					scr_new_high_score_detected();
				}
				//no high score
				else{
					if (alarm[0] < 0){
						if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_released(vk_anykey)){
							//room_goto(rm_main_menu);
							scr_room_goto_transition(rm_main_menu);
						}
					}
				}
			break;
			
			case MULTI_COOP:
				switch(number_of_players){
					case 2:
						//check to see if combined higher than last place, if it is, set to register and enter name
						if ((player1_score+player2_score) > high_score_array[COOP_2P,5]){
							//set this to true so player 1 can input the score for the group
							player1_new_high_score = true;
							scr_new_high_score_detected();		
						}
					break;
					case 3:
						if ((player1_score+player2_score+player3_score) > high_score_array[COOP_3P,5]){
							player1_new_high_score = true;
							scr_new_high_score_detected();
						}
					break;
					case 4:
						if ((player1_score+player2_score+player3_score+player4_score) > high_score_array[COOP_4P,5]){
							player1_new_high_score = true;
							scr_new_high_score_detected();
						}
					break;
				}
				//no high score
				if (player1_new_high_score == false){
					if (alarm[0] < 0){
						if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_released(vk_anykey)){
							//room_goto(rm_main_menu);
							scr_room_goto_transition(rm_main_menu);
						}
					}
				}
			break;
			
			case MULTI_COMP:
				switch(number_of_players){
					case 2:
						//check to see if any player higher than last place, if it is, set to register and enter name
						if (player1_score > high_score_array[COMP_2P,5]){
							player1_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player2_score > high_score_array[COMP_2P,5]){
							player2_new_high_score = true;
							scr_new_high_score_detected();
						}
						//no high score
						if (player1_new_high_score == false) and (player2_new_high_score == false){
							if (alarm[0] < 0){
								if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_released(vk_anykey)){
									//room_goto(rm_main_menu);
									scr_room_goto_transition(rm_main_menu);
								}
							}
						}
					break;
					case 3:
						//check to see if any player higher than last place, if it is, set to register and enter name
						if (player1_score > high_score_array[COMP_3P,5]){
							player1_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player2_score > high_score_array[COMP_3P,5]){
							player2_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player3_score > high_score_array[COMP_3P,5]){	
							player3_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player1_new_high_score == false) and (player2_new_high_score == false) and (player3_new_high_score == false){
							if (alarm[0] < 0){
								if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_released(vk_anykey)){
									//room_goto(rm_main_menu);
									scr_room_goto_transition(rm_main_menu);
								}	
							}
						}
					break;
					case 4:
						//check to see if any player higher than last place, if it is, set to register and enter name
						if (player1_score > high_score_array[COMP_4P,5]){
							player1_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player2_score > high_score_array[COMP_4P,5]){
							player2_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player3_score > high_score_array[COMP_4P,5]){
							player3_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player4_score > high_score_array[COMP_4P,5]){
							player4_new_high_score = true;
							scr_new_high_score_detected();
						}
						if (player1_new_high_score == false) and (player2_new_high_score == false) and (player3_new_high_score == false) and (player4_new_high_score == false){
							if (alarm[0] < 0){
								if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_released(vk_anykey)){
									//room_goto(rm_main_menu);
									scr_room_goto_transition(rm_main_menu);
								}	
							}
						}
					break;
				}
		
			break;	
	}
}