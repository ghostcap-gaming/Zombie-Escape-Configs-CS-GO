pick_tick<-true;
pick_delay<-0.5;
pick_end_time<-null;
// 脚本检测时间，如果有神器刷新晚于60秒，请延长
pick_run_time<-60.0;
function PickTick(){
	if(Time()>=pick_end_time){
		pick_tick=false;
	}
	if(pick_tick){
		EntFireByHandle(self, "runscriptcode", "PickTick()", pick_delay, null, null);
		local weapon = null;
		while ((weapon = Entities.FindByClassname(weapon, "weapon_elite")) != null){
			if(!(weapon.IsValid()&&weapon.GetOwner()==null&&weapon.GetName()!=null&&weapon.GetName()!=""))continue;
			if(weapon.ValidateScriptScope()&&("detect" in weapon.GetScriptScope()))continue;
			EntFireByHandle(weapon, "runscriptfile", "why/pick_detect.nut", 0, null, null);
		}
	}
}

function EpickInit(){
	pick_end_time=Time()+pick_run_time;
	PickTick();
	ScriptPrintMessageChatAll(" \x03已加载反EPick 20210619\x01");
	ScriptPrintMessageChatAll(" \x03实验版本，有EPICK惩罚，如果出现任何问题请联系OP\x01");
}

self.ConnectOutput("OnSpawn", "EpickInit");

//repush
