if (live_call()) return live_result;
draw_set_font(fnt_game_gui_medium_2);
var _view_width = view_get_wport(0);
var _view_height = view_get_hport(0);




if (ui_layout_displayed) draw_sprite(spr_ui_layout_overlay,0,0,0);
//draw_line_color(room_width/2,0,room_width/2,room_height,c_red,c_red);
//draw_line_color(room_width/4,0,room_width/4,room_height,c_yellow,c_yellow);
//draw_line_color(room_width/2 + room_width/4,0,room_width/2+room_width/4,room_height,c_yellow,c_yellow);

//draw_line_color(0,room_height/2,room_width,room_height/2,c_red,c_blue);
//draw_line_color(0,room_height/4,room_width,room_height/4,c_yellow,c_green);
//draw_line_color(0,room_height/4+room_height/2,room_width,room_height/4+room_height/2,c_yellow,c_green);

#region Main menu
if (room == rm_main_menu){
	
	//draw in regular draw even so it can be captured for room transition
	draw_sprite(spr_title_screen_x4,0,150,200);
	//var _x = _view_width/2;
	//var _y = 304;
	//scribble("[fa_center][fa_middle][fnt_main_menu_title][c_green]Fruit Swarm").draw(_x-8,_y+8);
	//scribble("[fa_center][fa_middle][fnt_main_menu_title][c_yellow]Fruit Swarm").draw(_x,_y);
	
	
	
	if (keyboard_check(vk_anykey)) or (scr_any_controller_button_input()){
		attract_mode_no_input_timer = attract_mode_no_input_timer_max;	
	}
	
	attract_mode_no_input_timer--;
	if (attract_mode_no_input_timer <= 0) room_goto(rm_attract_mode);
}
#endregion
#region Game Type menu
else if (room == rm_game_type_menu){
	draw_set_font(fnt_game_gui_extra_large_2);
	draw_text(145,30,"Game Settings");
	draw_set_font(fnt_game_gui_medium_2);
	draw_text(150,100,"Select players:");
	draw_text(775,100,"Select game type:");
	draw_text(150,534,"Multiplayer mode:");
	draw_text(1400,100,"Current Game Settings:");
	draw_text(150,773,"Description:");
	
	//text position for game setting confirmation before starting
	var _x = 1410;
	var _x2 = 1658;
	var _y = 195;
	var _y2 = 267;
	var _y3 = 340;
	var _x3 = _x + 174;
	
	//displaying currently selected settings
	draw_text(_x,_y, "Players: ");
	switch(number_of_players){
		case 0:
		break;
		case 1: draw_text(_x3,_y, "1 Player");
		break;
		case 2: draw_text(_x3,_y, "2 Players");
		break;
		case 3: draw_text(_x3,_y, "3 Players");
		break;
		case 4: draw_text(_x3,_y, "4 Players");
		break;
	}
	
	draw_text(_x,_y2, "MP Mode: ");
	switch(multiplayer_mode){
		case SINGLE_PLAYER: 
			if (instance_exists(inst_1P)) and (inst_1P.selected == true){
				draw_text(_x3,_y2, "NA");
			}
		break;
		case MULTI_COOP: draw_text(_x3,_y2, "Cooperative");
		break;
		case MULTI_COMP: draw_text(_x3,_y2, "Competitive");
		break;
	}
	
	draw_text(_x,_y3, "Game Type: ");
	switch(game_type){
		case CLASSIC: draw_text(_x3,_y3, "Classic");
		break;
		case ENDURANCE: draw_text(_x3,_y3, "Endurance");
		break;
		case MARATHON: draw_text(_x3,_y3, "Marathon");
		break;
		case CLEANUP: draw_text(_x3,_y3, "Cleanup");
		break;
		case BLOCKOUT: draw_text(_x3,_y3, "Blockout");
		break;
		case COLOR_CLASH: draw_text(_x3,_y3, "Color Clash");
		break;
	}
	
	//cancel out of the room, back to the menu
	if (gamepad_button_check_pressed(0, gp_face2) || keyboard_check_pressed(vk_escape)){
		audio_play_sound(snd_menu_low,4,false);
		//instance_create_depth(x,y,-1000,obj_room_transition);
		//room_goto(rm_main_menu);
		scr_room_goto_transition(rm_main_menu);
	}
}
#endregion
#region High Scores
else if (room == rm_high_scores){
	draw_set_halign(fa_left);
	draw_text(60,30,"High Scores");
	
	#region //displaying current high scores
	if (high_score_state == "display"){
		if (!instance_exists(obj_room_transition)) and (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_anykey)){ 
			page++;
			audio_play_sound(snd_menu_low,4,false);
		}
		
		switch(page){
			//single player scores
			case 1:
				scr_draw_high_scores("1 Player", SINGLE_PLAYER,SINGLE_PLAYER);
			break;
			//2 players	
			case 2:
				scr_draw_high_scores("2 Players", COOP_2P, COMP_2P);
				
			break;
			case 3:
				//instance_create_depth(x,y,-1000,obj_room_transition);
				//room_goto(rm_main_menu);
				scr_draw_high_scores("2 Players", COOP_2P, COMP_2P);
				scr_room_goto_transition(rm_main_menu);
			break;
			//case 3:
			//	scr_draw_high_scores("3 Players", COOP_3P, COMP_3P);
			//break;
			//case 4:
			//	scr_draw_high_scores("4 Players", COOP_4P, COMP_4P);
			//break;
			//case 5:
			//	//instance_create_depth(x,y,-1000,obj_room_transition);
			//	//room_goto(rm_main_menu);
			//	scr_draw_high_scores("4 Players", COOP_4P, COMP_4P);
			//	scr_room_goto_transition(rm_main_menu);
			//break;
		}
	}
	#endregion
	
	if (high_score_state == "register"){
		
		//draws this overtop of players, NG
		//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
		
		switch (multiplayer_mode){
				
			#region Single player scoring
			case SINGLE_PLAYER:
				//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
				scr_high_score_adjust_single_coop(SINGLE_PLAYER,SINGLE_PLAYER,1,10);
			break;
			
			#region COOP Scoring
			case MULTI_COOP:
				//change based on number of players
				switch(number_of_players){
					case 2:
						//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
						scr_high_score_adjust_single_coop(MULTI_COOP,COOP_2P,2,5);
					break;
					case 3:
						//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
						scr_high_score_adjust_single_coop(MULTI_COOP,COOP_3P,4,5);
					break;
					case 4:
						//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
						scr_high_score_adjust_single_coop(MULTI_COOP,COOP_4P,4,5);
					break;
				}
			break;
			#endregion
				
			case MULTI_COMP:
				//change based on number of players
				switch(number_of_players){
					case 2:
						scr_high_score_adjust_comp(COMP_2P,1,5);
						scr_high_score_adjust_comp(COMP_2P,2,5);
					break;
					case 3:
						scr_high_score_adjust_comp(COMP_3P,1,5);
						scr_high_score_adjust_comp(COMP_3P,2,5);
						scr_high_score_adjust_comp(COMP_3P,3,5);
					break;
					case 4:
						scr_high_score_adjust_comp(COMP_4P,1,5);
						scr_high_score_adjust_comp(COMP_4P,2,5);
						scr_high_score_adjust_comp(COMP_4P,3,5);
						scr_high_score_adjust_comp(COMP_4P,4,5);
					break;
				}
			break;
		}
		
		//draw registration area
		//var _x_buffer = 140;
		var _y_buffer = 150;
	
		var _regX = 714;
		var _regY = 45;
		
		draw_text(_regX+126,_regY+57,"New High Score!");
		//draw_set_color(c_aqua);
		
		if (instance_exists(obj_high_score_letter_selector_player1)){
			if (multiplayer_mode == MULTI_COOP){
				draw_text(_regX-320,_regY+(_y_buffer*1.4),"Team");
			}
			else{
				draw_text(_regX-300,_regY+(_y_buffer*1.4),"P1");
			}
			draw_text(_regX-240,_regY+(_y_buffer*1.5),"_ _ _");
			draw_text(_regX-240,_regY+(_y_buffer*1.4),obj_high_score_letter_selector_player1.initial);
		}
		if (instance_exists(obj_high_score_letter_selector_player2)){
			draw_text(_regX,_regY+(_y_buffer*1.4),"P2");
			draw_text(_regX+60,_regY+(_y_buffer*1.5),"_ _ _");
			draw_text(_regX+60,_regY+(_y_buffer*1.4),obj_high_score_letter_selector_player2.initial);
		}
		if (instance_exists(obj_high_score_letter_selector_player3)){
			draw_text(_regX+300,_regY+(_y_buffer*1.4),"P3");
			draw_text(_regX+360,_regY+(_y_buffer*1.5),"_ _ _");
			draw_text(_regX+360,_regY+(_y_buffer*1.4),obj_high_score_letter_selector_player3.initial);
		}
		if (instance_exists(obj_high_score_letter_selector_player4)){
			draw_text(_regX+600,_regY+(_y_buffer*1.4),"P4");
			draw_text(_regX+660,_regY+(_y_buffer*1.5),"_ _ _");
			draw_text(_regX+660,_regY+(_y_buffer*1.4),obj_high_score_letter_selector_player4.initial);
		}
		//draw_set_color(c_green);
		draw_text(_regX,_regY+(_y_buffer*2.5),"A  B  C  D  E  F  G  H  I  J");
		//draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,96,176,28,2,c_white,1);
		draw_text(_regX,_regY+(_y_buffer*3.5),"K  L  M  N  O  P  Q  R  S  T");
		draw_text(_regX,_regY+(_y_buffer*4.5),"U  V  W  X  Y  Z  .  -");
		draw_set_font(fnt_UI_high_score_small_2);
		draw_text(_regX+400,_regY+(_y_buffer*4.6),"DEL END");
		draw_set_font(fnt_game_gui_medium_2);
		//draw_set_color(c_aqua);
		draw_text(_regX+150,_regY+(_y_buffer*5.7),"REM TIME: "+string(round(registration_timer/60)));
		if (registration_timer > 0){
			registration_timer--;
		}
		
		//selecting END button
		if (registration_completed == true){
			scr_save_updated_scores();
			if (instance_exists(obj_high_score_letter_selector_parent)){instance_destroy(obj_high_score_letter_selector_parent);}
			high_score_state = "display";
		}
		
		//timemout
		if (registration_timer <= 0){
			scr_save_updated_scores();
			if (instance_exists(obj_high_score_letter_selector_parent)){instance_destroy(obj_high_score_letter_selector_parent);}
			high_score_state = "display";
		}
	}
	#endregion
}
#endregion
#region Controls
else if (room == rm_controls){
	draw_text(120, 60,"How to play:");	
	draw_text(120, 130,"- Gather the same fruit together into a line (vertical, diagonal, horizontal) to collect them.");
	//draw_text(120, 190,"- Long collections (4 or more) increase your score multiplier.");
	draw_text(120, 190,"- Longer collections will score more points.");
	draw_text(120, 250,"- In Blockout mode, longer collections send rocks to your opponent's board.");
	draw_text(120, 310,"- Remove blocks or rocks by sandwiching them between the same fruit.");
	draw_text(120, 370,"- Clear as much of the board as possible for a bonus.");
	draw_text(120, 430,"- If there are no empty spaces on the board, you're knocked out (game over in single player / Coop)");
	
	draw_text(120, 540,"Controls:");	
	scr_player_controls_display(420,660);
	
	if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_anykey)){
		audio_play_sound(snd_menu_low,4,false);
		//instance_create_depth(x,y,-1000,obj_room_transition);
		//room_goto(rm_main_menu);
		scr_room_goto_transition(rm_main_menu);
	}
}
#endregion
#region Credits
else if (room == rm_credits){
	draw_text(50, 100,"Programming and design: Tanukisuitup");	
	draw_text(50, 160,"Sound Effects: Tanukisuitup");
	draw_text(50, 220,"Art Assets: Tanukisuitup");	
	draw_text(50, 280,"Music: All music is by Abstraction from the album Three Red Hearts");
	draw_text(50, 340,"Ver. 1.5, 11-09-2025");	
		
	if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_anykey)){
		audio_play_sound(snd_menu_low,4,false);
		//instance_create_depth(x,y,-1000,obj_room_transition);
		//room_goto(rm_main_menu);
		scr_room_goto_transition(rm_main_menu);
	}
	
}
#endregion

