//MAKE THIS GUY LOOP
move_wrap(true, true, 1)

getControls();

//X movement
#region
	//Direction
	moveDir = rightKey - leftKey;
	//get face
	if moveDir != 0 { face = moveDir}
	//run if runkey
	
	if shiftkey { runtype = 1 } else { runtype = 0; }
	
	//get xspd
	
	xspd = moveDir * moveSpd[runtype];
	
	//X collisons
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_wall)
	{
	
		if !place_meeting( x + xspd, y - abs(xspd) - 3, obj_wall)
		{
			while place_meeting( x + xspd, y , obj_wall) {  y -= _subPixel; }
		} 
		//regular collison if no slop but first celling
		
		else
		{
			//celling check
			if !place_meeting(x + xspd, y + abs(yspd) + 2, obj_wall) 
			{
				while place_meeting( x + xspd, y , obj_wall) { y += 1; }
			} 
		//normal
		else {
			
		//scoot up to the wall
		var _pixelCheck = _subPixel * sign(xspd);
		
		
		while !place_meeting( x + _pixelCheck, y, obj_wall)  {	x += _pixelCheck;  }
			
		//STOP
		xspd = 0;
			}
		}
	}

//go down slopes
if yspd >= 0 and !place_meeting( x + xspd, y + 1, obj_wall) and place_meeting( x + xspd, y + abs(xspd) + 1, obj_wall)
{
	while !place_meeting( x + xspd, y + 1, obj_wall) { y += 1; }
}



#endregion
//Y movement
#region
	//grav
	if CoyoteHangTimer > 0
	{
		CoyoteHangTimer --;
	} else {
	yspd += grav;
	setOnGround( false )
	}
	//reset jump variables
	if onGround 
	{
		jumpCount = 0; 
		jumpHoldTimer = 0;
		CoyoteJumpTimer = CoyoteJumpFrames;
	} else { 
		
		CoyoteJumpTimer--;
		if jumpCount == 0 and CoyoteJumpTimer <= 0 { jumpCount = 1; }  
		
		}
	
	
	//initaite the Jump
	if jkeybufferd and jumpCount < jumpMax
	{	
		//reset buffer
		jkeybufferd = 0;
		jkeybuffertimer = 0;
		
		//increse the number of jumps performed
		jumpCount ++;
		
		
		//jump
		jumpHoldTimer = jumpHoldFrames[jumpCount - 1];
		
		//your ahh is not on the ground
		setOnGround(false)
	}
	
	if !jumpKey { jumpHoldTimer = 0; }
	
	//jump if the holdtimer is running
	if jumpHoldTimer > 0
	{
		yspd = jspd
		jumpHoldTimer --;
	} 
	
	
	//quickfall
	
	if downKey { yspd += 1; }
	
	
	//Y collison
	if yspd > termVel {  yspd = termVel;}
	
	if place_meeting( x, y + yspd, obj_wall)
	{
		
	//scoot up to the wall
		var _pixelCheck = _subPixel * sign(yspd);
		
		while !place_meeting( x , y + _pixelCheck, obj_wall)
		{
			y += _pixelCheck;	
		}
		
		yspd = 0;
		jumpHoldTimer = 0;
		
	}
	
	//set if im on the ground
	
	if yspd >= 0 and ( place_meeting( x, y + 1, obj_wall) or place_meeting( x + 2, y + 1, obj_wall) ) { setOnGround() }


#endregion

//sprite updating

#region
if abs(xspd) > 0  { sprite_index = sWalk;  } else { sprite_index = sIdle;  };
if abs(xspd) >= moveSpd[1] { sprite_index = sRunning; }
if !onGround { sprite_index = sJumping } 

//set collisons
	mask_index = MaskSprite;
#endregion

//MOVE
x += xspd;
y += yspd;