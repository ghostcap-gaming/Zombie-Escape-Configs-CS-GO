function LevelInit(){
	EntFire("Filter_Upgrade_*", "RunScriptFile", "why/savelevel/on_pass.nut", 0, null);
}
function LevelUp(){
	local act=activator;
	local level=caller.GetName().slice(15).tointeger();
	if(level<5)level++;
	GetPlayerByHandle(act).itemInfo=level;
}
function RestoreItemLevel(pl){
    try{
        if(pl.itemInfo!=null&&pl.itemInfo!=""){
            EntFireByHandle(pl.handle, "ClearContext", "", 0, null, null);
            EntFireByHandle(pl.handle, "AddContext", format("Level_%d:1",pl.itemInfo), 0.2, null, null);
        }
    }catch(e){
        logText(e);
    }
}
