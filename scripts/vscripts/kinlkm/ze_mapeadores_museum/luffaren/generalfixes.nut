//==================================\\
// By Luffaren (STEAM_1:1:22521282) \\
//==================================\\

function TerminatorMusicPick()
{
	local i = RandomInt(1,26);
	self.PrecacheScriptSound("music/termi/termi_sound"+i.tostring()+".mp3");
	EntFire("nokillpls_termi_sound","AddOutput","message music/termi/termi_sound"+i.tostring()+".mp3",0.00,null);
	EntFire("nokillpls_termi_sound","Volume","0",0.00,null);
	EntFire("nokillpls_termi_sound","StopSound","",0.00,null);
	EntFire("nokillpls_termi_sound","PlaySound","",0.05,null);
	EntFire("nokillpls_termi_sound","Volume","10",0.05,null);
	EntFire("nokillpls_termi_sound","Volume","10",0.06,null);
}

zplit_hp_add <- 10;			//how much HP you get for each bullet when shooting the boss
zplit_hp_max <- 1000;		//the max-allowed HP you can get for shooting the boss
function ZplitHPAdd()
{
	if(activator==null||!activator.IsValid())return;
	local hp = activator.GetHealth();
	hp += zplit_hp_add;
	if(hp > zplit_hp_max)hp = (0+zplit_hp_max);
	EntFireByHandle(activator,"AddOutput","max_health "+hp.tostring(),0.00,null,null);
	EntFireByHandle(activator,"AddOutput","health "+hp.tostring(),0.01,null,null);
}
function ZplitGiveM4()
{
	local ii = 0.00;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		if(h==null||!h.IsValid()||h.GetHealth()<=0.00||h.GetTeam()!=3)continue;
		ii+=0.01;
		EntFire("zplit_game_money_robbery","SpendMoneyFromPlayer","",ii,h);
		EntFire("zplit_m4equip","Use","",ii+0.01,h);
	}
}

function MojoNadeCrashFix()
{
	local ii = 0.00;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		if(h==null||!h.IsValid()||h.GetTeam()!=3||h.GetHealth()<=0.00)continue;
		ii += 0.03;
		EntFireByHandle(self,"RunScriptCode"," MojoNadeCrashFixPost(); ",ii,h,null);
	}
}
function MojoNadeCrashFixPost()
{
	if(activator==null||!activator.IsValid()||activator.GetTeam()!=3||activator.GetHealth()<=0.00)return;
	EntFire("mojo_nade_equip","Use","",0.00,activator);
}

pika <- null;
pikatickrate <- 0.02;
pikaspeed <- 2.00;
pikastartpos <- Vector(-15292,14612,13568);
pikaendpos <- Vector(-15292,14056,13568);
pikamovestate <- true;
function PikaWalk()
{
	pika = Entities.FindByName(null,"secretpika");
	PikaWalkTick();
}
function PikaWalkTick()
{
	if(pika==null||!pika.IsValid())return;
	EntFireByHandle(self,"RunScriptCode"," PikaWalkTick(); ",pikatickrate,null,null);
	local dir=null;if(pikamovestate){dir=(pikaendpos-pika.GetOrigin());}else {dir=(pikastartpos-pika.GetOrigin());}
	dir.Norm();
	local angdir = Vector(dir.x,dir.y,0);angdir.Norm();pika.SetForwardVector(angdir);
	local newpos = (pika.GetOrigin()+(dir*pikaspeed));pika.SetOrigin(newpos);
	if(pikamovestate&&GetDistance(pika.GetOrigin(),pikaendpos)<=(pikaspeed*1.25))pikamovestate = !pikamovestate;
	else if(!pikamovestate&&GetDistance(pika.GetOrigin(),pikastartpos)<=(pikaspeed*1.25))pikamovestate = !pikamovestate;
}
function GetDistance(v1,v2){return sqrt((v1.x-v2.x)*(v1.x-v2.x)+(v1.y-v2.y)*(v1.y-v2.y)+(v1.z-v2.z)*(v1.z-v2.z));}

