conSetup();

//get the values of the current camera

cam = view_camera[0]

baseH = camera_get_view_height(cam);
baseW = camera_get_view_width(cam);

//Zoom limits and settings

ZoomTarget = 1;
ZoomIntv   = 0.4; //how much the zoom will increse by
CurrentZoom = 1;
ZoomSpeed = 0.02;


