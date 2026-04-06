///@arg initial_with_spaces

function scr_delete_space_initials(argument0){
	
	var _updated_initial = argument0;
	
	_updated_initial = string_delete(_updated_initial,4,1);
	_updated_initial = string_delete(_updated_initial,2,1);
	
	return(_updated_initial);

}