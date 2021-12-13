detect<-true;
function Detect()
{
	if(!detect)return;
	EntFireByHandle(self, "runscriptcode", "Detect()", 0.01, null, null);
	local player=null;
	while ((player = Entities.FindInSphere(player, self.GetOrigin(),57)) != null){
		if(player.GetClassname()!="player")continue;
		if(player.GetTeam()==3){
			self.__KeyValueFromInt("CanBePickedUp",1);
			detect=false;
			return;
		}
	}
}
function EPick(){
	if(!detect)return;
	if(activator.GetTeam() != 3)return;
	local ent=Entities.FindByClassname(null, "player_speedmod");
	if(ent==null){
		ent=Entities.CreateByClassname("player_speedmod");
	}
	EntFireByHandle(ent, "ModifySpeed", "0.75", 0, activator, caller);
	EntFireByHandle(ent, "ModifySpeed", "1", 5, activator, caller);
	EntFireByHandle(activator, "IgniteLifetime", "10", 0, activator, caller);
	activator.__KeyValueFromString("rendercolor", "255 0 0");
	ScriptPrintMessageChatAll(" \x02按e仔被点燃了，笑他\x01");
}

self.ConnectOutput("OnPlayerUse","EPick");
self.__KeyValueFromInt("CanBePickedUp",0);
Detect();
