function PlayerConnect(){
	local p=this.event_data;
	logText("connect 触发");
	logTableText(p);
	EntFire("why_map_data","RunScriptCode",format("Connected(%d,\"%s\",\"%s\")",p.userid,p.networkid.tostring(),p.name),0.00,null);
}
function PlayerDisconnect(){
	local p=this.event_data;
	logText("disconnect 触发");
	logTableText(p);
	EntFire("why_map_data","RunScriptCode",format("Disconnected(%d,\"%s\")",p.userid,p.networkid.tostring()),0.00,null);
}
function PlayerUse(){
	local p=this.event_data;
	logText("use 触发");
	logTableText(p);
	EntFire("why_map_data","RunScriptCode",format("PlayerUse(%d,%d)",p.userid,p.entity),0.00,null);
}
function RoundStart(){
	local p=this.event_data;
	logText("RoundStart 触发");
	logTableText(p);
	EntFire("why_map_data","RunScriptCode","RoundStart();",0.00,null);
}
function ItemPickup(){
	local p=this.event_data;
	logText("拾取 触发");
	logTableText(p);
	// 延迟是防止设置targetname的存在延迟情况
	EntFire("why_map_data","RunScriptCode",format("ItemPickup(%d,\"%s\");",p.userid,p.item),1.00,null);
}
