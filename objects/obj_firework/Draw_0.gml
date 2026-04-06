draw_self();

image_blend = my_color;

if (state == "shooting"){
	
	y -= speed;
	frames_until_explode--;
	
	if (frames_until_explode <= 0){
		speed = 0;
		instance_destroy();
	}
}