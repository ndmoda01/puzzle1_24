///@arg title
///@arg coop_player#
///@arg comp_player#

function scr_draw_high_scores(argument0, argument1, argument2){
	
	var _title = argument0;
	var _coop = argument1;
	var _comp = argument2;
	
	draw_text(60,90,_title);
		
	var _x = 618;
	var _y = 90;
	var _x_buffer = 300;
	var _y_buffer = 75;
	
	draw_text(_x, _y+12,"Rank");	
	draw_text(_x+(_x_buffer*1), _y+12,"Score");
	draw_text(_x+(_x_buffer*2), _y+12,"Name");
	
	if (_coop == SINGLE_PLAYER){
		_y_buffer = 84;
		
		draw_text(_x, _y+(_y_buffer*1),"1st");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*1),string(high_score_array[_coop,1]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*1),high_score_array[_coop,11]);

		
		draw_text(_x, _y+(_y_buffer*2),"2nd");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*2),string(high_score_array[_coop,2]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*2),high_score_array[_coop,12]);
		
		draw_text(_x, _y+(_y_buffer*3),"3rd");	           
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*3),string(high_score_array[_coop,3]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*3),high_score_array[_coop,13]);
		
		draw_text(_x, _y+(_y_buffer*4),"4th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*4),string(high_score_array[_coop,4]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*4),high_score_array[_coop,14]);
		
		draw_sprite_part_ext(spr_wall_interior2,0,0,32,16,16,288,528,84,3,c_white,1);
		
		draw_text(_x, _y+(_y_buffer*5),"5th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*5),string(high_score_array[_coop,5]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*5),high_score_array[_coop,15]);
	
		draw_text(_x, _y+(_y_buffer*6),"6th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*6),string(high_score_array[_comp,6]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*6),high_score_array[_comp,16]);
		
		draw_text(_x, _y+(_y_buffer*7),"7th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*7),string(high_score_array[_comp,7]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*7),high_score_array[_comp,17]);
		
		draw_text(_x, _y+(_y_buffer*8),"8th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*8),string(high_score_array[_comp,8]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*8),high_score_array[_comp,18]);
		
		draw_text(_x, _y+(_y_buffer*9),"9th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*9),string(high_score_array[_comp,9]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*9),high_score_array[_comp,19]);
		
		draw_text(_x, _y+(_y_buffer*10),"10th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*10),string(high_score_array[_comp,10]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*10),high_score_array[_comp,20]);
		
	}
	else{			
		draw_text(_x+(_x_buffer*0)-300, _y+(_y_buffer*3),"Cooperative");
	
		draw_text(_x, _y+(_y_buffer*1),"1st");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*1),string(high_score_array[_coop,1]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*1),high_score_array[_coop,11]);

		draw_text(_x, _y+(_y_buffer*2),"2nd");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*2),string(high_score_array[_coop,2]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*2),high_score_array[_coop,12]);
		
		draw_text(_x, _y+(_y_buffer*3),"3rd");	           
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*3),string(high_score_array[_coop,3]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*3),high_score_array[_coop,13]);
		
		draw_text(_x, _y+(_y_buffer*4),"4th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*4),string(high_score_array[_coop,4]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*4),high_score_array[_coop,14]);
		
		draw_text(_x, _y+(_y_buffer*5),"5th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*5),string(high_score_array[_coop,5]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*5),high_score_array[_coop,15]);
		
		//separator
		//draw_sprite_part_ext(spr_wall_background_match,0,0,0,16,16,96,176,28,2,c_white,1);
	
		//adjust y to shift 2nd portion down
		_y = 195;
	
		draw_text(_x+(_x_buffer*0)-300, _y+(_y_buffer*8),"Competitive");
	
		draw_text(_x, _y+(_y_buffer*6),"1st");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*6),string(high_score_array[_comp,1]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*6),high_score_array[_comp,11]);
		
		draw_text(_x, _y+(_y_buffer*7),"2nd");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*7),string(high_score_array[_comp,2]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*7),high_score_array[_comp,12]);
		
		draw_text(_x, _y+(_y_buffer*8),"3rd");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*8),string(high_score_array[_comp,3]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*8),high_score_array[_comp,13]);
		
		draw_text(_x, _y+(_y_buffer*9),"4th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*9),string(high_score_array[_comp,4]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*9),high_score_array[_comp,14]);
		
		draw_text(_x, _y+(_y_buffer*10),"5th");	
		draw_text(_x+(_x_buffer*1), _y+(_y_buffer*10),string(high_score_array[_comp,5]));
		draw_text(_x+(_x_buffer*2), _y+(_y_buffer*10),high_score_array[_comp,15]);
	}
}