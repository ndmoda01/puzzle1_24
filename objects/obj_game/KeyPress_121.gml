/// @description fast level end

if (game_type == CLASSIC){
	level_timer = 3*SEC;
}
if (game_type == ENDURANCE) and (remaining_items > 3){
	remaining_items = 3;
}
