/// @description Insert description here
randomize();
debug = false;
fps_counter = 0;
fps_per_second = 0;

//max supported score 9,999,999
player1_score = 999999;
player2_score = 99999;
player3_score = 0;
player4_score = 0;
coop_score = 0;

player1_score_modifier = 1;
player2_score_modifier = 1;
player3_score_modifier = 1;
player4_score_modifier = 1;

player_max_lives = 4;
player_starting_lives = 3;
player1_lives = player_starting_lives;
player2_lives = player_starting_lives;

level = 1;
level_timer = 300*SEC;
calculated_level_score = false;
level_free_space_bonus_score = 0;
level_free_space_bonus_score_sbvs_2p = 0;
imposter_shoot_speed = 0;
level_item_selection_pool_qty = 0;
level_item_selection_pool = [];
current_room = room;

attract_mode_no_input_timer_max = SEC*60;
attract_mode_no_input_timer = attract_mode_no_input_timer_max;

ui_layout_displayed = false;
//ui_layout_displayed = true;

//endurance mode variables
remaining_items_max = 12;
remaining_items = 100;
number_of_spawning_blocks = 100;
level_starting_blocks = 0;
level_starting_blocks_sbvs_2p = 0;
endurance_level_variables_adjusted = false

//marathon mode variables
remaining_lines_max = 10;
remaining_lines = remaining_lines_max;

lines_this_level = 0;
total_lines_p1 = 999; //0;
total_lines_p2 = 0;



//blockout mode variables
rounds_won_p1 = 0;
rounds_won_p2 = 0;
round_wins_needed_to_win_match = 2;
item_spawn_rate_max_blockout = 10; //maximum speed in blockout


//cleanup mode variables
remaining_color_blocks_P1 = 10;
remaining_color_blocks_P2 = 10;
level_end_timer_max = 5*SEC;
level_end_timer = level_end_timer_max;


//color clash variables
player1_color_qty = 0;
player2_color_qty = 0;
player3_color_qty = 0;
player4_color_qty = 0;


transition_delay_max = 5*SEC;
transition_delay = transition_delay_max;

fade_in_start = 0;
fade_in_current = fade_in_start;
fade_in_max = .9;

game_over = false;
paused = false;
pause_buttons_created = false;
pause_control_display = false;
pause_surface = noone;

score_three = 20;
score_four = score_three+20;
score_five = score_three+40;
score_six = score_three+60;
score_seven = score_three+80;
score_eight = score_three+100;
score_nine = score_three+120;
score_ten = score_three+140;

//score array
scr_inst_score_initialize();

//how much time the room has to spawn objects, when it's over, no more will spawn
item_spawn_time = 2*SEC;
//how many frames until the next instance will spawn (less frames = faster spawning)
item_spawn_rate_max = 30; //default setting. Set for  each room at room start
item_spawn_rate_max_sbvs = 30; //needed so max rate can be reduced for some 2p vs modes
item_spawn_rate = item_spawn_rate_max; 
item_spawn_rate_sbvs_2 = item_spawn_rate_max; 
item_spawn_rate_reduced_rate_max = 20; //faster rate that items spawn in sbvs (max speed for any player)

//game defaults 
number_of_players = 0;
//number_of_players = 3;

//multiplayer mode: 0 = single player, 1 = multiplayer coop, 2 = multiplayer competitive
multiplayer_mode = 2;
//multiplayer_mode = 2;

//game type: 0 = classic (timer & designed levels), 1 = endurance (fruit qty & generated levels)
game_type = COLOR_CLASH;
//split board multiplayer on or off
sbvs = true;
//sbvs = false;


high_score_state = "display";
//high_score_state = "register";

page = 1;
registration_timer = 30*SEC;
registration_completed = false;
number_of_new_high_score_entries = 0;
number_of_high_scores_entered = 0;
player1_score_adjusted = false;
player1_rank = 0;
player2_score_adjusted = false;
player2_rank = 0;
player3_score_adjusted = false;
player3_rank = 0;
player4_score_adjusted = false;
player4_rank = 0;

var _hs = "hs_log.ini";

#region color arrays
//colors in hex value
color[0] = #320011;
color[1] = #5f3a60;
color[2] = #876672;
color[3] = #b7a39d;
color[4] = #ece8c2;
color[5] = #6db7c3;
color[6] = #5e80b2;
color[7] = #627057;
color[8] = #8da24e;
color[9] = #d2cb3e;
color[10] = #f7d554;
color[11] = #e8bf92;
color[12] = #e78c5b;
color[13] = #c66f5e;
color[14] = #c33846;
color[15] = #933942;

