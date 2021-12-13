WEAPON<-[];
OLD_OWNER<-[];
HIGH_LIGHT<-[];
tick<-false;
delay<-1.00;
// 透明度 0-255
HIDE_ALPHA<-50;
// 半透明(rendermode 1)，改为10不渲染模型，不过有影子
HIDE_MODE<-1;
// 可以随时启用\禁用隐身
HIDE_SWITCH<-true;
// 常时刷新隐身，用于处理个别地图神器隐身被覆盖的问题
AUTO_HIDE<-true;
// 启用颜色变化
COLOR_CHANGE<-true;
COLOR_LIST<-{};
CUSTOM_COLOR<-{};
// 绑定OnPlayerPickup
function SetNewOwner(){
	if(COLOR_LIST.len()<1){Init()};
	local weapon=caller;
	local player=activator;
	if(player.GetScriptScope()==null){player.ValidateScriptScope()}
	if(weapon.GetScriptScope()==null){weapon.ValidateScriptScope()}
	weapon.GetScriptScope().pickupEvents<-true;
	local index=null;
	for(local i=0;i<WEAPON.len();i++){
		if(WEAPON[i]==weapon){
			index=i;
			break;
		}
	}
	if(null==index){
		index=WEAPON.len();
		WEAPON.push(weapon);
		OLD_OWNER.push(player);
		HIGH_LIGHT.push(CreateGlow(player,weapon,index));
	}else{
		if(""!=HIGH_LIGHT[index]){
			EntFire("hl_glow_"+index.tostring(),"kill","",0,null);	
			HIGH_LIGHT[index]="";
		}
		if(""!=OLD_OWNER[index]){
			hidePlayer(OLD_OWNER[index],false);
			OLD_OWNER[index]="";
		}
		OLD_OWNER[index]=player;
		//HIGH_LIGHT[index]=CreateGlow(player,weapon,index);
	}
	if(COLOR_CHANGE){
		SetColor(index);
	}
	player.GetScriptScope().hide<-false;
	weapon.GetScriptScope().pickupEvents<-false;
	if(!tick){
		tick=true;
		Tick();
	}
}

function Tick(){
	if(tick){
		EntFireByHandle(self, "runscriptcode", "Tick()", delay, null, null);
		for(local i=0;i<WEAPON.len();i++){
			local weapon=WEAPON[i];
			if(!weapon.IsValid()||null==weapon.GetOwner()||!weapon.GetOwner().IsValid()){
				if(""!=HIGH_LIGHT[i]){
					EntFire("hl_glow_"+i.tostring(),"kill","",0,null);
					HIGH_LIGHT[i]="";
				}
				if(""!=OLD_OWNER[i]){
					hidePlayer(OLD_OWNER[i],false);
					OLD_OWNER[i]="";
				}
			}else if(weapon.GetOwner()==OLD_OWNER[i]){
				if(3!=weapon.GetOwner().GetTeam()){
					if(""!=HIGH_LIGHT[i]){
						EntFire("hl_glow_"+i.tostring(),"kill","",0,null);
						HIGH_LIGHT[i]="";
					}
					continue;
				}
				if(HIGH_LIGHT[i]==""){
					HIGH_LIGHT[i]=CreateGlow(weapon.GetOwner(),weapon,i);
				}
				hidePlayer(OLD_OWNER[i],true,i);
			}else if(!weapon.GetScriptScope().pickupEvents){
				EntFireByHandle(self, "runscriptcode", "SetNewOwner()", 0, weapon.GetOwner(), weapon);
			}
		}
		if(BUTTON_LIST.len()>0){
			InitBlockUseFix();
		}
	}
}

function hidePlayer(player,hide,index=-1){
	if(!player.IsValid())return;
	if(player.GetTeam()!=3&&hide)return;
	local pscr=player.GetScriptScope();
	if(pscr==null)return;
	if(!("hide" in pscr))return;
	if(HIDE_SWITCH&&hide){
		if(!pscr.hide||AUTO_HIDE){
			pscr.hide=true;
			player.__KeyValueFromInt("rendermode",HIDE_MODE);
			player.__KeyValueFromInt("renderamt",HIDE_ALPHA);
			HIGH_LIGHT[index].__KeyValueFromInt("rendermode",1);
		}
		return;
	}
	if(pscr.hide){
		pscr.hide=false;
		player.__KeyValueFromInt("rendermode",0);
		if(hide){
			HIGH_LIGHT[index].__KeyValueFromInt("rendermode",10);
		}
	}
}

