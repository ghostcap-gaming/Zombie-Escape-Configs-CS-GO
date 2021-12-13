function RestoreItemLevel(pl){
	try{
		if(pl.handle.GetName() != "player_s" && pl.handle.GetName() != "harrypotter")
		{
			EntFire("!activator", "RunScriptFile", "kinlkm/ze_harry_potter_v2_1_csgo/harry_player_fix.nut", 0.00, pl.handle);
			EntFire("!activator", "AddOutput", "targetname player_s", 0.01, pl.handle);
		}
	}catch(e){
		logText(e);
	}
}

function LevelInit(delay=true){
	if(delay){
		EntFireByHandle(self, "runscriptcode", "LevelInit(false)", 5.0, null, null);
		return;
	}
	ScriptPrintMessageChatAll(" \x04因哈波神器等级保存功能不稳定，增加相关数据检测功能\x01");
	local hasErr=false;
	local player=null;
	while( (player = Entities.FindByClassname(player,"player")) != null ) {
		if(!player.IsValid()||player.GetHealth()<0||(player.GetName()!="player_s"&&player.GetName()!="harrypotter")){
			continue;
		}
		local pl=GetPlayerByHandle(player);
		if(pl==null){
			player.__KeyValueFromString("rendercolor", "255 0 0");
			ScriptPrintMessageChatAll(" \x02红色玩家数据不存在\x01");
			continue;
		}
		if(player.GetScriptScope()==null){
			ScriptPrintMessageChatAll(" \x02名字："+pl.name+"；uid:"+pl.userid+"；玩家脚本未初始化\x01");
			continue;
		}
		local scr=player.GetScriptScope();
		if(!("ITEMLEVEL" in scr)||!("AddLevel" in scr)){
			ScriptPrintMessageChatAll(" \x02名字："+pl.name+"、uid:"+pl.userid+"；玩家脚本初始化异常\x01");
			continue;
		}
		if(scr.ITEMLEVEL!=0&&pl.itemInfo!=scr.ITEMLEVEL){
			ScriptPrintMessageChatAll(" \x02名字："+pl.name+"、uid:"+pl.userid+"；玩家等级数据异常，当前等级："+scr.ITEMLEVEL+"、脚本保存等级："+pl.itemInfo+"\x01");
			continue;
		}
	}
}
