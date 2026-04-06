if (live_call()) return live_result;

//screenshot
//window size, screenshot size
//game fullscreen,    screenshot 2560x1440
//game normal window, screenshot 1920x1080
//game 667x881,       screenshot 667x375 (black boarders not captured in screen shot)
//screenshot size is whatever the window size is, minus the black bar area (if there are any)
//screenshot is only of the "game" area of the window
//screenshot must be scaled to the draw gui (1920x1080) so that it looks correct

//screenshot doesn't seem to be scaling properly in fullscreen mode
//screenshot displays zoomed in when at fullscreen or zoomed out when smaller than 1080
//screenshot is taken at 1440, then that image is displayed in a 1080 game resolution making it seem zoomed in

//get ratio of internal game resolution 1920 x 1080 to current viewport


view_width = view_get_wport(0);
view_height = view_get_hport(0);

width_ratio = 1920/window_get_width();
height_ratio = 1080/window_get_height();

width_adjust = window_get_width()/1920;
height_adjust = window_get_height()/1080;

window_size_w = window_get_width();
window_size_h = window_get_height();

display_gui_w = display_get_gui_width();
display_gui_h = display_get_gui_height();

target_room = noone;


//fade transition
// 0 fade in
// 1 fade out
state = 0;
alpha = 0;
transition_speed = .03;

//put in in front of everything
depth = -1000


//endurance
starting_level = obj_game.level;





