handles <- null;
ItemText <- "";
ITEMLEVEL <- 0;
BroomStick <- null;

function TestFun(){
    ScriptPrintMessageChatAll("harry_player_fix.nut-2021.7.23 23:06");
}

if((lvl_data<-Entities.FindByName(null, "why_map_data"))!=null){
    local pl_d=lvl_data.GetScriptScope().GetPlayerByHandle(self);
    if(pl_d!=null&&pl_d.itemInfo!=""){
        ITEMLEVEL=pl_d.itemInfo;
    }
}

function AddLevel()
{
    if(ITEMLEVEL <= 4)
    {
        ITEMLEVEL++;
    }
    if(ITEMLEVEL > 4)
    {
        ITEMLEVEL = 4;
    }
    if((lvl_data<-Entities.FindByName(null, "why_map_data"))!=null){
        lvl_data.GetScriptScope().GetPlayerByHandle(self).itemInfo=ITEMLEVEL;
    }
}

function CreatHand()
{
    handles = self;
    EntFire("map_client", "Command", "r_screenoverlay deviousskullz/overlayfixxer", 0.01, handles);
    EntFire("!self","FireUser2","",0.02,handles);
    if(ITEMLEVEL == 0){EntFire("item_level_0", "Display", "", 1.00, handles);}
    else if(ITEMLEVEL == 1){EntFire("item_level_1", "Display", "", 1.00, handles);}
    else if(ITEMLEVEL == 2){EntFire("item_level_2", "Display", "", 1.00, handles);}
    else if(ITEMLEVEL == 3){EntFire("item_level_3", "Display", "", 1.00, handles);}
    else if(ITEMLEVEL == 4){EntFire("item_level_4", "Display", "", 1.00, handles);}
}

function BonusSelf()
{
    if(ITEMLEVEL == 0)
    {
        EntFire("item_speedmod", "ModifySpeed", "1.00", 0.00, handles);
    }
    else if(ITEMLEVEL == 1)
    {
        EntFire("item_speedmod", "ModifySpeed", "1.05", 0.00, handles);
    }
    else if(ITEMLEVEL == 2)
    {
        EntFire("item_speedmod", "ModifySpeed", "1.10", 0.00, handles);
    }
    else if(ITEMLEVEL == 3)
    {
        EntFire("item_speedmod", "ModifySpeed", "1.15", 0.00, handles);
    }
    else if(ITEMLEVEL == 4)
    {
        EntFire("item_speedmod", "ModifySpeed", "1.20", 0.00, handles);
    }
}

function UpDateHandle()
{
    handles = self;
}