max_gnomes <- 5;		//how many players that can pick the gnome-skin in spawn at max (except zombies)
gnomecount <- 0;
function GimmeGnome()
{
	if(gnomecount>=max_gnomes)
	{
		EntFire("secretgnome_model","FireUser1","",0.00,null);
		return;
	}
	if(activator==null||!activator.IsValid()||activator.GetHealth()>=666)return;
	gnomecount++;
	self.PrecacheModel("models/hichatu/player/gnomechild.mdl");
	activator.SetModel("models/hichatu/player/gnomechild.mdl");
}

ordassign_z_vs_h <- true;	//set to 'true' in order to divide RED/BLUE as ZOMBIES/HUMANS, else it splits players 50/50
ordassign_maker <- null;
ordiassign_cd <- false;
ordassign_rate <- 0.08;		//0.06 MIN
ordassign_team <- true;
ordassign_tp_red <- [Vector(-13232,6208,2612),Vector(-13232,5952,2612),Vector(-13232,5696,2612)];
ordassign_tp_blue <- [Vector(-14544,6208,2612),Vector(-14544,5952,2612),Vector(-14544,5696,2612)];
function OrdiAssignHammer()
{
	if(activator==null||!activator.IsValid()||activator.GetHealth()<=0.00)return;
	if(ordiassign_cd)return;
	ordiassign_cd = true;
	EntFireByHandle(self,"RunScriptCode"," ordiassign_cd = false; ",0.02,null,null);
	EntFire("ord_assignhammer_trig","Disable","",0.00,null);
	EntFire("ord_assignhammer_trig","Enable","",ordassign_rate,null);
	local spos = activator.GetOrigin()+Vector(0,0,500);
	if(ordassign_maker==null||!ordassign_maker.IsValid())ordassign_maker=Entities.FindByName(null,"ord_maker_gravhammer");
	if(ordassign_maker==null||!ordassign_maker.IsValid())return;
	ordassign_team = !ordassign_team;
	if(ordassign_z_vs_h)
	{
		if(activator.GetTeam()==3)ordassign_team=true;
		else if(activator.GetTeam()==2)ordassign_team=false;
	}
	ordassign_maker.SpawnEntityAtLocation(spos,Vector());
	activator.SetVelocity(Vector());
	local tp_pos = (activator.GetOrigin()+Vector(0,0,200));
	local tp_yaw = 0;
	if(ordassign_team)
	{
		EntFireByHandle(activator,"AddContext","ord_team_blue:1",0.00,null,null);
		EntFireByHandle(activator,"AddOutput","rendercolor 0 150 255",0.00,null,null);
		EntFireByHandle(activator,"RunScriptCode"," ord_team_bluered <- true; ",0.00,null,null);
		tp_pos = ordassign_tp_blue[RandomInt(0,ordassign_tp_blue.len()-1)];
	}
	else
	{
		EntFireByHandle(activator,"AddContext","ord_team_red:1",0.00,null,null);
		EntFireByHandle(activator,"AddOutput","rendercolor 255 50 50",0.00,null,null);
		EntFireByHandle(activator,"RunScriptCode"," ord_team_bluered <- false; ",0.00,null,null);
		tp_pos = ordassign_tp_red[RandomInt(0,ordassign_tp_red.len()-1)];
		tp_yaw = 180;
	}
	EntFireByHandle(activator,"RunScriptCode"," self.SetOrigin(self.GetOrigin()+Vector(0,0,500)); ",0.01,null,null);
	EntFireByHandle(activator,"RunScriptCode"," self.SetOrigin(Vector("+tp_pos.x.tostring()+
	","+tp_pos.y.tostring()+","+tp_pos.z.tostring()+")); ",0.06,null,null);
	EntFireByHandle(activator,"RunScriptCode"," self.SetAngles(0,"+tp_yaw+",0); ",0.06,null,null);
	EntFireByHandle(activator,"RunScriptCode"," self.SetVelocity(Vector()); ",0.02,null,null);
}
function EndOrdGiveHumansShit()
{
	local ii_equip = 0.05;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		if(h==null||!h.IsValid())continue;
		if(h.GetTeam()==3&&h.GetHealth()>0.00)
		{
			EntFireByHandle(self,"RunScriptCode"," EndWeaponEquipOrdi(); ",ii_equip,h,null);
			ii_equip += 0.05;
		}
		
	}
}
function EndWeaponEquipOrdi()
{
	//TODO - some servers uses AmmoFix.smx which seems to fuck up "Use" on game_player_equip, will it happen here? what to do?
	if(activator==null||!activator.IsValid())return;
	if(activator.GetTeam()!=3||activator.GetHealth()<=0.00)return;
	EntFire("stage_ord_equip_humans","Use","",0.00,activator);
}
function OrdiLockEntry()	//called from 'ord_round_time_case' > OnCase04	(30s into the match in _v1, prevents switching teams before match-end)
{
	EntFire("ord_locktp","Enable","",0.10,null);
	EntFire("Console","Command","say 观众区已启用",0.00,null);
	EntFire("Console","Command","say 观众区已启用",0.01,null);
	EntFire("Console","Command","say 观众区已启用",0.02,null);
	EntFire("Console","Command","say 从现在开始你不能重新进入竞技场",0.50,null);
	EntFire("Console","Command","say 从现在开始你不能重新进入竞技场",0.51,null);
	EntFire("Console","Command","say 从现在开始你不能重新进入竞技场",0.52,null);
	local h=null;while(null!=(h=Entities.FindByName(h,"td_ordaction_sack_T"))){h.SetOrigin(h.GetOrigin()+Vector(0,0,-650));}
	local h=null;while(null!=(h=Entities.FindByName(h,"td_ordaction_sack_CT"))){h.SetOrigin(h.GetOrigin()+Vector(0,0,-650));}
}
function OrdiClearVars()
{
	if(activator==null||!activator.IsValid())return;
	activator.ValidateScriptScope();
	if(!("ord_team_bluered" in activator.GetScriptScope()))return;
	delete activator.GetScriptScope().ord_team_bluered;
}
function OrdiFinalScore(state)	//0=draw, 1=ctwin, 2=twin		/		playerhandle.GetScriptScope().ord_team_bluered;	(bool: true:blue,false:red)
{
	if(state==1)		//blue - human win
	{
		EntFire("ord_round_time_case","FireUser4","",30.00,null);
		EntFire("ord_playerblock","Break","",0.00,null);
		EntFire("ord_hurt_ballfucker*","Enable","",1.20,null);
		EntFire("ord_ball*","AddOutput","rendercolor 255 255 0",0.00,null);
		EntFire("Console","Command","say 蓝方获胜 - 他们可以保留他们的锤子",0.00,null);
		EntFire("Console","Command","say 蓝方获胜 - 他们可以保留他们的锤子",0.01,null);
		EntFire("Console","Command","say 蓝方获胜 - 他们可以保留他们的锤子",0.02,null);
		EntFire("Console","Command","say 他们还可以用球猎杀红方剩余30秒",0.50,null);
		EntFire("Console","Command","say 他们还可以用球猎杀红方剩余30秒",0.51,null);
		EntFire("Console","Command","say 他们还可以用球猎杀红方剩余30秒",0.52,null);
		EntFire("Console","Command","say 球接触到红方就会造成红方死亡",1.00,null);
		EntFire("Console","Command","say 球接触到红方就会造成红方死亡",1.01,null);
		EntFire("Console","Command","say 球接触到红方就会造成红方死亡",1.02,null);
		CleanOrdHammer(2);
	}
	else if(state==2)		//red - zombie win
	{
		EntFire("ord_round_time_case","FireUser4","",30.00,null);
		EntFire("ord_playerblock","Break","",0.00,null);
		EntFire("ord_hurt_ballfucker*","Enable","",1.20,null);
		EntFire("ord_ball*","AddOutput","rendercolor 255 255 0",0.00,null);
		EntFire("Console","Command","say 红方获胜 - 他们可以保留他们的锤子",0.00,null);
		EntFire("Console","Command","say 红方获胜 - 他们可以保留他们的锤子",0.01,null);
		EntFire("Console","Command","say 红方获胜 - 他们可以保留他们的锤子",0.02,null);
		EntFire("Console","Command","say 他们还可以用球猎杀蓝方剩余30秒",0.50,null);
		EntFire("Console","Command","say 他们还可以用球猎杀蓝方剩余30秒",0.51,null);
		EntFire("Console","Command","say 他们还可以用球猎杀蓝方剩余30秒",0.52,null);
		EntFire("Console","Command","say 球接触到蓝方就会造成红方死亡",1.00,null);
		EntFire("Console","Command","say 球接触到蓝方就会造成红方死亡",1.01,null);
		EntFire("Console","Command","say 球接触到蓝方就会造成红方死亡",1.02,null);
		CleanOrdHammer(3);
	}
	else				//draw
	{
		EntFire("ord_round_time_case","FireUser4","",30.00,null);
		EntFire("ord_playerblock","Break","",0.00,null);
		EntFire("ord_hurt_ballfucker*","Enable","",1.20,null);
		EntFire("ord_ball*","AddOutput","rendercolor 255 255 0",0.00,null);
		EntFire("Console","Command","say 平局 - 双方都保留他们的锤子",0.00,null);
		EntFire("Console","Command","say 平局 - 双方都保留他们的锤子",0.01,null);
		EntFire("Console","Command","say 平局 - 双方都保留他们的锤子",0.02,null);
		EntFire("Console","Command","say 你们可以用球互相厮杀剩余30秒",0.30,null);
		EntFire("Console","Command","say 你们可以用球互相厮杀剩余30秒",0.31,null);
		EntFire("Console","Command","say 你们可以用球互相厮杀剩余30秒",0.32,null);
		EntFire("Console","Command","say 甚至可以杀死队友 - 祝你好运",0.60,null);
		EntFire("Console","Command","say 甚至可以杀死队友 - 祝你好运",0.61,null);
		EntFire("Console","Command","say 甚至可以杀死队友 - 祝你好运",0.62,null);
		EntFire("Console","Command","say 球接触到任何一方都可以造成死亡",1.00,null);
		EntFire("Console","Command","say 球接触到任何一方都可以造成死亡",1.01,null);
		EntFire("Console","Command","say 球接触到任何一方都可以造成死亡",1.02,null);
		EntFireByHandle(self,"RunScriptCode"," CleanOrdHammer(); ",29.90,null,null);
		CleanOrdHammer(1,true);
	}
}
function CleanOrdHammer(team=1,ballbustall=false)	//1:all, 2=t, 3=ct
{
	local h=null;while(null!=(h=Entities.FindByName(h,"ordgravhammer_button*")))
	{
		if(h==null||!h.IsValid())continue;
		try
		{
			local holder = h.GetMoveParent().GetMoveParent();
			if(holder==null||!holder.IsValid()||holder.GetHealth()<=0.00)EntFireByHandle(h,"FireUser1","",0.00,null,null);
			else
			{
				local holderteam = null;
				holder.ValidateScriptScope();
				if(("ord_team_bluered" in holder.GetScriptScope()))holderteam = holder.GetScriptScope().ord_team_bluered;
				if(team==1||holderteam==null){if(!ballbustall)EntFireByHandle(h,"FireUser1","",0.00,null,null);
				EntFireByHandle(holder,"AddContext","ordi_ball_buster:1",0.00,null,null);}
				else if(team==2 && !holderteam){EntFireByHandle(h,"FireUser1","",0.00,null,null);
				EntFireByHandle(holder,"AddContext","ordi_ball_buster:1",0.00,null,null);}
				else if(team==3 && holderteam){EntFireByHandle(h,"FireUser1","",0.00,null,null);
				EntFireByHandle(holder,"AddContext","ordi_ball_buster:1",0.00,null,null);}
			}
		}catch(eee){printl("[MAP ERROR - generalfixes.nut - CleanOrdHammer]"+eee);EntFireByHandle(h,"FireUser1","",0.00,null,null);}
	}
}

