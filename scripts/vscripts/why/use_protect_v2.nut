// 0、本脚本用于处理按E卡模型的问题,必须配合神器隐藏一起使用!!!!!!!
// 1、不适用于单神器多button的情况，会导致一个按钮无法触发！不过可以手动处理成单按钮，就不会有问题
// 2、同理当单个玩家拾取多个神器的情况（皮肤+神器），且都为按钮使用的情况，也会导致一个无法使用，同理去掉一个即可
// 3、只是单纯需要神器保护请使用use_protect.nut，没什么限制；且如果是上述1和2的情况，也可以对两个按钮中的一个按钮绑定这个脚本，即可覆盖功能
// 4、绑定按钮绑定该脚本后，建议去除原本的SetNewOwner()绑定，不去也没什么大问题
//modify:
//{
//	match:
//	{
//		"classname" "func_button"
//	}
//	insert:
//	{
//		"vscripts" "why/use_protect_v2.nut"
//	}
//}
if(self.GetRootMoveParent()==null)return;
if(self.GetRootMoveParent().GetClassname().find("weapon_")!=0)return;
local ent=Entities.FindByName(null, "load_script");
if(ent==null)return;
if(!("HIDE_SWITCH" in ent.GetScriptScope()))return;
ent.GetScriptScope().WEAPON.push(self.GetRootMoveParent());
ent.GetScriptScope().BUTTON_LIST.push(self);
ent.GetScriptScope().OLD_OWNER.push("");
ent.GetScriptScope().HIGH_LIGHT.push("");
function InputUse(){
	EntFire("load_script", "runscriptcode", "PlayerUseItem()", 0.0, activator);
	return false;
}
EntFireByHandle(self.GetRootMoveParent(), "addoutput", "OnPlayerPickup load_script:Runscriptcode:SetNewOwner();:0:-1", 0.0, null, null);
