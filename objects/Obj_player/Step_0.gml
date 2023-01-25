/// @desc Core Player Logic

//establishing variables
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);
var onTheGround = place_meeting(x,y+1,Obj_wall);

//makes it so that the player faces the direction the last button was pressed
if (xDirection != 0) image_xscale = xDirection;

//moves the player left and right
xSpeed = xDirection * spd;

//making the player get pull down AKA gravity function
ySpeed++;

if (onTheGround){
	//animation for the walking animation and idle animation
	if (xDirection != 0) { sprite_index = Spr_player_walk; }
	else {sprite_index = Spr_player;}

	//making the player JUMP (modifible)(can't spell)
	if (jump) {
		ySpeed = -17;	
	}
}else{
	//jumping animation
	sprite_index = Spr_player_jump;
}

//horizontal collision 
if (place_meeting(x + xSpeed,y,Obj_wall)){
	xSpeed = 0;
}

//vertical collision
if (place_meeting(x,y+ySpeed,Obj_wall)){
	ySpeed = 0;
}
//applying the x and y positions to the player
x += xSpeed;
y += ySpeed;