pompjelumberjackhp_base <- 2000;	//how much hp the lumberjack should have initially
pompjelumberjackhp_each <- 650;		//how much hp the lumberjack should get for each alive CT (counting the moment you reach it)
function PompjeLumberJackHP()
{
	local hpset = 0.00+pompjelumberjackhp_base;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		if(h==null||!h.IsValid()||h.GetTeam()!=3||h.GetHealth()<=0)continue;
		hpset += pompjelumberjackhp_each;
	}
	EntFire("lumberjack_breakable","SetHealth",hpset.tostring(),0.00,null);
}

//Spaicks deathrun-button-room, prioritize TP-ing mother zombies first, the rest gets to chase behind humans
spaick_butroom_min_z <- 3;			//the minimum amount of zombies to TP inside the deathrun-button-room
spaick_butroom_max_z <- 6;			//the maximum amount of zombies to TP inside the deathrun-button-room
function SpaickMotherZombieTP()
{
	local bzs = [];						//final array of confirmed zombies to TP into button room
	local tmz = [];						//temp array to fiddle
	foreach(mz in ::LUFF_MZ_LIST)		//mother zombie list (scanned every round)
	{
		if(mz==null||!mz.IsValid()||mz.GetHealth()<=0.00||mz.GetTeam()!=2)continue;
		tmz.push(mz);
	}
	if(tmz.len()>=spaick_butroom_max_z)
	{
		for(local i=0;i<spaick_butroom_max_z;i++)
		{
			if(tmz.len()>0)
			{
				local ridx = RandomInt(0,tmz.len()-1);
				bzs.push(tmz[ridx]);
				tmz.remove(ridx);
			}
		}
	}
	else if(tmz.len()<spaick_butroom_min_z)
	{
		local hh=[];local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
		{
			if(h==null||!h.IsValid()||h.GetHealth()<=0.00||h.GetTeam()!=2)continue;
			local exists = false;
			foreach(t in tmz){if(t==h){exists=true;break;}}
			if(exists)continue;
			hh.push(h);
		}
		for(local i=tmz.len();i<spaick_butroom_min_z;i++)
		{
			if(hh.len()>0)
			{
				local ridx = RandomInt(0,hh.len()-1);
				tmz.push(hh[ridx]);
				hh.remove(ridx);
			}
		}
		foreach(t in tmz){bzs.push(t);}
	}
	else{foreach(t in tmz){bzs.push(t);}}
	foreach(z in bzs)
	{
		if(z==null||!z.IsValid()||z.GetHealth()<=0.00||z.GetTeam()!=2)continue;
		z.SetOrigin(Vector(-55,14640,-6820));
		z.SetAngles(0,45,0);
		z.SetVelocity(Vector(RandomFloat(-150,150),RandomFloat(-150,150),0));
		EntFireByHandle(z,"SetDamageFilter","filter_spaick_nohurt",0.00,null,null);
	}
}