#region Game Ending Room
else if (room == rm_ending){
	
	//check for high score
	scr_check_for_new_high_score();
	
	var _win_y = 350;
	var _mid_x = (_view_width/2)+3;
	var _p1_y = 484;
	var _p2_y = 553;
	var _p3_y = 620;
	var _p4_y = 688;
	
	scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Thank you for playing!").draw(_mid_x,215);
	
	//draw final scores
	if (multiplayer_mode == SINGLE_PLAYER){
		scribble("[fa_center][fa_top][fnt_game_gui_largest_2]You Win!").draw(_mid_x,_win_y);
		scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
	}
	else if (multiplayer_mode == MULTI_COOP){
	
		scribble("[fa_center][fa_top][fnt_game_gui_largest_2]You Win!").draw(_mid_x,_win_y);
		scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Team:"+string(player1_score+player2_score)).draw(_mid_x,_p1_y);
			
	}
	//otherwise draw individual scores for comp mode
	else{
			
		if (game_type == BLOCKOUT) or (game_type == COLOR_CLASH){
			
			//if (player1_lives <= 0) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
			//if (player2_lives <= 0) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
			
			//if (rounds_won_p1 >= round_wins_needed_to_win_match) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
			//if (rounds_won_p2 >= round_wins_needed_to_win_match) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
			
			//change these game types to determine winner based on most wins (in case the 'round wins needed to win match' is never reached
			if (rounds_won_p1 > rounds_won_p2) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
			if (rounds_won_p1 < rounds_won_p2) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
			if (rounds_won_p1 == rounds_won_p2) scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Tie Game!").draw(_mid_x,_win_y);
			
		}
		
		//calculate the highest score for game types that use that as the winning condition
		if (game_type == CLASSIC) or (game_type == ENDURANCE) or (game_type == MARATHON){
			switch(number_of_players){
			
				case 2:
					//see who has the highest score
					var _highest_score = max(player1_score, player2_score);
		
					//tie game
					if (player1_score == _highest_score) and (player2_score == _highest_score){
				
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 and Player 2 Win!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
					}
					//not a tie  game
					else{
						//if the player's score equals the highest score, they are the winner
						if (player1_score == _highest_score){
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
						}
						else{
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
						}
						if (player2_score == _highest_score){
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
						}
						else{
							scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
						}
					}
				break;
			
				case 3:
					var _highest_score = max(player1_score, player2_score, player3_score);
			
					//tie game, idk an efficient way to set this up for 3 player and 4 player comparisons
					if (player1_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
					}
					if (player2_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
					}
					if (player3_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 3 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 3:"+string(player3_score)).draw(_mid_x,_p3_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 3:"+string(player3_score)).draw(_mid_x,_p3_y);
					}
				break;
			
				case 4:
					var _highest_score = max(player1_score, player2_score, player3_score, player4_score);

					if (player1_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 1:"+string(player1_score)).draw(_mid_x,_p1_y);
					}
					if (player2_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 2:"+string(player2_score)).draw(_mid_x,_p2_y);
					}
					if (player3_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 3 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 3:"+string(player3_score)).draw(_mid_x,_p3_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 3:"+string(player3_score)).draw(_mid_x,_p3_y);
					}
					if (player4_score == _highest_score){
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 4 Wins!").draw(_mid_x,_win_y);
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2][#f7d554]Player 4:"+string(player4_score)).draw(_mid_x,_p4_y);
					}
					else{
						scribble("[fa_center][fa_top][fnt_game_gui_largest_2]Player 4:"+string(player4_score)).draw(_mid_x,_p4_y);
					}
				break;
			}
		}
	}
}
#endregion
#region Practice Levels
//practice levels
else if (room == rm_1P_level_00) or (room == rm_2P_level_00) or (room == rm_3P_level0) or (room == rm_4P_level0){
	draw_set_halign(fa_center);
	draw_set_font(fnt_game_gui_large_2);
	if (calculated_level_score == false) and (!instance_exists(obj_room_transition_fade)){
		draw_sprite_stretched(spr_timer_background,0,408,96,1100,64);
		switch(number_of_players){
			case 1: draw_text(_view_width/2, 100,"Line up 3 or more like items to score points");break;
			case 2: draw_text(_view_width/2, 100,"Line up 3 or more like items to score points");break;
			case 3: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
			case 4: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
		}
	}
	draw_set_halign(fa_left);
	
	switch(number_of_players){
			case 1: 
				draw_sprite_stretched(spr_player1_score_background_3,0,96,406,480,134);
				scr_player_controls_display_individual(360,400,1);
			break;
			case 2:  
				draw_sprite_stretched(spr_player1_score_background_3,0,336,898,480,134);
				scr_player_controls_display_individual(608,892,1);
				draw_sprite_stretched(spr_player2_score_background_3,0,1096,898,480,134);
				scr_player_controls_display_individual(1368,892,2);
			break;
			case 3: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,750,3);
			break;
			case 4: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,705,3);
					scr_player_controls_display_individual(1630,705,4);
			break;
	}
	
	//skip
	if (gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_enter)){
		calculated_level_score = true;
	}
	
	if (!instance_exists(obj_fruit_parent) and (calculated_level_score == false)){
		audio_play_sound(snd_level_clear,4,false);
		alarm[0] = 5*SEC;
		calculated_level_score = true;
	}
	if (calculated_level_score == true){
		draw_set_halign(fa_center);
		draw_set_font(fnt_game_gui_extra_large_2);
		draw_sprite_stretched(spr_timer_background,0,258,96,1400,64);
		draw_text(_view_width/2, 100,"Level Clear!");
		draw_set_halign(fa_left);
	}
	//proceed to first level
	if (alarm[0] < 0) and (calculated_level_score == true) {
		
		//prevent this portion of code from running again before next level starts
		alarm[0] = 1*SEC;
		
		//classic
		//if (game_type == CLASSIC) or (game_type == CLEANUP){
		if (game_type == CLASSIC){
			level++;
			switch(number_of_players){
				case 1: //room_goto(rm_1P_level_01);	
					scr_room_goto_transition_fade(rm_1P_level_01);
				break;
				case 2: 
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_01_VS);  //room_goto(rm_2P_level_01_VS);
					else scr_room_goto_transition_fade(rm_2P_level_01);  //room_goto(rm_2P_level_01);
				break;
				case 3: room_goto(rm_3P_level1a);
				break;
				case 4: room_goto(rm_4P_level1b);
				break;
			}
		}
		
		//endurance
		if (game_type == ENDURANCE){
			level++;
			scr_endurance_first_time_start(number_of_players);
		}
		
		//marathon
		if (game_type == MARATHON){
			level++;
			switch(number_of_players){
				case 1: 
					//room_goto(rm_1P_level_MA);
					scr_room_goto_transition_fade(rm_1P_level_MA);
				break;
				case 2: 
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_MA_VS);
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_MA_VS);
					//else room_goto(rm_2P_level_MA);
					else scr_room_goto_transition_fade(rm_2P_level_MA);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		//Blockout
		if (game_type == BLOCKOUT){
			level++;
			switch(number_of_players){
				case 1: 
					
				break;
				case 2: 
					room_goto(rm_2P_level_00_RK);
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_BO_VS);
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_BO_VS);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		if (game_type == CLEANUP){
		//if (game_type == CLASSIC){
			//level++;
			switch(number_of_players){
				case 1: 
					room_goto(rm_1P_level_00_CR);	
					//scr_room_goto_transition_fade(rm_1P_level_01);
				break;
				case 2: 
					room_goto(rm_2P_level_00_CR);
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_01_VS);  //room_goto(rm_2P_level_01_VS);
					//else scr_room_goto_transition_fade(rm_2P_level_01);  //room_goto(rm_2P_level_01);
				break;
				case 3: room_goto(rm_3P_level1a);
				break;
				case 4: room_goto(rm_4P_level1b);
				break;
			}
		}
		//cleanup
		//if (game_type == CLEANUP){
		//	level++;
		//	switch(number_of_players){
		//		case 1: room_goto(rm_1P_level_CU);	
		//		break;
		//		case 2: 
		//			if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_CU_VS);
		//			else room_goto(rm_2P_level_CU);
		//		break;
		//		case 3: room_goto(rm_3P_level1a);
		//		break;
		//		case 4: room_goto(rm_4P_level1b);
		//		break;
		//	}
		//}
		
		
		//reset level variables
		//calculated_level_score = false;
	}
}
//else if (room == rm_1P_level_00_CR) or (room == rm_2P_level_00) or (room == rm_3P_level0) or (room == rm_4P_level0){
else if (room == rm_1P_level_00_CR) or (room == rm_2P_level_00_CR) {
	draw_set_halign(fa_center);
	draw_set_font(fnt_game_gui_large_2);
	if (calculated_level_score == false) and (!instance_exists(obj_room_transition_fade)){
		draw_sprite_stretched(spr_timer_background,0,258,96,1400,64);
		switch(number_of_players){
			case 1: draw_text(_view_width/2, 100,"Sandwich color blocks between like items to remove them");break;
			case 2: draw_text(_view_width/2, 100,"Sandwich color blocks between like items to remove them");break;
			case 3: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
			case 4: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
		}
	}
	draw_set_halign(fa_left);
	
	switch(number_of_players){
			case 1: 
				draw_sprite_stretched(spr_player1_score_background_3,0,96,406,480,134);
				scr_player_controls_display_individual(360,400,1);
			break;
			case 2:
				draw_sprite_stretched(spr_player1_score_background_3,0,336,898,480,134);
				scr_player_controls_display_individual(608,892,1);
				draw_sprite_stretched(spr_player2_score_background_3,0,1096,898,480,134);
				scr_player_controls_display_individual(1368,892,2);
			break;
			case 3: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,750,3);
			break;
			case 4: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,705,3);
					scr_player_controls_display_individual(1630,705,4);
			break;
	}
	
	//skip
	if (gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_enter)){
		calculated_level_score = true;
	}
	
	if (!instance_exists(obj_rock_color) and (calculated_level_score == false)){
		audio_play_sound(snd_level_clear,4,false);
		alarm[0] = 5*SEC;
		calculated_level_score = true;
	}
	if (calculated_level_score == true){
		draw_set_halign(fa_center);
		draw_set_font(fnt_game_gui_extra_large_2);
		draw_sprite_stretched(spr_timer_background,0,258,96,1400,64);
		draw_text(_view_width/2, 100,"Level Clear!");
		draw_set_halign(fa_left);
	}
	//proceed to first level
	if (alarm[0] < 0) and (calculated_level_score == true) {
		
		//prevent this portion of code from running again before next level starts
		alarm[0] = 1*SEC;
		
		//classic
		if (game_type == CLASSIC) or (game_type == CLEANUP){
		//if (game_type == CLASSIC){
			level++;
			switch(number_of_players){
				case 1: //room_goto(rm_1P_level_01);	
					scr_room_goto_transition_fade(rm_1P_level_01);
				break;
				case 2: 
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_01_VS);  //room_goto(rm_2P_level_01_VS);
					else scr_room_goto_transition_fade(rm_2P_level_01);  //room_goto(rm_2P_level_01);
				break;
				case 3: room_goto(rm_3P_level1a);
				break;
				case 4: room_goto(rm_4P_level1b);
				break;
			}
		}
		
		//endurance
		if (game_type == ENDURANCE){
			level++;
			scr_endurance_first_time_start(number_of_players);
		}
		
		//marathon
		if (game_type == MARATHON){
			level++;
			switch(number_of_players){
				case 1: 
					//room_goto(rm_1P_level_MA);
					scr_room_goto_transition_fade(rm_1P_level_MA);
				break;
				case 2: 
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_MA_VS);
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_MA_VS);
					//else room_goto(rm_2P_level_MA);
					else scr_room_goto_transition_fade(rm_2P_level_MA);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		//Blockout
		if (game_type == BLOCKOUT){
			level++;
			switch(number_of_players){
				case 1: 
					
				break;
				case 2: 
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_BO_VS);
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_BO_VS);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		//cleanup
		//if (game_type == CLEANUP){
		//	level++;
		//	switch(number_of_players){
		//		case 1: room_goto(rm_1P_level_CU);	
		//		break;
		//		case 2: 
		//			if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_CU_VS);
		//			else room_goto(rm_2P_level_CU);
		//		break;
		//		case 3: room_goto(rm_3P_level1a);
		//		break;
		//		case 4: room_goto(rm_4P_level1b);
		//		break;
		//	}
		//}
		
		
		//reset level variables
		//calculated_level_score = false;
	}
}
	
