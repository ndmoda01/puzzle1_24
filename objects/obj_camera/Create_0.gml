cam = view_camera[0];

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

//start in the middle of the room 
x = room_width/2;
y = room_height/2;

current_camera_width = 640;
current_camera_height = 360;
current_x_room_offset = 0;
current_y_room_offset = 0;
current_camera_x = x;
current_camera_y = y;
current_camera_saved = false;

x_room_offset = 0;
y_room_offset = 0;

//how long will the screen shake happen (in frames)
shake_length = 0;
//how strong will it be / how much offset to apply to the camera (radius
shake_magnitude = 0;
//shake remain is same as magnitude, but gradually decreases until it hits 0
shake_remain = 0;
//buffer boarder for screen shake to prevent shaking outside of screen
//buffer should be larger than the largest magnetude screen shake in the game
//or the camera can shake outside of the room (will slighly zoom in the camera)
buff = 0;

paused = false;
