::S1sjhp <- 800;
::S1sjhpmax <- 800;
::S1sjhpt <- 1;
::Godthunder <- null;
::Heals <- null;
::S2szzbqiao <- 1;
BossHpBar <- 10;
BossN <- "Crystal";
ticking <- false;
TickRate <- 0.05;
HPHUD <- "◼◼◼◼◼◼◼◼◼◼";
BossHealth <- 80.00;
ChangeHealth <- 80.00;
HudHealth <- 800.00;
function tp(){
	local pl = null;
	while((pl = Entities.FindByClassname(pl,"player"))!=null){
		
	}
}

function zbqsd(value){
	S2szzbqiao = value;
}

function zbqpd(){
	if(S2szzbqiao==2){EntFire("s2_sz_shilong","Toggle","",0);S2szzbqiao=1;}
}

function zbqpd2(){
	if(S2szzbqiao==1){EntFire("s2_sz_shilong","Toggle","",0);S2szzbqiao=2;}
}

function s2_sz_hp(){
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			EntFire("s2_sz_boss_hp","Add","600",0);
		}
	}
}

function S1bosshp(){
	local ent1 = null;
	while((ent1 = Entities.FindByClassname(ent1,"player"))!=null){
		if(ent1.GetTeam()==3){
			EntFire("Stage1_boss1_hp_default","Add","50",0);
		}
	}
}

function ss_dd(){
	local emt1 = Entities.FindByName(null,"ss_dd_maker");
	local ent2 = null;
	while((ent2 = Entities.FindByClassname(ent2,"player"))!=null){
		if(ent2.GetTeam()==3){
			emt1.SpawnEntityAtLocation(ent2.GetOrigin(),ent2.GetAngles());
			break;
		}
	}
}

function s1_szhp(){
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			EntFire("s1_sz_hp_counter","Add","35",0);
		}
	}
}

function Humanlose(){
	local emt = Entities.FindByName(null,"human_lose_maker");
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			emt.SpawnEntityAtLocation(ent.GetOrigin(),ent.GetAngles());	
		}
	}
}

function Grenaded(){
	self.SetOrigin(activator.GetOrigin());
}

function Godthunderp(){
	Godthunder = activator;
}


function Healsq(){
	Heals = activator;
}

function S1exboss1hp(){
	local ent = null;
	local hp = 0;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			S1sjhp += 400;
			S1sjhpmax += 400;
			BossHealth += 40;
			ChangeHealth += 40;
			HudHealth += 40 * BossHpBar;
		}
	}
}

function S1exboss1(){
	if(S1sjhp>0){
		S1sjhp -= 1;
		BossHealth--;
		HudHealth--;
		if(HudHealth <= 0)
		{
			HudHealth=0;
		}
		if(S1sjhp<=S1sjhpmax/2&&S1sjhpt==1){
			EntFire("Cmd","Command","say ***It used ice fog, Please use god thunder to dispel(or use heal to resistance)***");
			EntFire("Stage1_exboss1_hpbreak_tx","Start","",0);
			EntFire("Stage1_exboss1_hpbreak_hurt","Enable","",0);
			EntFire("Noob_tooeasy","RunScriptCode","S1exboss3()",10);
			S1sjhpt = 0;
		}
	}else{
		EntFire("Stage1_ex_sj1","Break","",0);
	}
}

function S1exboss2(){
	local emm = Entities.FindByName(null,"Stage1_exboss1_hpbreak_maker");
	if(activator!=Godthunder&&activator!=Heals){
		emm.SpawnEntityAtEntityOrigin(activator);
	}
}

function S1exboss3(){
	EntFire("Stage1_exboss1_hpbreak_tx","Stop","",0);
	EntFire("Stage1_exboss1_hpbreak_hurt","Disable","",0)
	EntFire("Stage1_exboss1_hpbreak","Break","",0);
}

function Banishment1(){
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			local e = null;
			while((e = Entities.FindByName(e,"Stage1_exboss1_beam1"))!=null){
				e.SetOrigin(ent.GetOrigin());
				break;	
			}
			local f = null;
			while((f = Entities.FindByName(f,"Stage1_exboss1_Banishment"))!=null){
				f.SetOrigin(ent.EyePosition());
			}
			EntFire("Stage1_exboss1_beam1","TurnOn","",0);
			EntFire("Stage1_exboss1_beam1","TurnOff","",2);
			EntFire("Stage1_exboss1_Banishment","FireUser1","",0);
			return;
		}
	}
}

function Banishment(){
	local pos = activator.GetOrigin();
	activator.SetOrigin(Vector(14969.5,-13364.5,16086));
	EntFireByHandle(activator,"AddOutPut","origin "+pos.x+" "+pos.y+" "+pos.z,7,null,null);
}