else if (room == rm_2P_level_00_RK) {
	draw_set_halign(fa_center);
	draw_set_font(fnt_game_gui_large_2);
	if (calculated_level_score == false) and (!instance_exists(obj_room_transition_fade)){
		//draw_sprite_stretched(spr_timer_background,0,258,32,1400,128);
		draw_sprite_stretched(spr_timer_background,0,258,96,1400,64);
		switch(number_of_players){
			case 1: draw_text(_view_width/2, 100,"Sandwich color blocks between like items to remove them");break;
			case 2: draw_text(_view_width/2, 100,"Sandwich rocks between like items to remove them.");break;
			case 3: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
			case 4: draw_text(_view_width/2, 65,"Line up 3 or more like items to score points");break;
		}
	}
	draw_set_halign(fa_left);
	
	switch(number_of_players){
			case 1: 
				draw_sprite_stretched(spr_player1_score_background_3,0,96,406,480,134);
				scr_player_controls_display_individual(360,400,1);
			break;
			case 2:
				draw_sprite_stretched(spr_player1_score_background_3,0,336,898,480,134);
				scr_player_controls_display_individual(608,892,1);
				draw_sprite_stretched(spr_player2_score_background_3,0,1096,898,480,134);
				scr_player_controls_display_individual(1368,892,2);
			break;
			case 3: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,750,3);
			break;
			case 4: 
					scr_player_controls_display_individual(160,315,1);
					scr_player_controls_display_individual(1630,315,2);
					scr_player_controls_display_individual(160,705,3);
					scr_player_controls_display_individual(1630,705,4);
			break;
	}
	
	//skip
	if (gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_enter)){
		calculated_level_score = true;
	}
	
	if (!instance_exists(obj_rock) and (calculated_level_score == false)){
		audio_play_sound(snd_level_clear,4,false);
		alarm[0] = 5*SEC;
		calculated_level_score = true;
	}
	
	if (calculated_level_score == true){
		draw_set_halign(fa_center);
		draw_set_font(fnt_game_gui_extra_large_2);
		draw_sprite_stretched(spr_timer_background,0,258,96,1400,64);
		draw_text(_view_width/2, 100,"Level Clear!");
		draw_set_halign(fa_left);
	}
	//proceed to first level
	if (alarm[0] < 0) and (calculated_level_score == true) {
		
		//prevent this portion of code from running again before next level starts
		alarm[0] = 1*SEC;
		
		//classic
		if (game_type == CLASSIC) or (game_type == CLEANUP){
		//if (game_type == CLASSIC){
			level++;
			switch(number_of_players){
				case 1: //room_goto(rm_1P_level_01);	
					scr_room_goto_transition_fade(rm_1P_level_01);
				break;
				case 2: 
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_01_VS);  //room_goto(rm_2P_level_01_VS);
					else scr_room_goto_transition_fade(rm_2P_level_01);  //room_goto(rm_2P_level_01);
				break;
				case 3: room_goto(rm_3P_level1a);
				break;
				case 4: room_goto(rm_4P_level1b);
				break;
			}
		}
		
		//endurance
		if (game_type == ENDURANCE){
			level++;
			scr_endurance_first_time_start(number_of_players);
		}
		
		//marathon
		if (game_type == MARATHON){
			level++;
			switch(number_of_players){
				case 1: 
					//room_goto(rm_1P_level_MA);
					scr_room_goto_transition_fade(rm_1P_level_MA);
				break;
				case 2: 
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_MA_VS);
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_MA_VS);
					//else room_goto(rm_2P_level_MA);
					else scr_room_goto_transition_fade(rm_2P_level_MA);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		//Blockout
		if (game_type == BLOCKOUT){
			//level++;
			switch(number_of_players){
				case 1: 
					
				break;
				case 2: 
					//if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_BO_VS);
					if (sbvs == true) and (multiplayer_mode == MULTI_COMP) scr_room_goto_transition_fade(rm_2P_level_BO_VS);
				break;
				//case 3: room_goto(rm_3P_level1a);
				//break;
				//case 4: room_goto(rm_4P_level1b);
				//break;
			}
		}
	
		//cleanup
		//if (game_type == CLEANUP){
		//	level++;
		//	switch(number_of_players){
		//		case 1: room_goto(rm_1P_level_CU);	
		//		break;
		//		case 2: 
		//			if (sbvs == true) and (multiplayer_mode == MULTI_COMP) room_goto(rm_2P_level_CU_VS);
		//			else room_goto(rm_2P_level_CU);
		//		break;
		//		case 3: room_goto(rm_3P_level1a);
		//		break;
		//		case 4: room_goto(rm_4P_level1b);
		//		break;
		//	}
		//}
		
		
		//reset level variables
		//calculated_level_score = false;
	}
}