function GetItemLevelProtego()
{
    EntFire("s_item_c", "RunScriptCode", "PROTEGOLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelRepairo()
{
    EntFire("s_item_c", "RunScriptCode", "REPAIROLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelAvada()
{
    EntFire("s_item_c", "RunScriptCode", "AVADALEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelFlipendo()
{
    EntFire("s_item_c", "RunScriptCode", "FLIPENDOLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelImpedimenta()
{
    EntFire("s_item_c", "RunScriptCode", "IMPEDIMENTALEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelIncendio()
{
    EntFire("s_item_c", "RunScriptCode", "INCENDIOLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelAccio()
{
    EntFire("s_item_c", "RunScriptCode", "ACCIOLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelCrucio()
{
    EntFire("s_item_c", "RunScriptCode", "CRUCIOLEVEL="+ITEMLEVEL, 0.00, null);
}

function GetItemLevelAguamenti()
{
    EntFire("s_item_c", "RunScriptCode", "AGUAMENTILEVEL="+ITEMLEVEL, 0.00, null);
}

function ShowSelfItemText()
{
    EntFire("personal_text", "SetText", ItemText, 0.00, activator);
    EntFire("personal_text", "Display", "", 0.01, activator);
    EntFire("!self","RunScriptCode","ClearText();",5.00,activator);
}

function ClearText()
{
    ItemText = "";
}

function PersonalItemText(i, level)
{
    //0 PROTEGO
    if(i == 0 && level == 0)
    {
        ItemText = "护身屏障\n按E键使用\n无限使用次数\n幼儿园学生\n生成土墙阻挡僵尸\n60 秒冷却时间\n4 秒持续时间";
    }
    else if(i == 0 && level == 1)
    {
        ItemText = "护身屏障\n按E键使用\n无限使用次数\n一年级\n生成土墙阻挡僵尸\n60 秒冷却时间\n5 秒持续时间";
    }
    else if(i == 0 && level == 2)
    { 
        ItemText = "护身屏障\n按E键使用\n无限使用次数\n二年级\n生成土墙阻挡僵尸\n55 秒冷却时间\n5 秒持续时间";
    }
    else if(i == 0 && level == 3)
    {
        ItemText = "护身屏障\n按E键使用\n无限使用次数\n三年级\n生成土墙阻挡僵尸\n55 秒冷却时间\n6 秒持续时间";
    }
    else if(i == 0 && level == 4)
    {
        ItemText = "护身屏障\n按E键使用\n无限使用次数\n四年级\n生成土墙阻挡僵尸\n50 秒冷却时间\n6 秒持续时间";
    }
    //1 REPAIRO
    if(i == 1 && level == 0)
    {
        ItemText = "恢复如初\n按E键使用\n无限使用次数\n幼儿园学生\n恢复生命值\n50 秒冷却时间\n4 秒持续时间"; 
    } 
    else if(i == 1 && level == 1)
    {
        ItemText = "恢复如初\n按E键使用\n无限使用次数\n一年级\n恢复生命值\n50 秒冷却时间\n5 秒持续时间";
    } 
    else if(i == 1 && level == 2)
    {
        ItemText = "恢复如初\n按E键使用\n无限使用次数\n二年级\n恢复生命值\n45 秒冷却时间\n5 秒持续时间";
    } 
    else if(i == 1 && level == 3)
    {
        ItemText = "恢复如初\n按E键使用\n无限使用次数\n三年级\n恢复生命值\n45 秒冷却时间\n6 秒持续时间";
    }  
    else if(i == 1 && level == 3)	
    {
        ItemText = "恢复如初\n按E键使用\n无限使用次数\n四年级\n恢复生命值\n40 秒冷却时间\n6 秒持续时间";
    }   
    //2 AVADA
    if(i == 2 && level == 0)
    {
        ItemText = "阿瓦达索命\n按E键使用\n可以使用2次\n幼儿园学生\n范围内秒杀僵尸\n140 秒冷却时间\n使用10秒后生效咒语\n1 秒持续时间";
    } 
    else if(i == 2 && level == 1)
    {
        ItemText = "阿瓦达索命\n按E键使用\n可以使用3次\n一年级\n范围内秒杀僵尸\n135 秒冷却时间\n使用10秒后生效咒语\n1 秒持续时间"; 
    }
    else if(i == 2 && level == 2)
    {
        ItemText = "阿瓦达索命\n按E键使用\n可以使用3次\n二年级\n范围内秒杀僵尸\n130 秒冷却时间\n使用10秒后生效咒语\n1 秒持续时间"; 
    }
    else if(i == 2 && level == 3)
    {
        ItemText = "阿瓦达索命\n按E键使用\n可以使用3次\n三年级\n范围内秒杀僵尸\n125 秒冷却时间\n使用10秒后生效咒语\n1 秒持续时间"; 
    }
    else if(i == 2 && level == 4)
    {
        ItemText = "阿瓦达索命\n按E键使用\n可以使用3次\n四年级\n范围内秒杀僵尸\n120 秒冷却时间\n使用10秒后生效咒语\n1 秒持续时间"; 
    }
    //3 FLIPENDO
    if(i == 3 && level == 0)
    {
        ItemText = "退敌三尺\n按E键使用\n无限使用次数\n幼儿园学生\n直线吹风\n60 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 3 && level == 1)
    {
        ItemText = "退敌三尺\n按E键使用\n无限使用次数\n一年级\n直线吹风\n55 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 3 && level == 2)
    {
        ItemText = "退敌三尺\n按E键使用\n无限使用次数\n二年级\n直线吹风\n55 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 3 && level == 3)
    {
        ItemText = "退敌三尺\n按E键使用\n无限使用次数\n三年级\n直线吹风\n50 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 3 && level == 4)
    {
        ItemText = "退敌三尺\n按E键使用\n无限使用次数\n四年级\n直线吹风\n45 秒冷却时间\n5 秒持续时间"; 
    }
    //4 Impedimenta
    if(i == 4 && level == 0)
    {
        ItemText = "障碍重重\n按E键使用\n无限使用次数\n幼儿园学生\n范围冰冻僵尸\n70 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 4 && level == 1)
    {
        ItemText = "障碍重重\n按E键使用\n无限使用次数\n一年级\n范围冰冻僵尸\n65 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 4 && level == 2)
    {
        ItemText = "障碍重重\n按E键使用\n无限使用次数\n二年级\n范围冰冻僵尸\n60 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 4 && level == 3)
    {
        ItemText = "障碍重重\n按E键使用\n无限使用次数\n三年级\n范围冰冻僵尸\n55 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 4 && level == 4)
    {
        ItemText = "障碍重重\n按E键使用\n无限使用次数\n四年级\n范围冰冻僵尸\n50 秒冷却时间\n5 秒持续时间"; 
    }
    //5 Incendio
    if(i == 5 && level == 0)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n幼儿园学生\nBURN ZOMBIES\n55 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 5 && level == 1)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n一年级\nBURN ZOMBIES\n50 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 5 && level == 2)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n二年级\nBURN ZOMBIES\n50 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 5 && level == 3)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n三年级\nBURN ZOMBIES\n50 秒冷却时间\n6 秒持续时间"; 
    }
    else if(i == 5 && level == 4)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n四年级\nBURN ZOMBIES\n45 秒冷却时间\n6 秒持续时间"; 
    }
    //6 Accio
    if(i == 6 && level == 0)
    {
        ItemText = "弹药飞来\n按E键使用\n无限使用次数\n幼儿园学生\n无限弹药 补充两颗手雷\n50 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 6 && level == 1)
    {
        ItemText = "弹药飞来\n按E键使用\n无限使用次数\n一年级\n无限弹药 补充三颗手雷\n50 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 6 && level == 2)
    {
        ItemText = "弹药飞来\n按E键使用\n无限使用次数\n二年级\n无限弹药 补充四颗手雷\n45 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 6 && level == 3)
    {
        ItemText = "弹药飞来\n按E键使用\n无限使用次数\n三年级\n无限弹药 补充五颗手雷\n40 秒冷却时间\n6 秒持续时间"; 
    }
    else if(i == 6 && level == 4)
    {
        ItemText = "弹药飞来\n按E键使用\n无限使用次数\n四年级\n无限弹药 补充六颗手雷\n40 秒冷却时间\n7 秒持续时间\nHIDDEN AMMO TRIGGER FOR ENDING UNLOCKED"; 
    }
    //7 Crucio
    if(i == 7 && level == 0)
    {
        ItemText = "钻心剜骨\n按E键使用\n无限使用次数\n幼儿园学生\n对僵尸造成伤害\n60 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 7 && level == 1)
    {
        ItemText = "钻心剜骨\n按E键使用\n无限使用次数\n一年级\n对僵尸造成伤害\n55 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 7 && level == 2)
    {
        ItemText = "钻心剜骨\n按E键使用\n无限使用次数\n二年级\n对僵尸造成伤害\n50 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 7 && level == 3)
    {
        ItemText = "钻心剜骨\n按E键使用\n无限使用次数\n三年级\n对僵尸造成伤害\n50 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 7 && level == 4)
    {
        ItemText = "钻心剜骨\n按E键使用\n无限使用次数\n四年级\n对僵尸造成伤害\n45 秒冷却时间\n5 秒持续时间"; 
    }
    //8 Aguamenti
    if(i == 8 && level == 0)
    {
        ItemText = "清水如泉\n按E键使用\n无限使用次数\n幼儿园学生\n减速前方僵尸\n60 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 8 && level == 1)
    {
        ItemText = "清水如泉\n按E键使用\n无限使用次数\n一年级\n减速前方僵尸\n55 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 8 && level == 2)
    {
        ItemText = "清水如泉\n按E键使用\n无限使用次数\n二年级\n减速前方僵尸\n55 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 8 && level == 3)
    {
        ItemText = "清水如泉\n按E键使用\n无限使用次数\n三年级\n减速前方僵尸\n50 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 8 && level == 4)
    {
        ItemText = "清水如泉\n按E键使用\n无限使用次数\n四年级\n减速前方僵尸\n50 秒冷却时间\n6 秒持续时间"; 
    }
    //ZM ITEMS//
    //9 Expulso
    if(i == 9 && level == 0)
    {
        ItemText = "四分五裂\n按E键使用\n无限使用次数\n范围秒杀人类\n80 秒冷却时间\n8 秒释放魔咒\n1 秒持续时间"; 
    }
    else if(i == 9 && level == 1)
    {
        ItemText = "四分五裂\n按E键使用+无限使用次数\n范围秒杀人类\n75 秒冷却时间\n8 秒释放魔咒\n1 秒持续时间"; 
    }
    //10 Deprimo
    if(i == 10 && level == 0)
    {
        ItemText = "除你武器\n按E键使用\n无限使用次数\n减速人类\n60 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 10 && level == 1)
    {
        ItemText = "除你武器\n按E键使用\n无限使用次数\n减速人类\n55 秒冷却时间\n7 秒持续时间";
    }
    //11 Confundus
    if(i == 11 && level == 0)
    {
        ItemText = "混淆视听\n按E键使用\n无限使用次数\n混乱人类\n40 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 11 && level == 1)
    {
        ItemText = "混淆视听\n按E键使用\n无限使用次数\n混乱人类\n35 秒冷却时间\n6 秒持续时间";
    }
    //12 Emendo
    if(i == 12 && level == 0)
    {
        ItemText = "修骨补形\n按E键使用\n无限使用次数\n治疗僵尸\n50 秒冷却时间\n4 秒持续时间"; 
    }
    else if(i == 12 && level == 1)
    {
        ItemText = "修骨补形\n按E键使用\n无限使用次数\n治疗僵尸\n45 秒冷却时间\n6 秒持续时间";
    }
    //13 Incendio
    if(i == 13 && level == 0)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n燃烧人类\n60 秒冷却时间\n7 秒持续时间"; 
    }
    else if(i == 13 && level == 1)
    {
        ItemText = "火焰熊熊\n按E键使用\n无限使用次数\n燃烧人类\n55 秒冷却时间\n9 秒持续时间";
    }
    //14 Disillusionment
    if(i == 14 && level == 0)
    {
        ItemText = "若隐若现\n按E键使用\n无限使用次数\n隐身僵尸\n50 秒冷却时间\n6 秒持续时间"; 
    }
    else if(i == 14 && level == 1)
    {
        ItemText = "若隐若现\n按E键使用\n无限使用次数\n隐身僵尸\n45 秒冷却时间\n8 秒持续时间";
    }
    //15 Conjunctivitus
    if(i == 15 && level == 0)
    {
        ItemText = "粉身碎骨\n按E键使用\n无限使用次数\n对人类造成伤害\n40 秒冷却时间\n6 秒持续时间"; 
    }
    else if(i == 15 && level == 1)
    {
        ItemText = "粉身碎骨\n按E键使用\n无限使用次数\n对人类造成伤害\n35 秒冷却时间\n8 秒持续时间";
    }
    //16 Deletrius
    if(i == 16 && level == 0)
    {
        ItemText = "消隐无踪\n按E键使用\n1 次使用\nHUMAN WAND STOPPER\n让所有正在使用的人类魔咒失效\n有60/40的几率激活\n1 秒持续时间"; 
    }
    else if(i == 16 && level == 1)
    {
        ItemText = "消隐无踪\n按E键使用\n1 次使用\nHUMAN WAND STOPPER\n让所有正在使用的人类魔咒失效\n有60/40的几率激活\n1 秒持续时间";
    }
    //17 Reducio
    if(i == 17 && level == 0)
    {
        ItemText = "速速缩小\n按E键使用\n无限使用次数\n缩小僵尸\n105 秒冷却时间\n5 秒持续时间"; 
    }
    else if(i == 17 && level == 1)
    {
        ItemText = "速速缩小\n按E键使用\n无限使用次数\n缩小僵尸\n100 秒冷却时间\n7 秒持续时间";
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

us <- 5;

function AvadaUsedText()
{
    for(local au = 1; au < 2; au++)
    {
        if(au == 1)
        {
            ItemText = "阿瓦达 "+us+" 秒内释放";
            EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
            us--;
        }
        if(us == -1)
        {
            us = 5;
            return;
        }
    }
    EntFireByHandle(self,"RunScriptCode","AvadaUsedText();",1.00,null,null);
}

function COOLDOWNITEM(n)
{
    // n = 0 - 20sec
    // n = 1 - 10sec
    // n = 2 - 0sec
    if(n == 0)
    {
        ItemText = "魔杖将在 20 秒内准备好！";
    }
    else if(n == 1)
    {
        ItemText = "魔杖将在 10 秒内准备好！";
    }
    else if(n == 2)
    {
        ItemText = "魔杖准备好了！";
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