function S1exboss1zq(){
	local em = Entities.FindByName(null,"tx111_maker");
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			em.SpawnEntityAtLocation(ent.GetOrigin(),ent.GetAngles());
		}
	}
}

function Itemuse(){
	local weapon = self.GetMoveParent();
	if(weapon == null||weapon.GetOwner()!=activator){
		return;
	}
	EntFireByHandle(self,"FireUser1","",0,self,self);
}

function Zm_itemuse(){
	local weapon = self.GetMoveParent();
	local name = activator.GetName();
	if(weapon == null||weapon.GetOwner()!=activator||name!="item_zm"){
		return;
	}
	EntFireByHandle(self,"FireUser1","",0,self,self);
}

function Zm_heal(){
	local name = activator.GetName();
	if(name=="item_zm"||name=="sishen"){
		return;
	}
	activator.SetMaxHealth(20000);
}

function Human_heal(){
	local name = activator.GetName();
	if(name=="wk"||name=="sbex"){
		activator.SetMaxHealth(400);
	}else{
		activator.SetMaxHealth(250);
	}
}

function Bossheal(){
	EntFire("Stage1_boss2_heal_hp","Enable","",0);
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			EntFire("Stage1_boss2_heal_hp","Add","30",0);
		}
	}
}

function BossPush(){
	local a = RandomInt(1,4);
	if(a==1){
		EntFire("Stage1_ex_boss_push_q","Enable","",0);
		EntFire("Stage1_ex_boss_push_q","Disable","",9);
		EntFire("Stage1_boss2_pushtx_q","Start","",0);
		EntFire("Stage1_boss2_pushtx_q","Stop","",9);
	}else if(a==2){
		EntFire("Stage1_ex_boss_push_h","Enable","",0);
		EntFire("Stage1_ex_boss_push_h","Disable","",9);
		EntFire("Stage1_boss2_pushtx_h","Start","",0);
		EntFire("Stage1_boss2_pushtx_h","Stop","",9);
	}else if(a==3){
		EntFire("Stage1_ex_boss_push_l","Enable","",0);
		EntFire("Stage1_ex_boss_push_l","Disable","",9);
		EntFire("Stage1_boss2_pushtx_l","Start","",0);
		EntFire("Stage1_boss2_pushtx_l","Stop","",9);
	}else if(a==4){
		EntFire("Stage1_ex_boss_push_r","Enable","",0);
		EntFire("Stage1_ex_boss_push_r","Disable","",9);
		EntFire("Stage1_boss2_pushtx_r","Start","",0);
		EntFire("Stage1_boss2_pushtx_r","Stop","",9);
	}
}

function BossShieldDamage(){
	EntFireByHandle(activator, "SetHealth", format("%d", activator.GetHealth() - 5), 0, activator, activator);
}

function Bossmovewall(){
	local a = RandomInt(1,2);
	if(a==1){
		EntFire("Stage1_boss2_movewall1_template","ForceSpawn","",0);
		EntFire("Stage1_boss2_movewall1","Open","",0.03);
	}else{
		EntFire("Stage1_boss2_movewall2_template","ForceSpawn","",0);
		EntFire("Stage1_boss2_movewall2","Open","",0.03);
	}
}

function Bosslaser(){
	local a = RandomInt(1,2);
	if(a==1){
		EntFire("Stage1_boss2_laser1g_template","ForceSpawn","",0);
		EntFire("Stage1_boss2_laser1g","Open","",1);
		EntFire("Stage1_boss2_laser1_template","ForceSpawn","",1);
		EntFire("Stage1_boss2_laser1","Open","",2);
	}else{
		EntFire("Stage1_boss2_laser1_template","ForceSpawn","",0);
		EntFire("Stage1_boss2_laser1","Open","",1);
		EntFire("Stage1_boss2_laser1g_template","ForceSpawn","",1);
		EntFire("Stage1_boss2_laser1g","Open","",2);
	}
	EntFire("Laser_sound","PlaySound","",1);
	EntFire("Laser_sound","PlaySound","",2);
	local b = RandomInt(1,2);
	if(b==1){
		EntFire("Stage1_boss2_laser2g_template","ForceSpawn","",3);
		EntFire("Stage1_boss2_laser2g","Open","",4);
		EntFire("Stage1_boss2_laser2_template","ForceSpawn","",4);
		EntFire("Stage1_boss2_laser2","Open","",5);
	}else{
		EntFire("Stage1_boss2_laser2_template","ForceSpawn","",3);
		EntFire("Stage1_boss2_laser2","Open","",4);
		EntFire("Stage1_boss2_laser2g_template","ForceSpawn","",4);
		EntFire("Stage1_boss2_laser2g","Open","",5);
	}
	EntFire("Laser_sound","PlaySound","",4);
	EntFire("Laser_sound","PlaySound","",5);
	local c = RandomInt(1,2);
	if(c==1){
		EntFire("Stage1_boss2_laser3g_template","ForceSpawn","",6);
		EntFire("Stage1_boss2_laser3g","Open","",7);
		EntFire("Stage1_boss2_laser3_template","ForceSpawn","",7);
		EntFire("Stage1_boss2_laser3","Open","",8);
	}else{
		EntFire("Stage1_boss2_laser3_template","ForceSpawn","",6);
		EntFire("Stage1_boss2_laser3","Open","",7);
		EntFire("Stage1_boss2_laser3g_template","ForceSpawn","",7);
		EntFire("Stage1_boss2_laser3g","Open","",8);
	}
	EntFire("Laser_sound","PlaySound","",7);
	EntFire("Laser_sound","PlaySound","",8);
	local d = RandomInt(1,2);
	if(d==1){
		EntFire("Stage1_boss2_laser4g_template","ForceSpawn","",9);
		EntFire("Stage1_boss2_laser4g","Open","",10);
		EntFire("Stage1_boss2_laser4_template","ForceSpawn","",10);
		EntFire("Stage1_boss2_laser4","Open","",11);
	}else{
		EntFire("Stage1_boss2_laser4_template","ForceSpawn","",9);
		EntFire("Stage1_boss2_laser4","Open","",10);
		EntFire("Stage1_boss2_laser4g_template","ForceSpawn","",10);
		EntFire("Stage1_boss2_laser4g","Open","",11);
	}
	EntFire("Laser_sound","PlaySound","",10);
	EntFire("Laser_sound","PlaySound","",11);
}

