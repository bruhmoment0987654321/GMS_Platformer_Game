/// @description centering the player on the camera

//
var xCam = clamp(Obj_player.x -wCam/2,0,room_width - wCam);
var yCam = clamp(Obj_player.y -hCam/2,0,room_height - hCam);

//setting up current x and y position of camera
var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var newX = lerp(curX,xCam,0.1);
var newY = lerp(curY,yCam,0.1);

//sets up the camera position
camera_set_view_pos(view_camera[0],newX,newY);

//parallax effect on background
layer_x(layer_get_id("Background"),newX * 0.05);
layer_y(layer_get_id("Background"),newY * 0.05);