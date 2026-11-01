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

//spites
MaskSprite = spr_Playeridle;
sIdle = spr_Playeridle;
sRunning = spr_PlayerRun;
sWalk = spr_PlayerWalk;
sJumping = spr_PlayerJump;

//movement
face = 1;
moveDir = 0;
runtype = 0;
moveSpd[0] = 2;
moveSpd[1] = 5;
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