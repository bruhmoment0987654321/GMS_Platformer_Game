var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);
var onTheGround = place_meeting(x, y + 1, Obj_wall);
var onAWall = place_meeting(x-5, y,Obj_wall) - place_meeting(x+5, y,Obj_wall);
mvtLocked = max(mvtLocked - 1, 0);
 
if (onAWall != 0) ySpeed = min(ySpeed + 1, 2);
else ySpeed++;
 
if (mvtLocked <= 0) {
    if (xDirection != 0) image_xscale = xDirection;
    xSpeed = xDirection * spd;
 
    if (jump) {
        if (onTheGround) {
            ySpeed = -17;
        } 
    
        if (onAWall != 0) {
            ySpeed = -15;
            xSpeed = onAWall * spd;
            mvtLocked = 10;
        }
    }
}
 
if (onTheGround) {
    if (xDirection != 0) { sprite_index = Spr_player_walk; } 
    else { sprite_index = Spr_player; }
} else if (onAWall != 0) {
    image_xscale = onAWall;
    sprite_index = Spr_player_wall_jump;
} else {
    sprite_index = Spr_player_jump;
}
 
if (place_meeting(x + xSpeed, y,Obj_wall)) { 
    
    while (!place_meeting(x + sign(xSpeed), y,Obj_wall)) {
        x += sign(xSpeed);
    }
    xSpeed = 0; 
}
 
x += xSpeed;
 
 
if (place_meeting(x, y + ySpeed,Obj_wall)) { 
    
    while (!place_meeting(x, y + sign(ySpeed),Obj_wall)) {
        y += sign(ySpeed);
    }
    
    ySpeed = 0; 
}
 
y += ySpeed;
