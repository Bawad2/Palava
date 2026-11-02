getControls()


//set new zoom target
if ctrl and mouse_wheel_up() { ZoomTarget -= ZoomIntv; };
if ctrl and mouse_wheel_down() { ZoomTarget += ZoomIntv; };

//get smooth tansition
CurrentZoom = lerp( CurrentZoom, ZoomTarget, ZoomSpeed);



//set the positon of the camera

var camX = camera_get_view_x(cam)
var camY = camera_get_view_y(cam)
var W_diff = camera_get_view_width(cam) -  baseW*CurrentZoom ;
var H_diff = camera_get_view_height(cam) - baseH*CurrentZoom;

camera_set_view_pos(cam, camX + (W_diff/2), camY + (H_diff/2));


//set new zoom
camera_set_view_size( cam, baseW*CurrentZoom, baseH*CurrentZoom);