#endregion

#region Puzzle Level
//regular puzzle levels
else{
	
	#region Pause
	if (paused == true){
		
		//create pause screen surface if it doesn't exsist
		//if !surface_exists(pause_surface){
		//	pause_surface = surface_create(1920,1080);
			
		//}
		////if it does exsist, draw it
		//if (surface_exists(pause_surface)){
			
		//	surface_set_target(pause_surface);
		//	//view_set_surface_id(1,pause_surface);
		//}
		
		
		var _pause_x = (_view_width/2)+3;
		var _pause_y = 274;
		
		draw_sprite_stretched(spr_timer_background,0,816,230,288,80);
		scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]PAUSED").draw(_pause_x,_pause_y);
		
		draw_set_halign(fa_left);
		draw_set_font(fnt_game_gui_medium_2);
		
		//draw_text(5,5,"FPS: "+string(fps_per_second));
		//draw_line_color(room_width/2,0,room_width/2,room_height,c_red,c_red);
		//draw_line_color(room_width/4,0,room_width/4,room_height,c_yellow,c_yellow);
		//draw_line_color(room_width/2 + room_width/4,0,room_width/2+room_width/4,room_height,c_yellow,c_yellow);

		//draw_line_color(0,room_height/2,room_width,room_height/2,c_red,c_blue);
		//draw_line_color(0,room_height/4,room_width,room_height/4,c_yellow,c_green);
		//draw_line_color(0,room_height/4+room_height/2,room_width,room_height/4+room_height/2,c_yellow,c_green);
		

		if (pause_control_display == true){
			scr_player_controls_display(360,750);				
		}
		
		
		if (pause_buttons_created == false){
			
			scr_pause_menu_create();
			
			pause_buttons_created = true;
		}
		
		//reset to default application surface target so drawing can continue
		//if (surface_exists(pause_surface)){
		//	//draw_clear_alpha(c_black,0);
		//	surface_reset_target();
		//}
		
		exit;	
	}
	#endregion
	
	//draw timer. Must set this local var here so both checks below can access it
	var _remaining_time = max(-1,round(level_timer/60));
	
	//Regular Game Level Code when running normally
	if (game_over == false){
		
		var _timer_x = (_view_width/2)+3; //- 96;
		var _timer_y = 52; //needs a bit of offset? to be aligned with middle
		
		//classic, draw timer for modes that use it
		if (game_type == CLASSIC) or (game_type == COLOR_CLASH){
			//if (_remaining_time >= 0) draw_sprite_stretched(spr_timer_background,0,790,8,340,80);
			
			if (_remaining_time >= 10){
				draw_sprite_stretched(spr_timer_background,0,790,8,340,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time:"+string(_remaining_time)).draw(_timer_x,_timer_y);
				
			}
			if (_remaining_time < 10 and _remaining_time >3){
				draw_sprite_stretched(spr_timer_background,1,790,8,340,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time:"+string(_remaining_time)).draw(_timer_x,_timer_y);
				//scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time: [#F7D554]"+string(_remaining_time)).draw(_timer_x,_timer_y);
			}
			if (_remaining_time <= 3 and _remaining_time >= 0){
				draw_sprite_stretched(spr_timer_background,2,790,8,340,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time:"+string(_remaining_time)).draw(_timer_x,_timer_y);
				//scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time: [#C33846]"+string(_remaining_time)).draw(_timer_x,_timer_y);
			}
			//else if (_remaining_time < 0){ }; //don't draw
			
		}
		
		//endurance, remaining items
		if (game_type == ENDURANCE){
			if (remaining_items >= 10) scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Remaining Fruit:"+string(remaining_items)).draw(_timer_x,_timer_y);
			if (remaining_items < 10 and remaining_items >3) scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Remaining Fruit:[#F7D554]"+string(remaining_items)).draw(_timer_x,_timer_y);
			if(remaining_items <= 3 and remaining_items > 0) scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Remaining Fruit:[#C33846]"+string(remaining_items)).draw(_timer_x,_timer_y);
			else if (remaining_items <= 0){}; //don't draw
		}
		
		//marathon, remaining lines
		if (game_type == MARATHON){
			
	
			//new marathon
			var _total_lines = total_lines_p1+total_lines_p2;
			if (multiplayer_mode == SINGLE_PLAYER) or (multiplayer_mode == MULTI_COOP){
				draw_sprite_stretched(spr_timer_background,0,790,8,340,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Lines "+string(_total_lines)).draw(_timer_x,_timer_y);
			}
			//if it's multi player and split board
			if (multiplayer_mode == MULTI_COMP) and (sbvs == true){
				//draw_sprite_stretched(spr_timer_background,0,790,8,340,80);
				
				//p1 lines
				draw_sprite_stretched(spr_player1_score_background_3,0,8,992,392,80);
				scribble("[fa_left][fa_middle][fnt_game_gui_extra_large_3]Lines").draw(24,_view_height-44);
				scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(total_lines_p1)).draw(390,_view_height-44);
				
				//p2 lines
				draw_sprite_stretched(spr_player2_score_background_3,0,1520,992,392,80);
				scribble("[fa_left][fa_middle][fnt_game_gui_extra_large_3]Lines").draw(1536,_view_height-44);
				scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(total_lines_p2)).draw(1902,_view_height-44);
				
				
				//scribble("[fa_left][fa_middle][fnt_game_gui_extra_large_3]P1 ").draw(24,52);
				//scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Lines:"+string(_total_lines)+" "+"(P1 "+string(total_lines_p1)+"/ P2 "+string(total_lines_p2)+")").draw(_timer_x,_timer_y);
			}
			
	
			
			//current player status
			draw_set_halign(fa_center);
			if (sbvs == true){
				if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
					
					var _p1_out_x = 600;
					var _p1_out_y = 100;
					var _p2_out_x = 1350;
					var _p2_out_y = 100;
					
					//text background
					draw_sprite_stretched(spr_timer_background,2,650,8,612,80);
					
					if (obj_player1.knocked_out == true){ 
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P1 Knocked Out!").draw(_timer_x,_timer_y);
					}
					if (obj_player2.knocked_out == true){ 
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P2 Knocked Out!").draw(_timer_x,_timer_y);
					}
					/*
					if (obj_player1.knocked_out == true){ 
						//draw_text(_view_width/2, 64,"Player 1 Knocked Out!");
						
						//out first but your score is higher (winning for now)
						if (player1_score > player2_score) draw_text(_p1_out_x,_p1_out_y,"Player 1 is winning!");
						//out first but your score is lower (lost)
						if (player1_score < player2_score){
							draw_text(_p1_out_x,_p1_out_y,"Player 1 lost!");
							draw_text(_p2_out_x,_p1_out_y,"Player 2 wins!");
							
							//draw_text(600,930,"Player 1 Wins!");
							draw_text(_p2_out_x,930,"Continue playing or\npress pause to end.");
						}
						if (player1_score == player2_score)draw_text(_p1_out_x,_p1_out_y,"Player 1 is tied!");
						
					}
					if (obj_player2.knocked_out == true){ 
						//notification at the top
						//draw_text(_view_width/2, 64,"Player 2 Knocked Out!");
						//notification on P2 board
					
						if (player2_score > player1_score) draw_text(_p2_out_x,_p2_out_y,"Player 2 is winning!");
						if (player2_score < player1_score){
							draw_text(600,_p2_out_y,"Player 1 wins!");
							draw_text(_p2_out_x,_p2_out_y,"Player 2 lost!");
							
							//draw_text(600,930,"Player 1 Wins!");
							draw_text(600,930,"Continue playing or\npress pause to end.");
						}
						if (player2_score == player1_score)draw_text(_p2_out_x,_p2_out_y,"Player 2 is tied!");
					}
					*/
				}
			}
			draw_set_halign(fa_left);
			
		}
			
		//clean up, remaining color blocks
		if (game_type == CLEANUP){
			//current blocks
			var _rem_x = _view_width/2;
			var _rem_y = 12; 
			
			var _p1_out_x = 512;
			var _p1_out_y = 10;
			var _p2_out_x = 1408;
			var _p2_out_y = 10;
			var _lvl_comp_x_offset = 6;
			
			//update qty each frame
			var _p1_blocks = 0;
			var _p2_blocks = 0;
			for (var i=0; i<instance_number(obj_rock_color);i++){
				var _inst[i];
				_inst[i] = instance_find(obj_rock_color,i); 	
				if (_inst[i].my_player_board == 1) _p1_blocks++;
				if (_inst[i].my_player_board == 2) _p2_blocks++;
			}
			
			//remaining_color_blocks_P1 = instance_number(obj_block_color);
			//update the quantity if the player hasn't been knocked out
			if (instance_exists(obj_player1) and (obj_player1.knocked_out == false)) remaining_color_blocks_P1 = _p1_blocks;
			
			
			//Split board 2P
			if (multiplayer_mode == MULTI_COMP) and (sbvs == true){
				var _p1_c_rocks_x = 1920/5;
				var _p1_c_rocks_y = _view_height-44;
				
				var _p2_c_rocks_x = (1920/5)*4;
				var _p2_c_rocks_y = _view_height-44;
				
				
				//update remaining P2 blocks and level if you haven't been knocked out
				if (instance_exists(obj_player2) and (obj_player2.knocked_out == false)) remaining_color_blocks_P2 = _p2_blocks;
				draw_sprite_stretched(spr_timer_background,0,-20,992,2000,80);
				
				//P1
				if (instance_exists(obj_player1) and (obj_player1.knocked_out == false)){
					//if (remaining_color_blocks_P1 >= 1) draw_text(_p1_out_x,_p1_out_y, "Remaining Color Rocks:"+string(remaining_color_blocks_P1));
					//if (remaining_color_blocks_P1 <= 0) draw_text(_p1_out_x,_p1_out_y, "Level Complete!");
					if (remaining_color_blocks_P1 >= 1){
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Rem. Color Rocks:"+string(remaining_color_blocks_P1)).draw(_p1_c_rocks_x,_p1_c_rocks_y);
					}
					if (remaining_color_blocks_P1 <= 0){
						draw_sprite_stretched(spr_timer_background,0,576,8,768,80);
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Level Complete!").draw(_timer_x+_lvl_comp_x_offset,_timer_y);
					}
				}
				if (instance_exists(obj_player1) and (obj_player1.knocked_out == true)){
					//draw_text(_p1_out_x,_p1_out_y, "Player 1 knocked out!");
				}
				
				//P2
				if (instance_exists(obj_player2) and (obj_player2.knocked_out == false)){
					//if (remaining_color_blocks_P2 >= 1) draw_text(_p2_out_x,_p2_out_y, "Remaining Color Rocks:"+string(remaining_color_blocks_P2));
					//if (remaining_color_blocks_P2 <= 0) draw_text(_p2_out_x,_p2_out_y, "Level Complete!");
					
					if (remaining_color_blocks_P2 >= 1){
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Rem. Color Rocks:"+string(remaining_color_blocks_P2)).draw(_p2_c_rocks_x,_p2_c_rocks_y);
					}
					if (remaining_color_blocks_P2 <= 0){
						draw_sprite_stretched(spr_timer_background,0,576,8,768,80);
						scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Level Complete!").draw(_timer_x+_lvl_comp_x_offset,_timer_y);
					}
					
				}
				if (instance_exists(obj_player2) and (obj_player2.knocked_out == true)){
					//draw_text(_p2_out_x,_p2_out_y, "Player 2 knocked out!");
				}
				
			}
			//Single Player and COOP modes
			else{
				draw_sprite_stretched(spr_timer_background,0,576,8,768,80);
				if (remaining_color_blocks_P1 >= 1){
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Rem. Color Rocks:"+string(remaining_color_blocks_P1)).draw(_timer_x,_timer_y);
				}
				if (remaining_color_blocks_P1 <= 0){
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Level Complete!").draw(_timer_x+_lvl_comp_x_offset,_timer_y);
				}
			}
			
			
			//current player status
			draw_set_halign(fa_center);
			if (sbvs == true){
				if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
					
					//display until level completed or game over
					if (remaining_color_blocks_P1 != 0) and (remaining_color_blocks_P2 != 0){
						//text background
						draw_sprite_stretched(spr_timer_background,2,650,8,612,80);
					
						if (obj_player1.knocked_out == true){ 
							scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P1 Knocked Out!").draw(_timer_x,_timer_y);
						}
						if (obj_player2.knocked_out == true){ 
							scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P2 Knocked Out!").draw(_timer_x,_timer_y);
						}
					}
					
				}
			}
			draw_set_halign(fa_left);
			
		}
			
		//blockout, 
		if (game_type == BLOCKOUT){
			
			//vs only battle mode
			//likely needs to be 4  or more fruit types to reduce double click scoring spam when spawn speeds are high
			//spawn speeds need to keep decreasing, although the  rate of decrease may need to  be slower at higher speeds
			//may need to increase amount of garbage sent (show how much garbage will be sent somehow)
			
			/*
			//P1 gueued blocks and ui
			if (instance_exists(obj_item_spawner)){
				
				//draw speed increase ui
				var _x5 = 64;
				var _y5 = 576;
				var _sp = 32;
				for (var j = 0; j < obj_item_spawner.player1_speed_increase_items_max; j++){
					draw_sprite_ext(spr_speed_increase_background,0,_x5,_y5-(_sp*j),1,.5,0,c_white,1);
				}
				for (var k = 0; k < obj_item_spawner.player1_speed_increase_items_remaining; k++){
					draw_sprite_ext(spr_speed_increase_indicator,0,_x5,_y5-(_sp*k),1,.5,0,c_white,1);
				}
				
				draw_set_halign(fa_center);
				draw_text(_x5+32,_y5+64,"Speed");
				draw_text(_x5+32,_y5+128,string(obj_item_spawner.player1_speed_level));
				draw_text(_x5+32,_y5+148,string(item_spawn_rate_max));
				
				//draw queued items
				if (obj_item_spawner.player1_queued_items > 0){
					for (var i = 0; i < obj_item_spawner.player1_queued_items;i++){
						draw_sprite_ext(spr_block_1x1,0,15,100+(55*i),3,3,0,c_white,1);	
					}
				}
				
			}
			//P2 queued
			if (instance_exists(obj_item_spawner_sbvs_2p)){
				
				//draw speed increase ui
				var _x6 = 1800;
				var _y6 = 576;
				var _sp2 = 32;
				
				for (var j = 0; j < obj_item_spawner_sbvs_2p.player2_speed_increase_items_max; j++){
					draw_sprite_ext(spr_speed_increase_background,0,_x6,_y6-(_sp2*j),1,.5,0,c_white,1);
				}
				for (var k = 0; k < obj_item_spawner_sbvs_2p.player2_speed_increase_items_remaining; k++){
					draw_sprite_ext(spr_speed_increase_indicator,1,_x6,_y6-(_sp2*k),1,.5,0,c_white,1);
				}
				
				draw_set_halign(fa_center);
				draw_text(_x6+32,_y6+64,"Speed");
				draw_text(_x6+32,_y6+128,string(obj_item_spawner_sbvs_2p.player2_speed_level));
				draw_text(_x6+32,_y6+148,string(obj_game.item_spawn_rate_max_sbvs));
				
				//draw queued items
				if (obj_item_spawner_sbvs_2p.player2_queued_items > 0){
					for (var i = 0; i < obj_item_spawner_sbvs_2p.player2_queued_items;i++){
						draw_sprite_ext(spr_block_1x1,0,1850,100+(55*i),3,3,0,c_white,1);	
					}
				}
				
			}
			*/
			
			//current player status
			if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
					
				//text background
				draw_sprite_stretched(spr_timer_background,2,650,8,612,80);
					
				if (obj_player1.knocked_out == true){ 
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P1 Knocked Out!").draw(_timer_x,_timer_y);
				}
				if (obj_player2.knocked_out == true){ 
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P2 Knocked Out!").draw(_timer_x,_timer_y);
				}
			}
			
			draw_set_halign(fa_left);	
			
			
		}
		draw_set_font(fnt_game_gui_medium_2);
		
		//color clash
		//if (game_type == COLOR_CLASH){
			//currently you can use classic game type for timer, but may want to change later
			
		//}
			
		//draw level number
		if (game_type != BLOCKOUT) and (game_type != COLOR_CLASH) and (!instance_exists(obj_room_transition_fade)){ 
			//level text background
	
			draw_sprite_stretched(spr_timer_background,0,790,992,340,80);
			
			scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Level "+string(level)).draw((_view_width/2)+3,_view_height-44);
		}
		//draw round number instead for modes that use it
		if ((game_type == BLOCKOUT)  or (game_type == COLOR_CLASH)) and (!instance_exists(obj_room_transition_fade)){ 
			//level text background
			//show if neither player is knocked out (hide that level is changing early to the next round number)
			if (calculated_level_score == false){
				draw_sprite_stretched(spr_timer_background,0,790,992,340,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Round "+string(level)).draw((_view_width/2)+3,_view_height-44);
			}
		}
		draw_set_halign(fa_left);
		var _lives_buffer = 30;
		
		#region Player Scores
		//draw ****player scores****
		
		coop_score = player1_score + player2_score;
		//P1
		//draw_text(30,10, "P1 (x"+string(player1_score_modifier)+"):"+string(player1_score));
		//draw lives and extended backgound if needed
		if (sbvs == true) and (multiplayer_mode == MULTI_COMP) and (game_type == ENDURANCE){
			draw_sprite(spr_player1_score_background_2,0, 14,6);
			for (i=0; i < player1_lives;i++){
				draw_sprite(spr_heart,0,27+(i*_lives_buffer),76);
			}
		}
		//draw score background
		//else draw_sprite_stretched(spr_player1_score_background_3,0,0,0,410,96);
		else draw_sprite_stretched(spr_player1_score_background_3,0,8,8,392,80);
		
		//draw multiplier
		draw_set_font(fnt_game_gui_medium_2);
		//draw_text(27,10, "P1 ");
		
		
		
		draw_set_halign(fa_right);
		//draw_text(152,10, "(x"+string(player1_score_modifier)+")");
		
		scribble("[fa_left][fa_middle][fnt_game_gui_extra_large_3]P1 ").draw(24,52);
		//draw score or current health in blockout
		if (game_type == BLOCKOUT){
			var _lives_buffer = 72;
			
			//for (i=0; i < player1_lives;i++){
			//	//draw_sprite_ext(spr_heart,0,120+(i*_lives_buffer),24,2,2,0,c_white,1);
			//	draw_sprite_ext(spr_heart,0,160+(i*_lives_buffer),24,2,2,0,c_white,1);
			//}
			
			for (i=0; i < rounds_won_p1;i++){
				//draw_sprite_ext(spr_heart,0,120+(i*_lives_buffer),24,2,2,0,c_white,1);
				draw_sprite_ext(spr_star_icon,0,160+(i*_lives_buffer),24,2,2,0,c_white,1);
			}
			
			
		}
		//draw color score in color clash
		else if (game_type == COLOR_CLASH){
			//score needs to be right justfied 
			player1_color_qty = instance_number(obj_player1_background);
			scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(player1_color_qty)).draw(390,52);
			//draw wins
			var _wins_buffer = 76;
			for (i=0; i < rounds_won_p1;i++){
				//draw_sprite_ext(spr_heart,0,120+(i*_lives_buffer),24,2,2,0,c_white,1);
				draw_sprite_ext(spr_star_icon,0,124+(i*_wins_buffer),24,2,2,0,c_white,1);
			}
			
		}
		else {
			//score needs to be right justfied 
			if (multiplayer_mode == MULTI_COOP) scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(coop_score)).draw(390,52);
			else scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(player1_score)).draw(390,52);
		}
		
		draw_set_halign(fa_left);
		
		//P2
		if (instance_exists(obj_player2)){
			//draw_text_color(549,10, "P2 (x"+string(player2_score_modifier)+"):"+string(player2_score),#80D7E5,#80D7E5,#80D7E5,#80D7E5,1);
			//draw_text(view_get_wport(view_camera[0])-240,10, "P2 (x"+string(player2_score_modifier)+"):"+string(player2_score));
			if (sbvs == true) and (multiplayer_mode == MULTI_COMP) and (game_type == ENDURANCE) {
				var _lives_buffer = 30;
				
				draw_sprite(spr_player2_score_background_2,0, 1765,6);
				for (i=0; i < player2_lives;i++){
					draw_sprite(spr_heart,0,view_get_wport(0)-143+(i*_lives_buffer),76);
				}
			}
			//else draw_sprite(spr_player2_score_background,0,1765,6);
			else draw_sprite_stretched(spr_player2_score_background_3,0,1520,8,392,80);
			//draw_text(view_get_wport(0)-143,10, "P2 ");
			
			
			
			draw_set_halign(fa_right);
			//draw_text(view_get_wport(0)-18,10, "(x"+string(player2_score_modifier)+")");
			
			scribble("[fa_left][fa_middle][fnt_game_gui_extra_large_3]P2 ").draw(1536,52);
			//blockout - hearts
			if (game_type == BLOCKOUT){
				var _lives_buffer = 72;
				
				//hearts
				//for (i=0; i < player2_lives;i++){
				
				//	//draw_sprite_ext(spr_heart,0,1632+(i*_lives_buffer),24,2,2,0,c_white,1);
				//	draw_sprite_ext(spr_heart,0,1672+(i*_lives_buffer),24,2,2,0,c_white,1);
				//}
				
				//stars
				for (i=0; i < rounds_won_p2;i++){
					//draw_sprite_ext(spr_heart,0,120+(i*_lives_buffer),24,2,2,0,c_white,1);
					draw_sprite_ext(spr_star_icon,0,1632+(i*_lives_buffer),24,2,2,0,c_white,1);
				}
			}
			//draw color score in color clash
			else if (game_type == COLOR_CLASH){
				//score needs to be right justfied
				player2_color_qty = instance_number(obj_player2_background);
				scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(player2_color_qty)).draw(1902,52);	
				
				var _wins_buffer = 76;
				//stars
				for (i=0; i < rounds_won_p2;i++){
					//draw_sprite_ext(spr_heart,0,120+(i*_lives_buffer),24,2,2,0,c_white,1);
					draw_sprite_ext(spr_star_icon,0,1632+(i*_wins_buffer),24,2,2,0,c_white,1);
				}
			}
			//other modes - score
			else{ 
				if (multiplayer_mode == MULTI_COOP) scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(coop_score)).draw(1902,52);
				else scribble("[fa_right][fa_middle][fnt_game_gui_extra_large_3]"+string(player2_score)).draw(1902,52);
			}
			
			draw_set_halign(fa_left);
		}
		
		
		//P3
		if (instance_exists(obj_player3)){
			//draw_text(30,view_get_hport(view_camera[0])-50, "P3 (x"+string(player3_score_modifier)+"):"+string(player3_score));
			draw_sprite(spr_player3_score_background,0,14,995);
			//draw_text(30,_view_height-80, "P3 (x"+string(player3_score_modifier)+")");
			draw_text(27,_view_height-80, "P3 ");
			draw_set_halign(fa_right);
			draw_text(152,_view_height-80, "(x"+string(player3_score_modifier)+")");
			draw_text(145,_view_height-50, string(player3_score));
		draw_set_halign(fa_left);
		}
		//P4
		if (instance_exists(obj_player4)){
			//draw_text(view_get_wport(view_camera[0])-240,view_get_hport(view_camera[0])-50, "P4 (x"+string(player4_score_modifier)+"):"+string(player4_score));
			draw_sprite(spr_player4_score_background,0,1765,995);
			//draw_text(view_get_wport(0)-140,_view_height-80, "P4 (x"+string(player4_score_modifier)+")");
			draw_text(view_get_wport(0)-143,_view_height-80, "P4 ");
			draw_set_halign(fa_right);
			draw_text(view_get_wport(0)-18,_view_height-80, "(x"+string(player4_score_modifier)+")");
			draw_text(view_get_wport(0)-24,_view_height-50, string(player4_score));
			draw_set_halign(fa_left);
		}
		
		
		////if coop, draw the combined score
		//if (multiplayer_mode == MULTI_COOP){
		//	//add scores
		//	switch(number_of_players){
		//		case 2: coop_score = player1_score+player2_score;
		//		break;
		//		case 3: coop_score = player1_score+player2_score+player3_score;
		//		break;
		//		case 4:	coop_score = player1_score+player2_score+player3_score+player4_score;
		//		break;
		//	}
			
		//	//no enough space to draw the team score, also weird to have score in another location besides player score areas
		//	draw_set_halign(fa_center);
		//	//draw_text(_view_width/2,_view_height-50,"Team Score:"+string(coop_score));
		//	draw_set_halign(fa_left);
		//}
		#endregion
		
	}

	//end of the level (timed classic game type)
	#region Classic Level End
	if (_remaining_time < 0) and (game_over == false) and (game_type == CLASSIC) and (!instance_exists(obj_room_transition_fade)){
		draw_set_halign(fa_center);
		if (sbvs == true){
			if (obj_player1.knocked_out == true) or (obj_player2.knocked_out == true){
				//if (instance_exists(obj_player1)) and (obj_player1.knocked_out == true) draw_text(_view_width/2, 12,"Player 1 Knocked Out!");	
				//if (instance_exists(obj_player2)) and (obj_player2.knocked_out == true) draw_text(_view_width/2, 12,"Player 2 Knocked Out!");
				
				//text background
				draw_sprite_stretched(spr_timer_background,2,650,8,612,80);
					
				if (obj_player1.knocked_out == true){ 
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P1 Knocked Out!").draw(_timer_x,_timer_y);
				}
				if (obj_player2.knocked_out == true){ 
					scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P2 Knocked Out!").draw(_timer_x,_timer_y);
				}
			}
			else {
				//time's up (if no one was knocked out)
				draw_sprite_stretched(spr_timer_background,0,760,8,402,80);
				scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time's Up!").draw((_view_width/2)+10,52);
			}
		}
		else{
			//time's up
			draw_sprite_stretched(spr_timer_background,0,760,8,402,80);
			scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Time's Up!").draw((_view_width/2)+10,52);
		}
		
		//add bonus score if you are in coop or single player mode only
		if (level_free_space_bonus_score != 0) and (multiplayer_mode != MULTI_COMP){
			//draw_text(_view_width/2, 45,"Free space bonus score "+string(level_free_space_bonus_score));
		}
		if (sbvs == true) and (multiplayer_mode == MULTI_COMP){
			//draw_text(_view_width/2, 45,"Free space bonus scores: P1 "+string(level_free_space_bonus_score)+", P2 "+string(level_free_space_bonus_score_sbvs_2p));
		}
		draw_set_halign(fa_left);
		
		//pause all players
		with(obj_player_parent) has_control = false;

		
		//calculate empty space bonus classic game type
		if (calculated_level_score == false) and (!instance_exists(obj_room_transition_fade)){
			//make any current score cards invisible so bonus score is easy to read
			if (instance_exists(obj_score_card)) with (obj_score_card) visible = false;
			
			//calculate the score for the number of empty spaces
			if (instance_exists(obj_player1)) and (obj_player1.knocked_out == false){
				instance_create_layer(x,y,"Instances_1",obj_space_check_cursor_final_score);
			}
			//calculate score for 2p in split board mode
			if (sbvs == true) and (multiplayer_mode == MULTI_COMP){
				if (instance_exists(obj_player2)) and (obj_player2.knocked_out == false){
					instance_create_layer(x,y,"Instances_1",obj_space_check_cursor_final_score_sbvs_2p);
				}
			}
			audio_play_sound(snd_level_clear,4,false);
			//set a delay before being able to click to the next level
			//alarm[0] = 5*SEC;
			transition_delay = transition_delay_max;
			calculated_level_score = true;
		
		}
		
		if (calculated_level_score == true) transition_delay--;
		
		#region level flow order
		if (transition_delay <= 0) and (calculated_level_score == true) {
			//move to the next level
			level++;
			
			scr_level_flow();
			
			//reset level variables
			calculated_level_score = false;
			transition_delay = transition_delay_max;
			level_free_space_bonus_score = 0;
			level_free_space_bonus_score_sbvs_2p = 0;
			player1_score_modifier = 1;
			player2_score_modifier = 1;
			player3_score_modifier = 1;
			player4_score_modifier = 1;
			//possibly not needed, but reset the array at the end of each level
			for (var i=0; i<10; i++;){array_set(level_item_selection_pool,i,-1);}
		}
		#endregion
	}
	#endregion
	
	//end of level (fruit qty endurance game type)
	#region Endurance Level End
	if (remaining_items <= 0) and (game_over == false) and (game_type = ENDURANCE){
		draw_set_halign(fa_center);
		
		if (sbvs == true){
			if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
				if (obj_player1.knocked_out == true) {
					if (player1_lives > 0) draw_text(_view_width/2, 12,"Player 1 Knocked Out!");
					else {
						draw_text(_view_width/2, 12,"Player 1 Eliminated!");
					}
				}
				if (obj_player2.knocked_out == true) {
					if (player2_lives > 0) draw_text(_view_width/2, 12,"Player 2 Knocked Out!");
					else{ 
						draw_text(_view_width/2, 12,"Player 2 Eliminated!");
					}
					
				}
			}
			else draw_text(_view_width/2, 12,"Level Complete!");
		}
		else draw_text(_view_width/2, 12,"Level Complete!");
		
		
		if (level_free_space_bonus_score != 0) and (multiplayer_mode != MULTI_COMP){
			draw_text(_view_width/2, 45,"Free space bonus score "+string(level_free_space_bonus_score));
		}
		if (sbvs == true) and (multiplayer_mode == MULTI_COMP){
			draw_text(_view_width/2, 45,"Free space bonus scores: P1 "+string(level_free_space_bonus_score)+", P2 "+string(level_free_space_bonus_score_sbvs_2p));
		}
		draw_set_halign(fa_left);
		
		//pause all players
		with(obj_player_parent) has_control = false;

		
		//calculate empty space bonus endurance game type
		if (calculated_level_score == false){
			//make any currnt score cards invisible so bonus score is easy to read
			if (instance_exists(obj_score_card)) with (obj_score_card) visible = false;
			
			//calculate the score for the number of empty spaces
			if (instance_exists(obj_player1)) and (obj_player1.knocked_out == false){
				instance_create_layer(x,y,"Instances_1",obj_space_check_cursor_final_score);
			}
			//calculate score for 2p in split board mode
			if (sbvs == true) and (multiplayer_mode == MULTI_COMP){
				if (instance_exists(obj_player2)) and (obj_player2.knocked_out == false){
					instance_create_layer(x,y,"Instances_1",obj_space_check_cursor_final_score_sbvs_2p);
				}
			}
			
			//reduce lives
			if (multiplayer_mode == MULTI_COMP){
				if (instance_exists(obj_player1)) and (obj_player1.knocked_out == true) player1_lives--;
				if (instance_exists(obj_player2)) and (obj_player2.knocked_out == true) player2_lives--;
				
			}
				
			audio_play_sound(snd_level_clear,4,false);
			//set a delay before being able to click to the next level
			alarm[0] = 5*SEC;
			
			calculated_level_score = true;
		}
		
		if (alarm[0] < 0) and (calculated_level_score == true) and (endurance_level_variables_adjusted == false){
			
			
			//incriment level variables, reset level variables then restart the level
			level++;
			
			//knockouts need to be reset or the next level will get skipped automatically
			if instance_exists(obj_player1) obj_player1.knocked_out = false;
			if instance_exists(obj_player2) obj_player2.knocked_out = false;
			
			remaining_items_max += (10*number_of_players);
			remaining_items = remaining_items_max;
			imposter_shoot_speed = min(11,imposter_shoot_speed+1);
			//level_item_percent_full = min(.55+(level*.02), .75);
			//reduce spawn item rate by 5 (lower is faster)
			//limit the max speed based on the number of plaers
			switch(number_of_players){
				case 1:
					item_spawn_rate_max = max(32, item_spawn_rate_max-3); 
					level_item_percent_full = min(.55+(level*.01), .70);
				break;
				case 2: 
					item_spawn_rate_max = max(28, item_spawn_rate_max-3); 
					level_item_percent_full = min(.60+(level*.01), .74);
				break;
				case 3: 
					item_spawn_rate_max = max(26, item_spawn_rate_max-3); 
					level_item_percent_full = min(.64+(level*.01), .78);
				break;
				case 4: 
					item_spawn_rate_max = max(22, item_spawn_rate_max-3);
					level_item_percent_full = min(.68+(level*.01), .80);
				break;
			}
			//item_spawn_rate_max = max(24, item_spawn_rate_max-3);
			//incriment level color
			if (bg_color_index < 14){bg_color_index++;}
			else{bg_color_index = 0;}
			
			if (instance_exists(obj_block)){
				var _p1_starting_blocks = 0;
				var _p2_starting_blocks = 0;
				
				//count total blocks on each side
				if (sbvs == true) and (multiplayer_mode == MULTI_COMP){
					with (obj_block){
						if (my_player_board = 1) _p1_starting_blocks++;
						if (my_player_board = 2) _p2_starting_blocks++;
					}
					
					level_starting_blocks = _p1_starting_blocks;
					level_starting_blocks_sbvs_2p = _p2_starting_blocks;
				}
				//just count how many there are in total
				else{
					level_starting_blocks = instance_number(obj_block);
				}
			}
			
			//reset level variables
			calculated_level_score = false;
			level_free_space_bonus_score = 0;
			level_free_space_bonus_score_sbvs_2p = 0;
			
			//keep muliplier or reset each time?
			player1_score_modifier = 1;
			player2_score_modifier = 1;
			player3_score_modifier = 1;
			player4_score_modifier = 1;
		
			//scr_room_goto_transition_fade(room);
			if (player1_lives <= 0) or (player2_lives <= 0) room_goto(rm_ending);
			else room_restart();	
		}
	}
	#endregion
	
	//end of level (line qty marathon game type)
	#region Marathon Level End (original)
	//if (remaining_lines <= 0) and (game_over == false) and (game_type == MARATHON) {
		
		
	//	//make any end of level adjustments
	//	switch(number_of_players){
	//		case 1:
	//			scr_marathon_level_increase();	
	//		break;
	//		case 2:
	//			scr_marathon_level_increase();
	//		break;
			
	//	}
	
	//}
	
	// Marathon Level End (new)
	if (lines_this_level >= 10) and (game_over == false) and (game_type == MARATHON) {
		
		//reset 
		lines_this_level = 0;
		
		//make any end of level adjustments
		switch(number_of_players){
			case 1: scr_marathon_level_increase();	break;
			case 2: scr_marathon_level_increase();  break;
		}
	}
	
	
	#endregion
	
	//end of level (all color blocks removed)
	#region Cleanup Level End
	//check to see if either player has cleared the blocks
	if ((remaining_color_blocks_P1 <= 0) or  (remaining_color_blocks_P2 <= 0)) and (game_over == false) and (game_type == CLEANUP) {
		
		//issue present where all colored blocks are destroyed when a player knocked out, leading game to go to the next level
		
		//pause players
		if (instance_exists(obj_player_parent))	with(obj_player_parent) has_control = false;
	
	
	
		//start the pause 
		if (calculated_level_score == false){
			//set alarm before moving to the next level for a short pause
			//alarm[0] = SEC*5;
			
			level_end_timer--;
			
			//calculated_level_score = true;
		}
		
		//if the pause is finished, move to the next level
		//if (alarm[0] <= 0) and (calculated_level_score = true){
		if (level_end_timer <= 0) and (calculated_level_score == false){
			level++
			scr_level_flow();
			calculated_level_score = true;
		}
		
		
	
	}
	#endregion
	
	//end of level (one player knocked out)
	#region Blockout Level End
	if (game_type == BLOCKOUT){
		if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
		
			//use this variable to calculate any end of level changes to happen only once
			if (calculated_level_score == false) and (game_over == false) and (!instance_exists(obj_room_transition_fade)) and (!instance_exists(obj_room_transition)){
				//pause player movement
				with(obj_player_parent) has_control = false;
			
				//reduce lives if needed
				if (instance_exists(obj_player1)) and (obj_player1.knocked_out == true) {
					player1_lives--;
					
					//p2  won the round
					rounds_won_p2++;
			
				}
				if (instance_exists(obj_player2)) and (obj_player2.knocked_out == true){
					player2_lives--;
					
					//p1 won the round
					rounds_won_p1++;
				}
				
				//increase round counter
				level++;
			
				//timer to restart the level
				alarm[0] = SEC*5;
			
				calculated_level_score = true;
			}
		
			//restart after timer runs out if the game isn't over yet
			if (calculated_level_score == true) and (alarm[0] <= 0) and (game_over == false){
			
				if (rounds_won_p1 < round_wins_needed_to_win_match) and (rounds_won_p2 < round_wins_needed_to_win_match){
					//room_restart();
					switch(level){
						case 2: scr_room_goto_transition_fade(rm_2P_level_BO_VS_02); break;
						case 3: scr_room_goto_transition_fade(rm_2P_level_BO_VS_03); break;
						
					}
					calculated_level_score = false;
				}
			}
		
			//set game over alarm if one of the players is out of lives
			//if (alarm[0] <= 0) and (game_over == false) and (player1_lives <= 0 or player2_lives <=0){
			if (alarm[0] <= 0) and (game_over == false) and (rounds_won_p1 >= round_wins_needed_to_win_match or rounds_won_p2 >= round_wins_needed_to_win_match){
				alarm[0] = SEC*5;
			
				//setting a game over isn't  really needed in this mode, go straight to ending
				//game_over = true;
				scr_room_goto_transition(rm_ending);  //room_goto(rm_ending);
				//scr_room_goto_transition_fade(rm_ending);
			}
		
		}
	}
	//check if all players are knocked out to trigger game over
	#endregion
	
	#region End of level COLOR CLASH (timer over)
	if (_remaining_time < 0) and (game_over == false) and (game_type == COLOR_CLASH) and (!instance_exists(obj_room_transition_fade)){
		
		//draw the winner
		//text background
		draw_sprite_stretched(spr_timer_background,2,650,8,612,80);
					
		if (player1_color_qty > player2_color_qty){ 
			scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P1 Wins Round!").draw(_timer_x,_timer_y);
		}
		if (player1_color_qty < player2_color_qty){ 
			scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]P2 Wins Round!").draw(_timer_x,_timer_y);
		}
		if (player1_color_qty == player2_color_qty){ 
			scribble("[fa_center][fa_middle][fnt_game_gui_extra_large_3]Tie Round!").draw(_timer_x,_timer_y);
		}
		
		//use this variable to calculate any end of level changes to happen only once
		if (calculated_level_score == false) and (game_over == false) and (!instance_exists(obj_room_transition)){
			
			//pause all players and make invisible
			with(obj_player_parent){ 
				has_control = false;
				visible = false;
			}
		
			//check to see who won the round
			//P1 wins
			if (player1_color_qty > player2_color_qty){
			
				rounds_won_p1++;
			}
			//P2 Wins
			if (player1_color_qty < player2_color_qty){
			
				rounds_won_p2++;
			}
			//Tie Round
			if (player1_color_qty == player2_color_qty){
			
			
			}
			
			//increase round counter
			level++;
			
			//timer to restart the level
			alarm[0] = SEC*5;
			
			calculated_level_score = true;
		}
		
		//restart after timer runs out if the game isn't over yet
		//if the match is over, go to the ending screen
		if (calculated_level_score == true) and (alarm[0] <= 0) and (game_over == false){
			
			if (rounds_won_p1 < round_wins_needed_to_win_match) and (rounds_won_p2 < round_wins_needed_to_win_match){
				//room_restart();
				switch(level){
					case 2: scr_room_goto_transition_fade(rm_2P_level_CC_2); break;
					case 3: scr_room_goto_transition_fade(rm_2P_level_CC_3); break;
						
				}
				//calculated_level_score = false;
			}
			
			//go to the ending if a player won the required number of matches or the current level was the final one
			var _final_room = rm_2P_level_CC_3;
			if (rounds_won_p1 >= round_wins_needed_to_win_match or rounds_won_p2 >= round_wins_needed_to_win_match) or (room == _final_room){
				//alarm[0] = SEC*5;
				scr_room_goto_transition(rm_ending);  
			}
			
		}
		
		
		//End the match if a player has won the number of matches needed
		//if (alarm[0] <= 0) and (game_over == false) and (rounds_won_p1 >= round_wins_needed_to_win_match or rounds_won_p2 >= round_wins_needed_to_win_match){
		//	//alarm[0] = SEC*5;
		//	scr_room_goto_transition(rm_ending);  
		//}
	
	}
	#endregion
	
	
	if (sbvs == true){
		//game over all modes if both players are knocked out
		if (instance_exists(obj_player1) and obj_player1.knocked_out == true) and (instance_exists(obj_player2) and obj_player2.knocked_out == true){
			if (game_over == false){
				game_over = true;
				alarm[0] = SEC*5; //delay to transition to ending screen
			}
		}
		//stop the level
		if (instance_exists(obj_player1) and obj_player1.knocked_out == true) or (instance_exists(obj_player2) and obj_player2.knocked_out == true){
			//classic - end timer
			if (game_type == CLASSIC) level_timer = -100;
			//endurance - reduce remaining items
			if (game_type == ENDURANCE) remaining_items = 0;
			
			//check to see if the player that was knocked out had a lower score, if they did, then they lost
			//if they had a higher score, the other player can continue until they are eliminated to try to catch up
			if (game_type == MARATHON){
				
				
				
				
			}
		}
	}
	
	//if the game is over
	if (game_over == true){
		if (room == rm_attract_mode){
			room_goto(rm_main_menu);
		}
		
		//go to ending screen for marathon mode
		if (game_type == ENDURANCE) and (alarm[0] <= -1) room_goto(rm_ending);
		
		//go to ending screen for marathon mode
		if (game_type == MARATHON) and (alarm[0] <= -1) scr_room_goto_transition(rm_ending); //room_goto(rm_ending);
		
		//go to ending screen for marathon mode
		if (game_type == BLOCKOUT) and (alarm[0] <= -1) scr_room_goto_transition(rm_ending); //room_goto(rm_ending);
		
		//instance_deactivate_all(true);
		draw_set_halign(fa_center);
		draw_set_font(fnt_game_gui_extra_large_2);
		
		var _w = display_get_gui_width();
		var _h = display_get_gui_height();

		var c = c_black;
		
		fade_in_current+=.02;
		fade_in_current = min(fade_in_current,fade_in_max);
		
		draw_set_alpha(fade_in_current);
		draw_rectangle_color(0,0,_w,_h,c,c,c,c,false);
		draw_set_alpha(1);
		
		//draw_text(_view_width/2,20, "GAME OVER");
		scribble("[fa_center][fa_middle][fnt_game_gui_largest_3]GAME OVER").draw((_view_width/2)+3,(_view_height/2));
	
		
		draw_set_halign(fa_left)
		draw_set_font(fnt_game_gui_medium_2)
		
		if (instance_exists(obj_score_card)) instance_destroy(obj_score_card);
		
		if (instance_exists(obj_item_spawner)) instance_destroy(obj_item_spawner);		
		if (instance_exists(obj_item_spawner_sbvs_2p)) instance_destroy(obj_item_spawner_sbvs_2p);	
	
		if (instance_exists(obj_player_parent)){
			//instance_destroy(obj_player_parent);
			image_blend = c_gray;
		}
		if (instance_exists(obj_item_spawner_imposter)){
			instance_destroy(obj_item_spawner_imposter);			
		}
		if (instance_exists(obj_target)){
			instance_destroy(obj_target);			
		}
		if (instance_exists(obj_fruit_parent)){
			instance_destroy(obj_fruit_parent);			
		}
		//timer to delay pressing a button to go to next screen
		if (calculated_level_score == false){ 
			audio_play_sound(snd_lose,4,false);
			alarm[0] = 5*SEC;
			calculated_level_score = true;
		}
		scr_check_for_new_high_score();
	}
	
	//only decrease timer if there are no intros or transitions happening
	if (!instance_exists(obj_room_transition_fade)) and (!instance_exists(obj_level_intro)) level_timer --;
}
#endregion
#region debug
if (debug){
	fps_counter++;
	
	if (fps_counter >= 60){
		fps_per_second = string(fps_real);
		fps_counter = 0;
	}
	draw_text(5,5,"FPS: "+string(fps_per_second));
	var _w = view_get_wport(0);
	var _h = view_get_hport(0)
	draw_line_color(_w/2,0,_w/2,_h,c_red,c_red);
	draw_line_color(_w/4,0,_w/4,_h,c_yellow,c_yellow);
	draw_line_color(_w/2 + _w/4,0,_w/2+_w/4,_h,c_yellow,c_yellow);
	
	draw_line_color(0,_h/2,_w,_h/2,c_red,c_blue);
	draw_line_color(0,_h/4,_w,_h/4,c_yellow,c_green);
	draw_line_color(0,_h/4+_h/2,_w,_h/4+_h/2,c_yellow,c_green);
}
#endregion

//var c = c_dkgray;
//draw_set_alpha(1);
//draw_rectangle_color(3,5,460,165,c,c,c,c,false);
//draw_set_alpha(1);
//draw_text(10,10, "window size      "+string(window_get_width())+","+string(window_get_height()));
//draw_text(10,40, "display size     "+string(display_get_width())+","+string(display_get_height()));
//draw_text(10,70, "display gui size "+string(display_get_gui_width())+","+string(display_get_gui_height()));
//draw_text(10,100,"viewport size    "+string(view_get_wport(0))+","+string(view_get_hport(0)));
//draw_text(10,130,"camera size      "+string(camera_get_view_width(0))+","+string(camera_get_view_height(0)));
//window_get_fullscreen()

