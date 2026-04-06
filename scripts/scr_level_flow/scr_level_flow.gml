function scr_level_flow(){
	
	//determine next level based on number of players
	switch(number_of_players){
				
		case 1: //1 player level flow
			switch(level){	
				case 2:
					//room_goto(rm_1P_level_02);
					scr_room_goto_transition_fade(rm_1P_level_02);
				break;
				case 3:
					//room_goto(rm_1P_level_03);
					scr_room_goto_transition_fade(rm_1P_level_03);
				break;
				case 4:
					//room_goto(rm_1P_level_04);
					scr_room_goto_transition_fade(rm_1P_level_04);
				break;
				case 5:
					//room_goto(rm_1P_level_05);
					scr_room_goto_transition_fade(rm_1P_level_05);
				break;
				case 6:
					//room_goto(rm_1P_level_06);
					scr_room_goto_transition_fade(rm_1P_level_06);
				break;
				case 7:
					//room_goto(rm_1P_level_07);
					scr_room_goto_transition_fade(rm_1P_level_07);
				break;
				case 8:
					//room_goto(rm_1P_level_08);
					scr_room_goto_transition_fade(rm_1P_level_08);
				break;
				case 9:
					//room_goto(rm_1P_level_09);
					scr_room_goto_transition_fade(rm_1P_level_09);
				break;
				case 10:
					//room_goto(rm_1P_level_10);
					scr_room_goto_transition_fade(rm_1P_level_10);
				break;
				case 11:
					//room_goto(rm_ending);
					scr_room_goto_transition_fade(rm_ending);
				break;
			}
		break;
				
		case 2: //2 player level flow
			//switch to the split boards if the setting is on
			switch(level){
				case 2:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_02_VS);  //room_goto(rm_2P_level_02_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_02);  //room_goto(rm_2P_level_02);
				break;
				case 3:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_03_VS);  //room_goto(rm_2P_level_03_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_03);  //room_goto(rm_2P_level_03);
				break;
				case 4:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_04_VS);  //room_goto(rm_2P_level_04_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_04);  //room_goto(rm_2P_level_04);
				break;
				case 5:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_05_VS);  //room_goto(rm_2P_level_05_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_05);  //room_goto(rm_2P_level_05);
				break;
				case 6:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_06_VS);  //room_goto(rm_2P_level_06_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_06);  //room_goto(rm_2P_level_06);
				break;
				case 7:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_07_VS);  //room_goto(rm_2P_level_07_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_07);  //room_goto(rm_2P_level_07);
				break;
				case 8:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_08_VS);  //room_goto(rm_2P_level_08_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_08);  //room_goto(rm_2P_level_08);
				break;
				case 9:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_09_VS);  // room_goto(rm_2P_level_09_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_09);  //room_goto(rm_2P_level_09);
				break;
				case 10:
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_10_VS);  //room_goto(rm_2P_level_10_VS);	
					else scr_room_goto_transition_fade(rm_2P_level_10);  //room_goto(rm_2P_level_10);
				break;
				case 11:
					room_goto(rm_ending);
					//scr_room_goto_transition_fade(rm_ending);
				break;		
			}
		break;
				
		case 3: //3 player level flow
			switch(level){	
				case 2:
					room_goto(rm_3P_level2a);
				break;
				case 3:
					room_goto(rm_3P_level3a);
				break;
				case 4:
					room_goto(rm_3P_level4a);
				break;
				case 5:
					room_goto(rm_3P_level5a);
				break;
				case 6:
					room_goto(rm_3P_level6a);
				break;
				case 7:
					room_goto(rm_3P_level7a);
				break;
				case 8:
					room_goto(rm_3P_level8a);
				break;
				case 9:
					room_goto(rm_3P_level9);
				break;
				case 10:
					room_goto(rm_3P_level10);
				break;
				case 11:
					room_goto(rm_ending);
				break;
			}
		break;
				
		case 4: //4 player level flow
			switch(level){	
				case 2:
					room_goto(rm_4P_level2a);
				break;
				case 3:
					room_goto(rm_4P_level3a);
				break;
				case 4:
					room_goto(rm_4P_level4a);
				break;
				case 5:
					room_goto(rm_4P_level5a);
				break;
				case 6:
					room_goto(rm_4P_level6a);
				break;
				case 7:
					room_goto(rm_4P_level7a);
				break;
				case 8:
					room_goto(rm_4P_level8a);
				break;
				case 9:
					room_goto(rm_4P_level9a);
				break;
				case 10:
					room_goto(rm_4P_level10a);
				break;
				case 11:
					room_goto(rm_ending);
				break;
			}
		break;
	}

}