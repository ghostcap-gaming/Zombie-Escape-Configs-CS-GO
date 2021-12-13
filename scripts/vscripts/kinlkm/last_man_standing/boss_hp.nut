kinlkm_text <- null;
boss_time_text <-  null;
kinlkm_bosshp <- 0;
temp <- null;
boss_time <- 112;


function Int()
{
    kinlkm_text = Entities.FindByName(null,"kinlkm_text");
    kinlkm_bosshp = 0;
	if( (kinlkm_text != null) && (kinlkm_text.GetClassname() == "game_text") )
	{
		temp = kinlkm_text.GetName();
		//printl("初始化成功");
	}
	else
	{
		printl("boss_hp.nut 初始化失败");
	}
}

function text_change()
{
	if (BossHpBar >= 1)
	{
		EntFire("Zombie_Item_Boss_Super_Health","RunScriptCode","kinlkm_bosshp=HudHealth",0.00,null);
		if(kinlkm_bosshp != 0)
		{
			EntFire(temp,"Display","",0,null);
			kinlkm_text.__KeyValueFromString("message", "艾利克斯剩余血量" + " " + ":" + " " + kinlkm_bosshp + "\n" + boss_time_text );
		}
	}
	else if(BossHpBar <= 0)
	{
		kinlkm_text.__KeyValueFromString("message", "艾利克斯死了");
		EntFire(temp,"Display","",0,null);
		EntFire("hud_timer","Disable","",0.00,null);
	}
}

function Time_Tick()
{
	boss_time_text = "距离BOSS杀死我们还剩余 : " + boss_time + " 秒";
	EntFireByHandle(self,"RunScriptCode","boss_time-=1;",1.00,null,null);

	if(boss_time <= 0)
	{
		EntFire("hud_timer","Disable","",0,null);
	}
}