invisibility_ticking <- false;
invisibility_tickrate <- 0.50;
function StartInvisibility()
{
	self.PrecacheModel("models/player/chinny/chinny_invis_model.mdl");
	if(invisibility_ticking)return;
	invisibility_ticking = true;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		h.ValidateScriptScope();
		local sc = h.GetScriptScope();
		if(h.GetModelName()!="models/player/chinny/chinny_invis_model.mdl")
		{
			sc.invismodelreset <- h.GetModelName();
			h.SetModel("models/player/chinny/chinny_invis_model.mdl");
		}
	}
	TickInvisibility();
}
function TickInvisibility()
{
	if(!invisibility_ticking)return;
	EntFireByHandle(self,"RunScriptCode"," TickInvisibility(); ",invisibility_tickrate,null,null);
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		h.ValidateScriptScope();
		local sc = h.GetScriptScope();
		if(("invismodelreset" in sc))
		{if(sc.invismodelreset!=h.GetModelName()&&h.GetModelName()!="models/player/chinny/chinny_invis_model.mdl")
		{sc.invismodelreset=h.GetModelName();h.SetModel("models/player/chinny/chinny_invis_model.mdl");}}
		else sc.invismodelreset<-h.GetModelName();
		if(h.GetModelName()!="models/player/chinny/chinny_invis_model.mdl")
		{
			sc.invismodelreset <- h.GetModelName();
			h.SetModel("models/player/chinny/chinny_invis_model.mdl");
		}
		EntFireByHandle(h,"AddOutput","rendermode 10",0.00,null,null);
	}
}
function EndInvisibility()
{
	if(!invisibility_ticking)return;
	invisibility_ticking = false;
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		h.ValidateScriptScope();
		local sc = h.GetScriptScope();
		if(h.GetModelName()=="models/player/chinny/chinny_invis_model.mdl")
		{
			if(!("invismodelreset" in sc))EntFireByHandle(h,"SetHealth","-1",0.00,null,null);
			else if(sc.invismodelreset=="models/player/chinny/chinny_invis_model.mdl")EntFireByHandle(h,"SetHealth","-1",0.00,null,null);
			else h.SetModel(sc.invismodelreset);
		}
		EntFireByHandle(h,"AddOutput","rendermode 0",0.00,null,null);
		EntFireByHandle(h,"AddOutput","rendermode 0",0.10,null,null);
	}
}

