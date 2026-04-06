///@arg letter_to_add
//run by obj_high_score_letter_selector

function scr_add_letter_to_initials(argument0){
	
	var _new_letter = argument0;
	if (number_of_initials_entered < 3){
		current_char = _new_letter;
		initial = initial+current_char+" ";
		number_of_initials_entered++;
	}

}