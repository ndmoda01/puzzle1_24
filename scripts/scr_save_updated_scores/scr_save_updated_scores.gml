// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_save_updated_scores(){
	var _hs = "hs_log.ini";
	
	if (file_exists(_hs)){
		ini_open(_hs);
		
		if (multiplayer_mode == SINGLE_PLAYER){
			ini_write_real("scores_1P","1",high_score_array[SINGLE_PLAYER,1]);
			ini_write_real("scores_1P","2",high_score_array[SINGLE_PLAYER,2]);
			ini_write_real("scores_1P","3",high_score_array[SINGLE_PLAYER,3]);
			ini_write_real("scores_1P","4",high_score_array[SINGLE_PLAYER,4]);
			ini_write_real("scores_1P","5",high_score_array[SINGLE_PLAYER,5]);
			ini_write_real("scores_1P","6",high_score_array[SINGLE_PLAYER,6]);
			ini_write_real("scores_1P","7",high_score_array[SINGLE_PLAYER,7]);
			ini_write_real("scores_1P","8",high_score_array[SINGLE_PLAYER,8]);
			ini_write_real("scores_1P","9",high_score_array[SINGLE_PLAYER,9]);
			ini_write_real("scores_1P","10",high_score_array[SINGLE_PLAYER,10]);
		
			ini_write_string("initials_1P","1",high_score_array[SINGLE_PLAYER,11]);
			ini_write_string("initials_1P","2",high_score_array[SINGLE_PLAYER,12]);
			ini_write_string("initials_1P","3",high_score_array[SINGLE_PLAYER,13]);
			ini_write_string("initials_1P","4",high_score_array[SINGLE_PLAYER,14]);
			ini_write_string("initials_1P","5",high_score_array[SINGLE_PLAYER,15]);
			ini_write_string("initials_1P","6",high_score_array[SINGLE_PLAYER,16]);
			ini_write_string("initials_1P","7",high_score_array[SINGLE_PLAYER,17]);
			ini_write_string("initials_1P","8",high_score_array[SINGLE_PLAYER,18]);
			ini_write_string("initials_1P","9",high_score_array[SINGLE_PLAYER,19]);
			ini_write_string("initials_1P","10",high_score_array[SINGLE_PLAYER,20]);
		}
		
		if (multiplayer_mode == MULTI_COOP){
			switch(number_of_players){
				case 2:
					ini_write_real("scores_2P_coop","1",high_score_array[COOP_2P,1]);
					ini_write_real("scores_2P_coop","2",high_score_array[COOP_2P,2]);
					ini_write_real("scores_2P_coop","3",high_score_array[COOP_2P,3]);
					ini_write_real("scores_2P_coop","4",high_score_array[COOP_2P,4]);
					ini_write_real("scores_2P_coop","5",high_score_array[COOP_2P,5]);
					
					ini_write_string("initials_2P_coop","1",high_score_array[COOP_2P,11]);
					ini_write_string("initials_2P_coop","2",high_score_array[COOP_2P,12]);
					ini_write_string("initials_2P_coop","3",high_score_array[COOP_2P,13]);
					ini_write_string("initials_2P_coop","4",high_score_array[COOP_2P,14]);
					ini_write_string("initials_2P_coop","5",high_score_array[COOP_2P,15]);
				break;
				case 3:
					ini_write_real("scores_3P_coop","1",high_score_array[COOP_3P,1]);
					ini_write_real("scores_3P_coop","2",high_score_array[COOP_3P,2]);
					ini_write_real("scores_3P_coop","3",high_score_array[COOP_3P,3]);
					ini_write_real("scores_3P_coop","4",high_score_array[COOP_3P,4]);
					ini_write_real("scores_3P_coop","5",high_score_array[COOP_3P,5]);
					
					ini_write_string("initials_3P_coop","1",high_score_array[COOP_3P,11]);
					ini_write_string("initials_3P_coop","2",high_score_array[COOP_3P,12]);
					ini_write_string("initials_3P_coop","3",high_score_array[COOP_3P,13]);
					ini_write_string("initials_3P_coop","4",high_score_array[COOP_3P,14]);
					ini_write_string("initials_3P_coop","5",high_score_array[COOP_3P,15]);
				break;
				case 4:
					ini_write_real("scores_4P_coop","1",high_score_array[COOP_4P,1]);
					ini_write_real("scores_4P_coop","2",high_score_array[COOP_4P,2]);
					ini_write_real("scores_4P_coop","3",high_score_array[COOP_4P,3]);
					ini_write_real("scores_4P_coop","4",high_score_array[COOP_4P,4]);
					ini_write_real("scores_4P_coop","5",high_score_array[COOP_4P,5]);
					
					ini_write_string("initials_4P_coop","1",high_score_array[COOP_4P,11]);
					ini_write_string("initials_4P_coop","2",high_score_array[COOP_4P,12]);
					ini_write_string("initials_4P_coop","3",high_score_array[COOP_4P,13]);
					ini_write_string("initials_4P_coop","4",high_score_array[COOP_4P,14]);
					ini_write_string("initials_4P_coop","5",high_score_array[COOP_4P,15]);
				break;	
			}
		}
		
		if (multiplayer_mode == MULTI_COMP){
			switch(number_of_players){
				case 2:
					ini_write_real("scores_2P_comp","1",high_score_array[COMP_2P,1]);
					ini_write_real("scores_2P_comp","2",high_score_array[COMP_2P,2]);
					ini_write_real("scores_2P_comp","3",high_score_array[COMP_2P,3]);
					ini_write_real("scores_2P_comp","4",high_score_array[COMP_2P,4]);
					ini_write_real("scores_2P_comp","5",high_score_array[COMP_2P,5]);
					
					ini_write_string("initials_2P_comp","1",high_score_array[COMP_2P,11]);
					ini_write_string("initials_2P_comp","2",high_score_array[COMP_2P,12]);
					ini_write_string("initials_2P_comp","3",high_score_array[COMP_2P,13]);
					ini_write_string("initials_2P_comp","4",high_score_array[COMP_2P,14]);
					ini_write_string("initials_2P_comp","5",high_score_array[COMP_2P,15]);
				break;
				case 3:
					ini_write_real("scores_3P_comp","1",high_score_array[COMP_3P,1]);
					ini_write_real("scores_3P_comp","2",high_score_array[COMP_3P,2]);
					ini_write_real("scores_3P_comp","3",high_score_array[COMP_3P,3]);
					ini_write_real("scores_3P_comp","4",high_score_array[COMP_3P,4]);
					ini_write_real("scores_3P_comp","5",high_score_array[COMP_3P,5]);
					
					ini_write_string("initials_3P_comp","1",high_score_array[COMP_3P,11]);
					ini_write_string("initials_3P_comp","2",high_score_array[COMP_3P,12]);
					ini_write_string("initials_3P_comp","3",high_score_array[COMP_3P,13]);
					ini_write_string("initials_3P_comp","4",high_score_array[COMP_3P,14]);
					ini_write_string("initials_3P_comp","5",high_score_array[COMP_3P,15]);
				break;
				case 4:
					ini_write_real("scores_4P_comp","1",high_score_array[COMP_4P,1]);
					ini_write_real("scores_4P_comp","2",high_score_array[COMP_4P,2]);
					ini_write_real("scores_4P_comp","3",high_score_array[COMP_4P,3]);
					ini_write_real("scores_4P_comp","4",high_score_array[COMP_4P,4]);
					ini_write_real("scores_4P_comp","5",high_score_array[COMP_4P,5]);
					
					ini_write_string("initials_4P_comp","1",high_score_array[COMP_4P,11]);
					ini_write_string("initials_4P_comp","2",high_score_array[COMP_4P,12]);
					ini_write_string("initials_4P_comp","3",high_score_array[COMP_4P,13]);
					ini_write_string("initials_4P_comp","4",high_score_array[COMP_4P,14]);
					ini_write_string("initials_4P_comp","5",high_score_array[COMP_4P,15]);
				break;
			}
		}
		ini_close();
	}
}