function CreateGlow(activator,object,index){
	if(activator.GetTeam()!=3){
		return "";
	}
	local weaponModel=object.GetModelName();
	if(weaponModel.find("models/weapons/v_")==0){
		weaponModel="models/weapons/w"+weaponModel.slice(16);
	}
	glow <- CreateProp("prop_dynamic_glow",activator.GetOrigin(),weaponModel,0);
	glow.__KeyValueFromInt("glowdist", 10000);
	glow.__KeyValueFromInt("solid", 0);
	glow.__KeyValueFromString("glowcolor", "0 255 255");
	glow.__KeyValueFromInt("glowstyle", 2);
	glow.__KeyValueFromInt("rendermode", 1);
	glow.__KeyValueFromInt("renderfx", 14);
	glow.__KeyValueFromInt("renderamt",50);
	glow.__KeyValueFromInt("disableshadows",1);
	glow.__KeyValueFromInt("disablereceiveshadows",1);
	glow.__KeyValueFromInt("disableshadowdepth",1);
	local name="hl_glow_"+index.tostring();
	glow.__KeyValueFromString("targetname", name);
	par <- Entities.CreateByClassname("info_particle_system");
	EntFireByHandle(par, "SetParent", name, 0, null, null);
	EntFireByHandle(glow, "SetParent", "!activator", 0, activator, object);
	//EntFireByHandle(glow, "SetParentAttachment", "pistol", 0.01, null, null);
	//EntFireByHandle(glow, "SetParentAttachment", "Knife", 0.01, null, null);
	EntFireByHandle(glow, "SetParentAttachment", "primary", 0.01, null, null);
	EntFireByHandle(glow, "SetParent", "!activator", 0.5, activator, object);
	EntFireByHandle(glow, "SetGlowEnabled", "", 0.01, null, null);
	return glow;
}

function SetColor(index,needWait=true){
	if(null==WEAPON[index].GetOwner())return;
	if(HIGH_LIGHT[index]=="")return;
	if(needWait){
		EntFireByHandle(self, "runscriptcode", "SetColor("+index.tostring()+",false)", 1, null, null);
		return;
	}
	if(CUSTOM_COLOR.len()>0){
		local btn=null;
		while(null != (btn = Entities.FindInSphere(btn,WEAPON[index].GetOwner().GetOrigin(),50)))
		{
		   if(btn.GetClassname() == "func_button" && btn.GetRootMoveParent() == WEAPON[index].GetOwner()){
			if(FindCfg(btn.GetName(),index))return;
			break;
		   }
		}	
	}
	FindCfg(WEAPON[index].GetOwner().GetName(),index);
}

function FindCfg(name,index){
	name=name.tolower();
	foreach(k,v in CUSTOM_COLOR){
		if(name.find(k)<0)continue;
		HIGH_LIGHT[index].__KeyValueFromString("glowcolor", v);
		return true;
	}
	foreach(k,v in COLOR_LIST){
		for(local i=1;i<v.len();i++){
			if(name.find(v[i])<0)continue;
			HIGH_LIGHT[index].__KeyValueFromString("glowcolor", v[0]);
			return true;
		}
	}
	return false;
}

// rendermode会带到下一局，如果没有开局还原的功能则执行此方法
function ClearPlayerHide(){
	player<-null;
	while((player = Entities.FindByClassname(player,"player")) != null){
		if (player.IsValid()){
			EntFireByHandle(player, "addoutput", "rendermode 0", 0, null, null);
		}
	}
	ScriptPrintMessageChatAll(" \x03重置半透明完成\x01");
}

function HideInit(){
	IncludeScript("why/color_cfg.nut", this);
	IncludeScript("why/map_cfg.nut", this);
	ScriptPrintMessageChatAll(" \x03已加载神器隐身 20210728\x01");
}

self.ConnectOutput("OnSpawn", "HideInit");

// 第二部分，卡模型优化
BUTTON_LIST<-[];
btn_msg_print<-true;
function PlayerUseItem(){
	local index=-1;
	for(local i=0;i<OLD_OWNER.len();i++){
		if(OLD_OWNER[i]==activator){
			index=i;break;
		}
	}
	if(index<0)return;
	if(BUTTON_LIST[index].GetRootMoveParent()==activator){
		EntFireByHandle(BUTTON_LIST[index], "press", "", 0.0, activator, null);
	}
}
setUseScriptTick<-0;
function InitBlockUseFix(){
	if(setUseScriptTick>0){
		setUseScriptTick--;
	}else{
		setUseScriptTick=60;
		local pl=null;
		while ((pl = Entities.FindByClassname(pl, "player")) != null)
		{
			if(pl.ValidateScriptScope()){
				if("InputUse" in pl.GetScriptScope())continue;
				pl.GetScriptScope().InputUse <- function(){
					EntFire("load_script", "runscriptcode", "PlayerUseItem()", 0.0, activator);
					return true;
				}
			}
		}
	}
	if(btn_msg_print){
		ScriptPrintMessageChatAll(" \x04附加功能已加载：神器按钮卡模型优化，附带升级版按E保护。 \x02实验性质功能，不完全保证能完全处理卡模型问题，如发现问题请及时反馈。 ");
		ScriptPrintMessageChatAll(" \x04另：该功能仅用于处理玩家卡模型和按钮，把神器塞到什么墙里按不到的情况概不负责 ——健忘症晚期");
		btn_msg_print=false;
	}
}