function BossRageheal(){
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			EntFire("Stage1_boss2_rage_hp","Add","225",0);
		}
	}
}

function BossInitialization(){
	local a = RandomInt(1,2);
	if(a==1){
		EntFire("Stage1_boss2_rage_compare","SetCompareValue","4",0);
	}else{
		EntFire("Stage1_boss2_rage_compare","SetCompareValue","3",0);
	}
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			EntFire("Stage1_boss2_hp_default","Add","100",0);
		}
	}
}

function BossRagehurtj(){
	local em = Entities.FindByName(null,"Stage1_boss2_rage_maker");
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			local pos = ent.GetOrigin();
			em.SpawnEntityAtLocation(Vector(pos.x,pos.y,257),ent.GetAngles());
		}
	}
}

function Trial(){
	local ent = null;
	while((ent = Entities.FindByClassname(ent,"player"))!=null){
		if(ent.GetTeam()==3){
			local e = null;
			while((e = Entities.FindByName(e,"Stage1_boss2_rage_beam1"))!=null){
				e.SetOrigin(ent.GetOrigin());
				break;	
			}
			EntFire("Stage1_boss2_rage_beam1","TurnOn","",0);
			EntFire("Stage1_boss2_rage_beam1","TurnOff","",2);
			EntFire("Cmd","Command","say ***A lucky player was sent to the zombie zone***",0);
			ent.SetOrigin(Vector(-1372,-976,-299));
			return;
		}
	}
}

function HpBar()
{
	for(local i = BossHpBar; i >= 0; i--)
	{
	    if(BossHpBar == 10){HPHUD = "◼◼◼◼◼◼◼◼◼◻";}
	    if(BossHpBar == 9){HPHUD = "◼◼◼◼◼◼◼◼◻◻";}
	    if(BossHpBar == 8){HPHUD = "◼◼◼◼◼◼◼◻◻◻";}
	    if(BossHpBar == 7){HPHUD = "◼◼◼◼◼◼◻◻◻◻";}
	    if(BossHpBar == 6){HPHUD = "◼◼◼◼◼◻◻◻◻◻";}
	    if(BossHpBar == 5){HPHUD = "◼◼◼◼◻◻◻◻◻◻";}
	    if(BossHpBar == 4){HPHUD = "◼◼◼◻◻◻◻◻◻◻";}
	    if(BossHpBar == 3){HPHUD = "◼◼◻◻◻◻◻◻◻◻";}
	    if(BossHpBar == 2){HPHUD = "◼◻◻◻◻◻◻◻◻◻";}
		if(BossHpBar == 1){HPHUD = "◻◻◻◻◻◻◻◻◻◻";}
		return;
	}
}

function Tick()
{
	if(ticking)
	{
		EntFireByHandle(self, "RunScriptCode", "Tick()", TickRate, null, null);
		EntFireByHandle(self, "RunScriptCode", "ChangeHp()", 0.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "CheckHpHud()", 0.00, null, null);
	}
}

function ChangeHp()
{
	if(BossHealth <= 0){HpBar();BossHpBar--;BossHealth += ChangeHealth;}
	else if(BossHpBar<=0){ticking=false;}
}

function CheckHpHud(){ScriptPrintMessageCenterAll("["+BossN+": " + HudHealth + "]" + "\n" + HPHUD);}

function Start(){ticking = true;Tick();}