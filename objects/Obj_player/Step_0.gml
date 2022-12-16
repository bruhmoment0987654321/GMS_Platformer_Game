/// @desc Core Player Logic

//player standing still

image_speed = 0;

//get player inputs

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//crouch 
if (keyboard_check(ord("S"))){
	
}
//calculate movement

var _move = key_right - key_left;
hsp = _move * walksp;
vsp = vsp + grv;

if (place_meeting(x,y+1,Obj_wall)) && (key_jump){
	vsp = -jumpsp
}

// horizontal collision
if (place_meeting(x+hsp,y,Obj_wall)){
	
	while (!place_meeting(x+sign(hsp),y,Obj_wall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,Obj_wall)){
	
	while (!place_meeting(x,y+sign(vsp),Obj_wall)){
		y = y + sign(hsp);
	}
	vsp = 0;
}
y = y + vsp;