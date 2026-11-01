//custom function
function setOnGround( _val = true) 
{
	if (_val = true)
	{
		onGround = true
		CoyoteHangTimer = CoyoteHangFrames;
	} else
	{
		onGround = false;
		CoyoteHangTimer = 0;
	}
	
			
}

conSetup();

//movement
moveDir = 0;
moveSpd = 5;
xspd = 0;
yspd = 0;

//jumping
grav = .775
termVel = 14;
jspd = -6.15;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames[0] = 10;
jumpHoldFrames[1] = 5;
onGround = false;

//coyote time
//hang time
CoyoteHangFrames = 2;
CoyoteHangTimer = 0;

//jumptime
CoyoteJumpFrames = 15;
CoyoteJumpTimer = 0;