function CleanEntities()
{
	local h = Entities.First();
	while(null!=(h=Entities.Next(h)))
	{
		local cn = h.GetClassname();
		local isweapon = false;
		if(cn.len()>6&&cn.slice(0,7)=="weapon_")isweapon = true;
		if(h!=null&&h.IsValid()&&h!=self&&!isweapon
		&&cn!="func_brush"
		&&cn!="info_target"
		&&cn!="player"
		&&cn!="logic_auto"
		&&cn!="worldspawn"
		&&cn!="cs_team_manager"
		&&cn!="cs_player_manager"
		&&cn!="game_round_end"
		&&cn!="func_illusionary"
		&&cn!="env_fog_controller"
		&&cn!="env_tonemap_controller"
		&&cn!="sky_camera"
		&&cn!="func_buyzone"
		&&cn!="info_player_terrorist"
		&&cn!="info_player_counterterrorist"
		&&cn!="func_areaportalwindow"
		&&cn!="info_teleport_destination"
		&&cn!="player_speedmod"
		&&cn!="func_areaportal"
		&&cn!="info_player_start"
		&&cn!="game_player_equip"
		&&cn!="logic_measure_movement"
		&&cn!="point_servercommand"
		&&cn!="point_clientcommand"
		&&cn!="env_cubemap"
		&&cn!="soundent"
		&&cn!="cs_gamerules"
		&&cn!="vote_controller"
		&&cn!="water_lod_control"
		&&cn!="point_template"
		&&cn!="filter_activator_team"
		&&cn!="filter_activator_name"
		&&cn!="filter_activator_class"
		&&cn!="filter_multi"
		&&cn!="skybox_swapper"
		&&cn!="func_clip_vphysics"
		&&cn!="ai_network"
		&&cn!="env_cascade_light"
		&&cn!="predicted_viewmodel"
		&&cn!="scene_manager"
		&&cn!="wearable_item"
		&&cn!="weaponworldmodel"
		&&cn!="game_weapon_manager"
		&&cn!="path_track")
			EntFireByHandle(h,"Kill","",0.00,null,null);
	}
}



