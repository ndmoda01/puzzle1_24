
x_speed = lengthdir_x(move_speed,direction);
y_speed = lengthdir_y(move_speed,direction);

if (place_meeting(x+x_speed,y,obj_wall) or place_meeting(x+x_speed,y,obj_block)) {
	//direction += choose(-45,45);
	direction = abs(180-direction);
	x_speed = 0;	
}

if (place_meeting(x,y+y_speed,obj_wall) or place_meeting(x,y+y_speed,obj_block)){
	//direction += choose(-45,45);
	direction = abs(360-direction);
	y_speed = 0;
}

x = x+x_speed;
y = y+y_speed;



my_lifespan--;


//fade out
if (my_lifespan < 15){
	image_alpha = (my_lifespan)*.1;	
}

if (my_lifespan mod 5 == 0){
	move_speed *= .85;
	//cover_alpha *=.5;
	//image_alpha *= .7;	
}

//if (my_lifespan <= 0) or (move_speed < .9) instance_destroy();
if (my_lifespan <= 0) or (move_speed <= 0.5) instance_destroy();