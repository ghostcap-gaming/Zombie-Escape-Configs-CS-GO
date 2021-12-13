// 根据地图自定义颜色
MAP_COLOR_CFG<-{
	// 地图名，只需名字一部分即可，区分大小写
	test={
		// 玩家拾取后的targetname=RGB颜色
		// 只需要名字的一部分即可，如WIND_USER，写wind即可，不能大写，会失效；不需要末尾加“,”“;”一类，会报错
		wind="255 51 0"
		fire="210 245 10"
	}
	ffxii_westersand={
		elec="210 245 10"
	}
};
local name=GetMapName();
foreach(k,v in MAP_COLOR_CFG){
	if(name.find(k)<0)continue;
	CUSTOM_COLOR<-v;
	ScriptPrintMessageChatAll(" \x03当前地图名： \x06"+name+" \x03，已找到地图颜色配置\x01");
	return;
}

ScriptPrintMessageChatAll(" \x03当前地图名： \x06"+name+" \x03，未找到地图颜色配置\x01");
//repush
