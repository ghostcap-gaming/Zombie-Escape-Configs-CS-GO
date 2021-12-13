function SetPlayerScript()
{
	local FplHu = null;
	while(null != (FplHu = Entities.FindByClassname(FplHu, "player")))
	{
		if(FplHu.GetTeam() == 3 && FplHu.GetHealth() > 0 && FplHu.GetName() != "player_s" && FplHu.GetName() != "harrypotter")
		{
			EntFire("!activator", "RunScriptFile", "kinlkm/ze_harry_potter_v2_1_csgo/harry_player_fix.nut", 0.00, FplHu);
 			EntFire("!activator", "AddOutput", "targetname player_s", 0.01, FplHu);
		}
	}
	local FplZm = null;
	while(null != (FplZm = Entities.FindByClassname(FplZm, "player")))
	{
		if(FplZm.GetTeam() == 2 && FplZm.GetHealth() > 0 && FplZm.GetName() != "player_s" && FplZm.GetName() != "harrypotter")
		{
			EntFire("!activator", "RunScriptFile", "kinlkm/ze_harry_potter_v2_1_csgo/harry_player_fix.nut", 0.00, FplZm);
			EntFire("!activator", "AddOutput", "targetname player_s", 0.01, FplZm);
		}
	}
}
