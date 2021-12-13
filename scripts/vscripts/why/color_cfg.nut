// 通用颜色配置列表
COLOR_LIST<-{
	// 名字=[颜色（RGB），神器玩家名称]  
	// 名字随意，不重复即可，颜色为RGB 10进制，第一个数据必须是颜色；玩家名称只需要名字的一部分即可，如WIND_USER，写wind即可，不能大写，会失效；不需要末尾加“,”“;”一类，会报错
	YELLOW=["210 245 10","sleep","oil"]
	//D5912B
	BROWN=["213 145 43","earth","tierra"]
	//FF3300
	RED=["255 51 0","fire","fuego"]
	//3385FF
	BLUE=["51 133 255","rayo","elec","snow","thunder"]
	//0000FF
	DBLUE=["0 0 255","water","ice","hielo","aqua","freezer"]
	//6600FF
	PURPLE=["102 0 255","black","hole","gravity","gravedad"]
	//FFFFFF
	WHITE=["255 255 255","holy","heal","cura","recovery","cure","scathe"]
	//33FF00
	GREEN=["51 255 0","wind","bio","ult","viento","poison"]
};
ScriptPrintMessageChatAll(" \x03公用神器手枪高亮颜色已加载\x01");
