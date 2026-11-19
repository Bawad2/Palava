//initialization
getControls()


//MAKE THIS GUY LOOP
move_wrap(true, true, 1)

//restart button
if killButton { game_restart();}

//Hp
if Hp <= 0  { state = stateDead;}

//Check for upgrades
if array_contains( global.CurrentSkills, "CanDash") and !upgradeDash { upgradeDash = 1; }



state();

