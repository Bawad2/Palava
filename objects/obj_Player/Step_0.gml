getControls();

//X movement
	//Direction
	moveDir = rightKey - leftKey;

	//get xspd
	
	xspd = moveDir * moveSpd;
	
	//X collisons
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_wall)
	{
		//scoot up to the wall
		var _pixelCheck = _subPixel * sign(xspd);
		
		while !place_meeting( x + _pixelCheck, y, obj_wall)
		{
			x += _pixelCheck;	
		}
		
		
		
		//STOP
		xspd = 0;
		
	}
	


//MOVE
x += xspd;