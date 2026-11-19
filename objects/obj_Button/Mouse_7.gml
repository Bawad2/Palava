
show_debug_message(Button_ID)

switch (Button_ID)
{
	case 0 :

	//Game start button
	if room != rm_test
{
	room = rm_test;
	layer_set_visible("MainMenu", false)
}
		
	break;
	
	case 1:
	//restart button
	 layer_set_visible("GameOverScreen", false ); 
	 obj_Player.Hp = obj_Player.HpMax;
	 show_debug_message("button works fine code shi")
	break;
	
	
	case 2 :
	

	//buy skills
	if global.Coins >= global.selectedSkill
	{
		global.Coins -= global.selectedSkill.price;
		array_push( global.CurrentSkills, global.selectedSkill.SkillName);
		
	}
	

	
	break;
	
	
	case 3:
	//quit button
	layer_set_visible("Details", false); 
	layer_set_visible( self.layer, false)
	
	
	break;
	
	case 4:
	//Go to skill shop button
	layer_set_visible("SkillShop", true);
	layer_set_visible("Details", true);
	
	break;
	
}