linger --;

if linger <= 0 { instance_destroy(); }
if place_meeting( x, y, pr_ENEMYS) { pr_ENEMYS.Hp -= Dmg; instance_destroy();}