// 当trigger为后续setparent模式时使用，不要全面绑定(残余实体清理可能有问题)，给特定实体绑定即可，如果当前实体
//modify:
//{
//	match:
//	{
//		"classname" "trigger_hurt"
//		"targetname" "看情况要不要写，如果下面的情况不会有影响，也可以不写这里直接对所有hurt生效"
//	}
//	insert:
//	{
//		"vscripts" "why/hurt_fix_v2.nut"
//	}
//}
//注意事项：
//0、如果trigger_hurt有多个同名实体，且parent对象并非template生成或勾了don't do namefix，会导致hurt移动异常(脚本禁用该情况，并提示)
//1、如果hurt实体本身有脚本会覆盖本身的脚本，请手动找出并改成replace
//2、高速移动的hurt该方式会导致hurt会慢一些到达，预计差距为 速度/32（由于速度快到的也会更快，大致理解成晚0.03秒左右到达），door的延迟似乎会更大
//3、每个hurt会对应多两个实体，弹幕多的图可能会实体溢出
//4、其他需要修正重复触发的情况也可以绑定该脚本（即不想使用parent移动的情况）

script_data <- null;
target <- null;
move <- null;
needCheckKill <- false;
firstClear <- false;

function checkInRepeat(name){
	if(Entities.FindByName(null, "load_script")==null){
		script_data = Entities.CreateByClassname("logic_relay");
		script_data.__KeyValueFromString("targetname", "load_script");
	}
	script_data = Entities.FindByName(null, "load_script");
	printl(script_data);
	if(!script_data.ValidateScriptScope()){
		ScriptPrintMessageChatAll("脚本数据异常，不进行异常提示");
		return true;
	}
	if(!("NAME_REPEAT_LIST" in script_data.GetScriptScope())){
		script_data.GetScriptScope().NAME_REPEAT_LIST<-[];
	}
	foreach(k in script_data.GetScriptScope().NAME_REPEAT_LIST){
		printl(k);
		if(k==name){
			printl(true);
			return true;
		}
	}
	script_data.GetScriptScope().NAME_REPEAT_LIST.push(name);
	return false;
}

function CheckParent(){
	if(self.GetMoveParent()==null)return;

	local ent=null;
	while ((ent = Entities.FindByName(ent, self.GetMoveParent().GetName())) != null)
	{
		if(ent!=self.GetMoveParent()){
			if(!checkInRepeat(self.GetMoveParent().GetName())){
				ScriptPrintMessageChatAll(" \x04重名parent，停用叠伤修复：\x02"+self.GetMoveParent().GetName());
			}
			return;
		}
		if(ent==null){
			break;
		}
	}

	local hurtN=self.GetName();
	if(hurtN==""){
		hurtN=UniqueString("bugdmgfix_hurt");
		self.__KeyValueFromString("targetname", hurtN);
	}else if(hurtN == self.GetPreTemplateName() && self.GetMoveParent().GetName() != self.GetMoveParent().GetPreTemplateName()){
		hurtN=hurtN+"&&"+self.GetMoveParent().GetName();
		self.__KeyValueFromString("targetname", hurtN);
	}
	ent=null;
	while ((ent = Entities.FindByName(ent, hurtN)) != null)
	{
		if(ent!=self){
			if(!checkInRepeat(hurtN)){
				ScriptPrintMessageChatAll(" \x04重名hurt，停用叠伤修复：\x02"+hurtN);
			}
			return;
		}
		if(ent==null){
			break;
		}
	}
	local oldVec=self.GetAngles();

	if(target==null||!target.IsValid()){
		target = Entities.CreateByClassname("info_target");
		target.__KeyValueFromString("targetname", UniqueString("bugdmgfix_tar"));
	}
	local targetN=target.GetName();
	target.SetOrigin(self.GetOrigin());
	target.SetAngles(oldVec.x, oldVec.y, oldVec.z);
	EntFireByHandle(target, "SetParent", self.GetMoveParent().GetName(), 0, null, null);

	firstClear=true;
	EntFireByHandle(self, "ClearParent", "", 0, null, null);

	if(move==null||!move.IsValid()){
		move = Entities.CreateByClassname("logic_measure_movement");
		move.__KeyValueFromFloat("TargetScale", 1.0);
		move.__KeyValueFromInt("MeasureType", 0);
	}
	EntFireByHandle(move, "SetMeasureReference", targetN, 0, self, self);
	EntFireByHandle(move, "SetTarget", hurtN, 0, self, self);
	EntFireByHandle(move, "SetTargetReference", targetN, 0, self, self);
	EntFireByHandle(move, "SetMeasureTarget", targetN, 0, self, self);
	EntFireByHandle(move, "Enable", "", 0, self, self);
	if(needCheckKill){
		EntFireByHandle(move, "RunScriptFile", "why/base/checktokill.nut", 0.0, self, self);
		EntFireByHandle(move, "RunScriptCode", "SaveKillEnt(\""+targetN+"\",\""+hurtN+"\")", 0.1, self, self);
	}
}

function InputSetParent(){
	EntFireByHandle(self, "runscriptcode", "CheckParent()", 0.0, null, null);
	return true;
}

function InputClearParent(){
	if(firstClear){
		firstClear=false;
		return true;
	}
	if(move!=null&&move.IsValid()){
		EntFireByHandle(move, "Disable", "", 0, null, null);
	}
	if(target!=null&&target.IsValid()){
		EntFireByHandle(target, "ClearParent", "", 0.0, null, null);
	}
	return true;
}

function InputKill(){
	if(move!=null&&move.IsValid()){
		move.Destroy();
	}
	if(target!=null&&target.IsValid()){
		target.Destroy();
	}
	printl(self.GetName()+":kill");
	return true;
}

if(!("bugdmgfixv2print" in getroottable())){
	::bugdmgfixv2print<-true;
	ScriptPrintMessageChatAll(" \x04叠伤V2脚本已加载，如有问题请联系健忘症晚期。————2021-07-24");
}
