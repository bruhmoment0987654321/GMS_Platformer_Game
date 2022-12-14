/// @desc Core Player Logic

//player standing still
image_speed = 0;
//get player inputs

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var _move = key_right - key_left;
hsp = _move * walksp;
x = x + hsp;

//animating movement