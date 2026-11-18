//Change details and sprite based on which skill you are
global.selectedSkill = self;

switch( skillIndex)
{
	//MOCKUP
	case "MOCKUP":
	sprite = spr_Skill;
	spriteHD = spr_SkillHD;
	skillDetail = " this is MOCK UP and you get absolutly nothing by buying it.( so far ig maybe I'll add a achivemnet later or smthing)"
	price = 1;
	
	break;
	
	case "REDSKILL" :
	sprite = spr_Skill
	spriteHD = spr_SkillHD2;
	skillDetail = " IM RED"
	price = 2;
	
	
	break;

}