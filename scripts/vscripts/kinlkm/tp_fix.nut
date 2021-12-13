function TeleportTeam(team,_x,_y,_z)
{
/**
* TEAM 1 = ct/人类, TEAM 2 = t/僵尸
* _x,_y,_z = x,y,z
*  xxx runscriptcode "TeleportTeam(1,100,100,64);"
**/
	team = 4-team;
	local p = null;
	while(null != (p = Entities.FindByClassname(p, "player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == team && p.GetHealth()>0 && !p.IsNoclipping())
		{
			EntFireByHandle(p, "AddOutput", "origin "+_x + " "+_y+" "+_z, 0.00, self, self);
		}
	} 
}


function Z_check_TeleportTeam(team,_sign,_check,_x,_y,_z)
/**
* TEAM 1 = ct/人类, TEAM 2 = t/僵尸
* _sign  1 = 大于当前设定z轴则传送   2 = 小于当前设定z轴则传送
* _check = 需要检查的z轴
* 大于检测z 传送 xxx runscriptcode "Z_check_TeleportTeam(1,1,检测的z轴,100,100,64);"
* 小于检测z 传送 xxx runscriptcode "Z_check_TeleportTeam(1,2,检测的z轴,100,100,64);"
**/
{
	team = 4-team;
	local p = null;

	while(null != (p = Entities.FindByClassname(p, "player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == team && p.GetHealth()>0 && !p.IsNoclipping())
		{
			if(_sign == 1)
			{
				if(p.GetOrigin().z > _check)
				{
					EntFireByHandle(p, "AddOutput", "origin "+_x + " "+_y+" "+_z, 0.00, self, self);
				}
			}
			if(_sign == 2)
			{
				if(p.GetOrigin().z < _check)
				{
					EntFireByHandle(p, "AddOutput", "origin "+_x + " "+_y+" "+_z, 0.00, self, self);
				}
			}
			else
			{
				if(p.GetOrigin().z == _check)
				{
					EntFireByHandle(p, "AddOutput", "origin "+_x + " "+_y+" "+_z, 0.00, self, self);
				}
			}
		}
	} 
}

function KillAllT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == 2 && p.GetHealth()>0)
			EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
	}
}

function KillAllCT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetTeam() == 3 && p.GetHealth()>0)
			EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
	}
}

function KillAll()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if(p != null && p.IsValid() && p.GetHealth()>0)
		EntFireByHandle(p, "SetHealth", "-69", 0.00, null, null);
	}
}