//r, g, b, a (1 is the highest it can go), so colors are in percent of 100 (shader vector style color code)
bg_color[0] = [.196, 0,.067,1];
bg_color[1] = [.373,.227,.376,1];
bg_color[2] = [.529,.400,.447,1];
bg_color[3] = [.718,.639,.616,1];
bg_color[4] = [.925, .91,.761,1];
bg_color[5] = [.427,.718,.765,1];
bg_color[6] = [.369,.502,.698,1];
bg_color[7] = [.384,.439,.341,1];
bg_color[8] = [.553,.635,.306,1];
bg_color[9] = [.824,.796,.243,1];
bg_color[10] = [.969,.835,.329,1];
bg_color[11] = [.91,.749,.573,1];
bg_color[12] = [.906,.549,.357,1];
bg_color[13] = [.776,.435,.369,1];
bg_color[14] = [.765,.220,.275,1];
bg_color[15] = [.576,.224,.259,1];

bg_color_index = 0;
#endregion

//0 single player, 1-10 scores, 1-10 initials
//1 multi coop 2p
//2 multi comp 2p
//3 multi coop 3p
//4 multi comp 3p
//5 multi coop 4p
//6 multi comp 4p 

#region high score array
high_score_array = array_create(10, -1);

if (file_exists(_hs)){
	ini_open(_hs);


	//1 player scores
	high_score_array[SINGLE_PLAYER,1] = ini_read_real("scores_1P","1",0);
	high_score_array[SINGLE_PLAYER,2] = ini_read_real("scores_1P","2",0);
	high_score_array[SINGLE_PLAYER,3] = ini_read_real("scores_1P","3",0);
	high_score_array[SINGLE_PLAYER,4] = ini_read_real("scores_1P","4",0);
	high_score_array[SINGLE_PLAYER,5] = ini_read_real("scores_1P","5",0);
	high_score_array[SINGLE_PLAYER,6] = ini_read_real("scores_1P","6",0);
	high_score_array[SINGLE_PLAYER,7] = ini_read_real("scores_1P","7",0);
	high_score_array[SINGLE_PLAYER,8] = ini_read_real("scores_1P","8",0);
	high_score_array[SINGLE_PLAYER,9] = ini_read_real("scores_1P","9",0);
	high_score_array[SINGLE_PLAYER,10] = ini_read_real("scores_1P","10",0);
	
	high_score_array[SINGLE_PLAYER,11] = ini_read_string("initials_1P","1","");
	high_score_array[SINGLE_PLAYER,12] = ini_read_string("initials_1P","2","");
	high_score_array[SINGLE_PLAYER,13] = ini_read_string("initials_1P","3","");
	high_score_array[SINGLE_PLAYER,14] = ini_read_string("initials_1P","4","");
	high_score_array[SINGLE_PLAYER,15] = ini_read_string("initials_1P","5","");
	high_score_array[SINGLE_PLAYER,16] = ini_read_string("initials_1P","6","");
	high_score_array[SINGLE_PLAYER,17] = ini_read_string("initials_1P","7","");
	high_score_array[SINGLE_PLAYER,18] = ini_read_string("initials_1P","8","");
	high_score_array[SINGLE_PLAYER,19] = ini_read_string("initials_1P","9","");
	high_score_array[SINGLE_PLAYER,20] = ini_read_string("initials_1P","10","");
	
	//2 player scores
	high_score_array[COOP_2P,1] = ini_read_real("scores_2P_coop","1",0);
	high_score_array[COOP_2P,2] = ini_read_real("scores_2P_coop","2",0);
	high_score_array[COOP_2P,3] = ini_read_real("scores_2P_coop","3",0);
	high_score_array[COOP_2P,4] = ini_read_real("scores_2P_coop","4",0);
	high_score_array[COOP_2P,5] = ini_read_real("scores_2P_coop","5",0);
	
	high_score_array[COOP_2P,11] = ini_read_string("initials_2P_coop","1","");
	high_score_array[COOP_2P,12] = ini_read_string("initials_2P_coop","2","");
	high_score_array[COOP_2P,13] = ini_read_string("initials_2P_coop","3","");
	high_score_array[COOP_2P,14] = ini_read_string("initials_2P_coop","4","");
	high_score_array[COOP_2P,15] = ini_read_string("initials_2P_coop","5","");
	
	high_score_array[COMP_2P,1] = ini_read_real("scores_2P_comp","1",0);
	high_score_array[COMP_2P,2] = ini_read_real("scores_2P_comp","2",0);
	high_score_array[COMP_2P,3] = ini_read_real("scores_2P_comp","3",0);
	high_score_array[COMP_2P,4] = ini_read_real("scores_2P_comp","4",0);
	high_score_array[COMP_2P,5] = ini_read_real("scores_2P_comp","5",0);
	
	high_score_array[COMP_2P,11] = ini_read_string("initials_2P_comp","1","");
	high_score_array[COMP_2P,12] = ini_read_string("initials_2P_comp","2","");
	high_score_array[COMP_2P,13] = ini_read_string("initials_2P_comp","3","");
	high_score_array[COMP_2P,14] = ini_read_string("initials_2P_comp","4","");
	high_score_array[COMP_2P,15] = ini_read_string("initials_2P_comp","5","");
	
	//3 player scores
	high_score_array[COOP_3P,1] = ini_read_real("scores_3P_coop","1",0);
	high_score_array[COOP_3P,2] = ini_read_real("scores_3P_coop","2",0);
	high_score_array[COOP_3P,3] =  ini_read_real("scores_3P_coop","3",0);
	high_score_array[COOP_3P,4] = ini_read_real("scores_3P_coop","4",0);
	high_score_array[COOP_3P,5] = ini_read_real("scores_3P_coop","5",0);
	
	high_score_array[COOP_3P,11] = ini_read_string("initials_3P_coop","1","");
	high_score_array[COOP_3P,12] = ini_read_string("initials_3P_coop","2","");
	high_score_array[COOP_3P,13] = ini_read_string("initials_3P_coop","3","");
	high_score_array[COOP_3P,14] = ini_read_string("initials_3P_coop","4","");
	high_score_array[COOP_3P,15] = ini_read_string("initials_3P_coop","5","");
	
	high_score_array[COMP_3P,1] = ini_read_real("scores_3P_comp","1",0);
	high_score_array[COMP_3P,2] = ini_read_real("scores_3P_comp","2",0);
	high_score_array[COMP_3P,3] =  ini_read_real("scores_3P_comp","3",0);
	high_score_array[COMP_3P,4] = ini_read_real("scores_3P_comp","4",0);
	high_score_array[COMP_3P,5] = ini_read_real("scores_3P_comp","5",0);
	
	high_score_array[COMP_3P,11] = ini_read_string("initials_3P_comp","1","");
	high_score_array[COMP_3P,12] = ini_read_string("initials_3P_comp","2","");
	high_score_array[COMP_3P,13] = ini_read_string("initials_3P_comp","3","");
	high_score_array[COMP_3P,14] = ini_read_string("initials_3P_comp","4","");
	high_score_array[COMP_3P,15] = ini_read_string("initials_3P_comp","5","");
	
	//4 player scores
	high_score_array[COOP_4P,1] = ini_read_real("scores_4P_coop","1",0);
	high_score_array[COOP_4P,2] = ini_read_real("scores_4P_coop","2",0);
	high_score_array[COOP_4P,3] =  ini_read_real("scores_4P_coop","3",0);
	high_score_array[COOP_4P,4] = ini_read_real("scores_4P_coop","4",0);
	high_score_array[COOP_4P,5] = ini_read_real("scores_4P_coop","5",0);
	
	high_score_array[COOP_4P,11] = ini_read_string("initials_4P_coop","1","");
	high_score_array[COOP_4P,12] = ini_read_string("initials_4P_coop","2","");
	high_score_array[COOP_4P,13] = ini_read_string("initials_4P_coop","3","");
	high_score_array[COOP_4P,14] = ini_read_string("initials_4P_coop","4","");
	high_score_array[COOP_4P,15] = ini_read_string("initials_4P_coop","5","");
	
	high_score_array[COMP_4P,1] = ini_read_real("scores_4P_comp","1",0);
	high_score_array[COMP_4P,2] = ini_read_real("scores_4P_comp","2",0);
	high_score_array[COMP_4P,3] =  ini_read_real("scores_4P_comp","3",0);
	high_score_array[COMP_4P,4] = ini_read_real("scores_4P_comp","4",0);
	high_score_array[COMP_4P,5] = ini_read_real("scores_4P_comp","5",0);
	
	high_score_array[COMP_4P,11] = ini_read_string("initials_4P_comp","1","");
	high_score_array[COMP_4P,12] = ini_read_string("initials_4P_comp","2","");
	high_score_array[COMP_4P,13] = ini_read_string("initials_4P_comp","3","");
	high_score_array[COMP_4P,14] = ini_read_string("initials_4P_comp","4","");
	high_score_array[COMP_4P,15] = ini_read_string("initials_4P_comp","5","");
	
	ini_close();
}
#endregion

player1_new_high_score = false;
player2_new_high_score = false;
player3_new_high_score = false;
player4_new_high_score = false;
//coop_new_high_score = false;

room_goto_next();
//room_goto(rm_4P_endurance_test);
//scr_endurance_first_time_start(1)
//room_goto(rm_ending);
//room_goto(rm_test_room_640);
//room_goto(rm_test_room_320);
//room_goto(rm_main_menu);
//room_goto(rm_game_type_menu);
//room_goto(rm_high_scores);
//room_goto(rm_attract_mode);

//scr_endurance_first_time_start(number_of_players);
//room_goto(rm_2P_endurance_sbvs);
//room_goto(rm_2P_level_MA_VS);
//room_goto(rm_2P_level_BO_VS);
//room_goto(rm_2P_level_10);
//instance_create_layer(x,y,"Instances_1",obj_space_check_cursor);
//room_goto(rm_test_room_320_2P_VS);
//room_goto(rm_2P_level10_sbvs);
//room_goto(rm_2P_level_00_RK);