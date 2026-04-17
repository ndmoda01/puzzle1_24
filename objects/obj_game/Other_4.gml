/// @description Insert description here
if (live_call()) return live_result;
//reset
level_end_timer = level_end_timer_max;
calculated_level_score = false;
var _level_timer = 130*SEC;
var _spawn_timer = 120*SEC;

switch(room){
	
	#region //1 player
	case rm_1P_level_01: scr_level_start(_level_timer,_spawn_timer,60,4,3,[1,2,3],.6,false);    break;
	case rm_1P_level_02: scr_level_start(_level_timer,_spawn_timer,54,5,3,[2,3,4],.6,false);    break;
	case rm_1P_level_03: scr_level_start(_level_timer,_spawn_timer,50,6,3,[3,4,5],.45,false);   break;
	case rm_1P_level_04: scr_level_start(_level_timer,_spawn_timer,44,8,4,[1,2,3,4],.5,false);  break;
	case rm_1P_level_05: scr_level_start(_level_timer,_spawn_timer,38,8,4,[2,3,4,5],.45,false); break;
	case rm_1P_level_06: scr_level_start(_level_timer,_spawn_timer,40,9,4,[1,3,4,5],.4,false);  break;
	case rm_1P_level_07: scr_level_start(_level_timer,_spawn_timer,38,10,4,[1,2,4,5],.4,false); break;
	case rm_1P_level_08: scr_level_start(_level_timer,_spawn_timer,34,10,3,[1,2,3],.45,false);  break;
	case rm_1P_level_09: scr_level_start(_level_timer,_spawn_timer,36,11,4,[2,3,4,5],.4,false); break;
	case rm_1P_level_10: scr_level_start(_level_timer,_spawn_timer,32,12,4,[1,2,3,4],.4,false); break;
	case rm_1P_level_EN: scr_endurance_room_start();								  break;
	case rm_1P_level_MA: scr_level_start(_level_timer,_spawn_timer,58,4,3,[1,2,3],.6,false);    break;
	case rm_1P_level_CU: scr_level_start(_level_timer,_spawn_timer,62,4,3,[1,2,3],.2,false);    break;
	#endregion
	
	#region //2 player
	case rm_2P_level_01: scr_level_start(_level_timer,_spawn_timer,40,3,3,[1,2,3],.6,false);    break;
	case rm_2P_level_02: scr_level_start(_level_timer,_spawn_timer,34,5,3,[2,3,4],.55,false);   break;
	case rm_2P_level_03: scr_level_start(_level_timer,_spawn_timer,30,6,3,[3,4,5],.55,false);   break;
	case rm_2P_level_04: scr_level_start(_level_timer,_spawn_timer,28,8,4,[1,2,3,4],.55,false); break;
	case rm_2P_level_05: scr_level_start(_level_timer,_spawn_timer,24,8,4,[2,3,4,5],.55,false); break;
	case rm_2P_level_06: scr_level_start(_level_timer,_spawn_timer,23,10,4,[2,3,4,5],.55,false);break;
	case rm_2P_level_07: scr_level_start(_level_timer,_spawn_timer,22,10,4,[1,3,4,5],.55,false);break;
	case rm_2P_level_08: scr_level_start(_level_timer,_spawn_timer,21,12,4,[1,2,4,5],.55,false);break;
	case rm_2P_level_09: scr_level_start(_level_timer,_spawn_timer,20,12,4,[1,2,3,5],.4,false); break;
	case rm_2P_level_10: scr_level_start(_level_timer,_spawn_timer,18,13,4,[1,2,3,4],.45,false);break;
	case rm_2P_level_EN: scr_endurance_room_start();                                  break;
	case rm_2P_level_MA: scr_level_start(_level_timer,_spawn_timer,34,3,3,[1,2,3],.6,false);    break;
	case rm_2P_level_CU: scr_level_start(_level_timer,_spawn_timer,45,3,3,[1,2,3],.2,false);    break;
	
	#endregion
	
	#region //2 player vs
	case rm_2P_level_01_VS: scr_level_start(_level_timer,_spawn_timer,60,4,3,[1,2,3],.6,true);   break;
	case rm_2P_level_02_VS: scr_level_start(_level_timer,_spawn_timer,54,5,3,[2,3,4],.6,true);   break;
	case rm_2P_level_03_VS: scr_level_start(_level_timer,_spawn_timer,50,6,3,[3,4,5],.45,true);  break;
	case rm_2P_level_04_VS: scr_level_start(_level_timer,_spawn_timer,44,8,4,[1,2,3,4],.5,true); break;
	case rm_2P_level_05_VS: scr_level_start(_level_timer,_spawn_timer,38,8,4,[2,3,4,5],.50,true);break;
	case rm_2P_level_06_VS: scr_level_start(_level_timer,_spawn_timer,40,9,4,[1,3,4,5],.4,true); break;
	case rm_2P_level_07_VS: scr_level_start(_level_timer,_spawn_timer,38,10,4,[1,2,4,5],.4,true);break;
	case rm_2P_level_08_VS: scr_level_start(_level_timer,_spawn_timer,34,10,3,[1,2,3],.45,true); break;
	case rm_2P_level_09_VS: scr_level_start(_level_timer,_spawn_timer,36,11,4,[2,3,4,5],.4,true);break;
	case rm_2P_level_10_VS: scr_level_start(_level_timer,_spawn_timer,32,12,4,[1,2,3,4],.4,true);break;
	case rm_2P_level_EN_VS: scr_endurance_room_start();                                break;
	case rm_2P_level_MA_VS: scr_level_start(_level_timer,_spawn_timer,58,4,3,[1,2,3],.6,true);   break;
	case rm_2P_level_CU_VS: scr_level_start(_level_timer,_spawn_timer,62,4,3,[1,2,3],.2,true);   break;
	case rm_2P_level_BO_VS: scr_level_start(_level_timer,_spawn_timer,42,8,4,[1,2,3,4],.7,true);   break;
	case rm_2P_level_BO_VS_02: scr_level_start(_level_timer,_spawn_timer,36,10,4,[2,3,4,5],.7,true);   break;
	case rm_2P_level_BO_VS_03: scr_level_start(_level_timer,_spawn_timer,32,12,4,[1,2,4,5],.7,true);   break;
	case rm_2P_level_CC_1: scr_level_start(_level_timer,_spawn_timer,34,3,3,[1,2,3],.7,false);    break;
	case rm_2P_level_CC_2: scr_level_start(_level_timer,_spawn_timer,28,3,3,[1,2,3],.7,false);    break;
	case rm_2P_level_CC_3: scr_level_start(_level_timer,_spawn_timer,20,3,3,[1,2,3],.7,false);    break;
	
	#endregion
	
	#region //3 player
	case rm_3P_level1:
		level_timer = 20*SEC;
		item_spawn_time = 15*SEC;
		item_spawn_rate_max = 90;
		imposter_shoot_speed = 2;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [1,2,3];
		//number_of_starting_items = 30;
		level_item_percent_full = .42;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level1a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 65;
		imposter_shoot_speed = 3;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [1,2,3];
		//number_of_starting_items = 55;
		level_item_percent_full = .50;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level2:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 60;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [2,3,4];
		//number_of_starting_items = 45;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level2a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 60;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [2,3,4];
		//number_of_starting_items = 55;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level3:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 55;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [3,4,5];
		//number_of_starting_items = 60;
		level_item_percent_full = .50;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level3a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 55;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [3,4,5];
		//number_of_starting_items = 80;
		level_item_percent_full = .5;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level4:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 50;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,3,4];
		//number_of_starting_items = 65;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level4a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 50;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,3,4];
		//number_of_starting_items = 110;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level5:
		level_timer = 60*SEC;
		item_spawn_time = 57*SEC;
		item_spawn_rate_max = 40;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,5];
		//number_of_starting_items = 92;
		level_item_percent_full = .57;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level5a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 45;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,5];
		//number_of_starting_items = 92;
		level_item_percent_full = .57;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level6:
		level_timer = 40*SEC;
		item_spawn_time = 38*SEC;
		item_spawn_rate_max = 35;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,3,4,5];
		//number_of_starting_items = 65;
		level_item_percent_full = .58;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level6a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 40;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,3,4,5];
		//number_of_starting_items = 97;
		level_item_percent_full = .58;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	//8'
	case rm_3P_level7:
		level_timer = 60*SEC;
		item_spawn_time = 57*SEC;
		item_spawn_rate_max = 30;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,1,4,5];
		//number_of_starting_items = 105;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level7a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 35;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,1,4,5];
		//number_of_starting_items = 105;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level8:
		level_timer = 40*SEC;
		item_spawn_time = 38*SEC;
		item_spawn_rate_max = 25;
		imposter_shoot_speed = 12;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,1,5];
		//number_of_starting_items = 60;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	//9'
	case rm_3P_level8a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 32;
		imposter_shoot_speed = 11;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,1];
		//number_of_starting_items = 60;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	//11'
	case rm_3P_level9:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 28;
		imposter_shoot_speed = 12;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,4,5];
		//number_of_starting_items = 100;
		level_item_percent_full = .40;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_level10:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 26;
		imposter_shoot_speed = 13;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,3,4];
		//number_of_starting_items = 110;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_3P_endurance:
		scr_endurance_room_start();
	break;
	
	#endregion
	
	#region //4 player
	case rm_4P_level1:
		level_timer = 20*SEC;
		item_spawn_time = 15*SEC;
		item_spawn_rate_max = 90;
		imposter_shoot_speed = 2;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [1,2,3];
		//number_of_starting_items = 30;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level1a:
		level_timer = 30*SEC;
		item_spawn_time = 27*SEC;
		item_spawn_rate_max = 90;
		imposter_shoot_speed = 2;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [1,2,3];
		//number_of_starting_items = 55;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level1b:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 60;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [1,2,3];
		//number_of_starting_items = 55;
		level_item_percent_full = .50;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level2:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 60;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [2,3,4];
		//number_of_starting_items = 40;
		level_item_percent_full = .50;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level2a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 58;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [2,3,4];
		//number_of_starting_items = 60;
		level_item_percent_full = .50;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level3:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 55;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [3,4,5];
		//number_of_starting_items = 60;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level3a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 55;
		imposter_shoot_speed = 5;
		//level_item_range_min = 1;
		//level_item_range_max = 3;
		level_item_selection_pool_qty = 3;
		level_item_selection_pool = [3,4,5];
		//number_of_starting_items = 80;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level4:
		level_timer = 30*SEC;
		item_spawn_time = 28*SEC;
		item_spawn_rate_max = 50;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,3,4];
		//number_of_starting_items = 60;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level4a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 50;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,2,3,4];
		//number_of_starting_items = 110;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level5:
		level_timer = 60*SEC;
		item_spawn_time = 57*SEC;
		item_spawn_rate_max = 40;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,5];
		//number_of_starting_items = 92;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level5a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 40;
		imposter_shoot_speed = 8;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,5];
		//number_of_starting_items = 92;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level6:
		level_timer = 40*SEC;
		item_spawn_time = 38*SEC;
		item_spawn_rate_max = 35;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,3,4,5];
		//number_of_starting_items = 70;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level6a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 36;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [1,3,4,5];
		//number_of_starting_items = 100;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level7:
		level_timer = 60*SEC;
		item_spawn_time = 57*SEC;
		item_spawn_rate_max = 30;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,1,5];
		//number_of_starting_items = 100;
		level_item_percent_full = .60;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level7a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 32;
		imposter_shoot_speed = 10;
		//level_item_range_min = 1;
		//level_item_range_max = 4;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,1,5];
		//number_of_starting_items = 100;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level8:
		level_timer = 40*SEC;
		item_spawn_time = 38*SEC;
		item_spawn_rate_max = 25;
		imposter_shoot_speed = 12;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,5,4,1];
		//number_of_starting_items = 60;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level8a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 30;
		imposter_shoot_speed = 11;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,5,4,1];
		//number_of_starting_items = 60;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level9:
		level_timer = 60*SEC;
		item_spawn_time = 57*SEC;
		item_spawn_rate_max = 24;
		imposter_shoot_speed = 12;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [5,3,4,1];
		//number_of_starting_items = 120;
		level_item_percent_full = .40;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level9a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 26;
		imposter_shoot_speed = 12;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [5,3,4,1];
		//number_of_starting_items = 120;
		level_item_percent_full = .40;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level10:
		level_timer = 70*SEC;
		item_spawn_time = 67*SEC;
		item_spawn_rate_max = 22;
		imposter_shoot_speed = 13;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,1];
		//number_of_starting_items = 110;
		level_item_percent_full = .45;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_level10a:
		level_timer = 180*SEC;
		item_spawn_time = 175*SEC;
		item_spawn_rate_max = 22;
		imposter_shoot_speed = 13;
		//level_item_range_min = 2;
		//level_item_range_max = 5;
		level_item_selection_pool_qty = 4;
		level_item_selection_pool = [2,3,4,1];
		//number_of_starting_items = 110;
		level_item_percent_full = .55;
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	break;
	
	case rm_4P_endurance:
		scr_endurance_room_start();
	break;
	#endregion
	
	case rm_attract_mode: scr_level_start(300*SEC,295*SEC,80,20,4,[1,2,3,4],.05,false); break;
	
	case rm_high_scores:
		page = 1;
		
		//create the selectors
		if (player1_new_high_score == true){
			var _select1 = instance_create_layer(233,139,"Instances_2",obj_high_score_letter_selector_player1);
		}
		if (player2_new_high_score == true){
			var _select2 = instance_create_layer(233,139,"Instances_2",obj_high_score_letter_selector_player2);
		}
		if (player3_new_high_score == true){
			var _select3 = instance_create_layer(233,139,"Instances_2",obj_high_score_letter_selector_player3);
		}
		if (player4_new_high_score == true){
			var _select4 = instance_create_layer(233,139,"Instances_2",obj_high_score_letter_selector_player4);
		}
		
		number_of_new_high_score_entries = instance_number(obj_high_score_letter_selector_parent);
	break;
	
	case rm_game_type_menu:
		//set as undifined so it doesn't draw until selected by the button in the room
		game_type = -1;
	
	break;
	
	case rm_ending:
		//set input delay alarm so you don't accidently click through it too fast
		alarm[0] = SEC*10;
	break;
	
	case rm_main_menu:
		//reset variables that might be active from a previous playthrough
		level = 0;
		calculated_level_score = false;
		player1_score = 0;
		player2_score = 0;
		player3_score = 0;
		player4_score = 0;
		player1_score_modifier = 1;
		player2_score_modifier = 1;
		player3_score_modifier = 1;
		player4_score_modifier = 1;
		coop_score = 0;
		player1_new_high_score = false;
		player2_new_high_score = false;
		player3_new_high_score = false;
		player4_new_high_score = false;
		registration_completed = false;
		registration_timer = 30*SEC;
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
		player1_lives = player_starting_lives;
		player2_lives = player_starting_lives;
		multiplayer_mode = 0;
		game_type = 0;
		number_of_players = 0;
		game_over = false;
		level_starting_blocks = 0;
		level_starting_blocks_sbvs_2p = 0;
		item_spawn_rate = item_spawn_rate_max;
		item_spawn_rate_sbvs_2 = item_spawn_rate_max;
		attract_mode_no_input_timer = attract_mode_no_input_timer_max;
		lines_this_level = 0;
		total_lines_p1 = 0;
		total_lines_p2 = 0;
		rounds_won_p1 = 0;
		rounds_won_p2 = 0;
	break;
	
	//debug rooms
	case rm_level2:              scr_level_start(150*SEC,140*SEC,120,30,3,[1,2,3],.2,false); break;
	
	case rm_test_room_320:       scr_level_start(45*SEC,40*SEC,60,5,3,[1,2,3],.4,false);     break;
	
	case rm_test_room_320_2P_VS: scr_level_start(45*SEC,40*SEC,60,5,3,[1,2,3],.4,true);      break;
	
	case rm_test_room_640:       scr_level_start(400*SEC,40*SEC,800,5,4,[1,2,1,4],.0,false); break;
	
}

//this alaways needs to be reset in case you come from a debug room
//where it is set really high, so that it is correct for the next room 
//you go into
item_spawn_rate = item_spawn_rate_max;

//reset
level_end_timer = level_end_timer_max;
calculated_level_score = false;
