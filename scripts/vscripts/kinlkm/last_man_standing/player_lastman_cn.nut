OWNER <- true;
Mutator <- false;
ItemText <- "";
PortalPlayer <- false;
handleAct <- self;

function ClearVar()
{
    Mutator = false;
    ItemText = "";
    PortalPlayer = false;
}

function SetTextItem(item)
{
    if(item == 0)
    {
        ItemText = "免疫装置:\n按 E 使用\n可在20秒内免疫僵尸感染\n仅能使用一次";
    }
    if(item == 1)
    {
        ItemText = "弹药:\n按 E 使用\n范围内人类当前弹药改为244发\n仅能使用一次";
    }
    if(item == 2)
    {
        ItemText = "高斯枪:\n按 E 使用发射光束秒杀正前方僵尸\n冷却时间：45秒";
    }
    if(item == 3)
    {
        ItemText = "神圣枪:\n按 E 使用后范围内人类4秒免抓\n冷却时间：60秒";
    }
    if(item == 4)
    {
        ItemText = "加特林机枪：\n按 E 使用 对正前方僵尸造成伤害";
    }
    if(item == 5)
    {
        ItemText = "地雷：\n 按 E 使用请不要在人群使用\n站到地雷正上方一秒可回收\n最多可使用13次"
    }
    if(item == 6)
    {
        ItemText = "突变基因：\n 按 E 使用放置药丸\n每个玩家仅可食用一次药丸\n冷却时间：10秒"
    }
    if(item == 7)
    {
        ItemText = "卫兵：\n 按 E 使用放置一个卫兵 持续时间50秒";
    }
    if(item == 8)
    {
        ItemText = "传送枪：\n 按 E 使用第一次放置传送门入口\n第二次放置传送门出口\n第三次移除两个传送门";
    }
    if(item == 9)
    {
        ItemText = "旋风枪：\n 按 E 发射一圈旋风\n最多可使用4次";
    }
    if(item == 10)
    {
        ItemText = "炮塔：\n 按 E 放置炮塔\n对着炮管按E可回收";
    }
    if(item == 11)
    {
        ItemText = "零重力枪:\n 按 E 使用可降低正前方僵尸重力\n冷却时间：30 秒";
    }
    if(item == 12)
    {
        ItemText = "超越极限：\n按 E 使用 给与玩家重力以及速度和血量加成\n持续时间45秒\n影响最大范围内的所有人类";
    }
    if(item == 13)
    {
        ItemText = "机械狗\n鼠标左键 = 切换攻击形态\n鼠标右键 = 攻击";
    }
    if(item == 14)
    {
        ItemText = "黑洞巫师：鼠标右键召唤传送门 最多存在两个\n碰到传送门的僵尸传送到自身位置\n传送门可以召唤三十次 存在时间无限";
    }
    if(item == 15)
    {
        ItemText = "跳跃者：按下右击键即可跳跃\n最好在跳的过程中右键";
    }
    if(item == 16)
    {
        ItemText = "阿尔玛：按下右键激活面前的浮空5秒\n被浮空的人类集体缴械\n抽取一名人类杀死 冷却时间：15秒\n仅在人类处于范围内时启用";
    }
    if(item == 17)
    {
        ItemText = "弗地冈：右键使用 将正前方人类钩到你面前\n冷却时间：5秒";
    }
    if(item == 18)
    {
        ItemText = "坦克：高血量 鼠标右键使用 可对范围内人类造成伤害";
    }
    if(item == 19)
    {
        ItemText = "蚁狮：鼠标右键使用 飞行十秒\n冷却时间: 20 秒";
    }
    if(item == 20)
    {
        ItemText = "冲击狗：鼠标右键使用\n 可将范围内僵尸以及自身击飞\n冷却时间：10秒";
    }
    if(item == 21)
    {
        ItemText = "飞天水龙：可自由飞行 鼠标右键使用\n 可将范围内人类冰冻\n冷却时间：15秒";
    }
    if(item == 22)
    {
        ItemText = "铁血战士：鼠标左键 = 切换形态\n鼠标右键 = 使用技能\n冷却十秒"
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

function ShowSelfItemText()
{
    EntFire("universal_item_text", "SetText", ItemText, 0.00, handleAct);
    EntFire("universal_item_text", "Display", "", 0.01, handleAct);
    EntFire("!self","RunScriptCode","ClearText();",5.00,handleAct);
}

function AnyText(t)
{
    if(t == 1)
    {
        ItemText = "PRESS LEFT CLICK TO SHOOT\nPRESS RIGHT CLICK CHANGE CAMERA AND CANNON ANGLE";
    }
    EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
}

function ClearText()
{
    ItemText = "";
}

function PlayerMutantDaun()
{
    local a = RandomInt(1,14);
    if(!Mutator && self.GetTeam() == 3)
    {
        if(a == 1)
        {
            EntFire("Global_Speed","ModifySpeed","0.90",0.00,null);
            ItemText = "你已获得: 降低 10%速度"
        }
        else if(a == 2)
        {
            EntFire("Global_Speed","ModifySpeed","1.10",0.00,null);
            ItemText = "你已获得: 提升 10%速度"
        }
        else if(a == 3)
        {
            EntFire("!self","AddOutput","gravity 0.8",0.00,null);
            ItemText = "你已获得: 降低 20%重力"
        }
        else if(a == 4)
        {
            EntFire("!self","AddOutput","rendercolor 128 255 0",0.00,null);
            ItemText = "你已获得: 绿色"
        }
        else if(a == 5)
        {
            EntFire("Global_Speed","ModifySpeed","1.30",0.00,null);
            ItemText = "你已获得: 提升 30%速度"
        }
        else if(a == 6)
        {
            EntFire("Global_Speed","ModifySpeed","0.80",0.00,null);
            ItemText = "你已获得: 降低 20%速度"
        }
        else if(a == 7)
        {
            EntFire("!self","AddOutput","rendermode 10",0.00,null);
            ItemText = "你已获得: 隐身"
        }
        else if(a == 8)
        {
            EntFire("!self","AddOutput","rendermode 6",0.00,null);
            ItemText = "你已获得: 隐身"
        }
        else if(a == 9)
        {
            EntFire("Global_Speed","ModifySpeed","1.75",0.00,null);
            ItemText = "你已获得: 提升 75%速度"
        }
        else if(a == 10)
        {
            EntFire("!self","AddOutput","health 15000",0.00,null);
            ItemText = "你已获得: 生命值提高至 15000"
        }
        else if(a == 11)
        {
            EntFire("!self","AddOutput","health 1",0.00,null);
            ItemText = "你已获得: 生命值降低至1"
        }
        else if(a == 12)
        {
            EntFire("!self","AddOutput","gravity 1.1",0.00,null);
            ItemText = "你已获得: 提高 10%重力"
        }
        else if(a == 13)
        {
            EntFire("!self","AddOutput","health 1337",0.00,null);
            ItemText = "你已获得: 生命值提高至1337"
        }
        else if(a == 14)
        {
            EntFire("!self","AddOutput","gravity 2",0.00,null);
            ItemText = "你已获得: 提高 100%重力"
        }
        EntFireByHandle(self,"RunScriptCode","ShowSelfItemText();",0.01,null,null);
        EntFire("Weapon_Mutator_Projectile_Model2","Kill","",0.00,null);
        EntFire("Weapon_Mutator_Projectile_Trigger","Kill","",0.00,null);
        Mutator = true;
    }
}

function PortalTeleport()
{
    if(!PortalPlayer)
    {
        local port01 = null;
        local getoPort01 = null;
        if(null != (port01 = Entities.FindByName(port01,"Weapon_PortalGun_Portal_1_Teleport")))
        {
            getoPort01 = port01.GetOrigin();
			local oriport01 = "origin "+getoPort01.x+" "+getoPort01.y+" "+(getoPort01.z+6);
			EntFireByHandle(handleAct,"AddOutput",oriport01,0.05,null,null);
            EntFire("!activator","RunScriptCode","PortalPlayer = true;",0.00,handleAct);
            EntFire("!activator","RunScriptCode","PortalPlayer = false;",2.00,handleAct);
        }
    }
}

function PortalTeleport2()
{
    if(!PortalPlayer)
    {
        local port02 = null;
        local getoPort02 = null;
        if(null != (port02 = Entities.FindByName(port02,"Weapon_PortalGun_Portal_2_Teleport")))
         {
            getoPort02 = port02.GetOrigin();
			local oriport02 = "origin "+getoPort02.x+" "+getoPort02.y+" "+(getoPort02.z+6);
			EntFireByHandle(handleAct,"AddOutput",oriport02,0.05,null,null);
            EntFire("!activator","RunScriptCode","PortalPlayer = true;",0.00,handleAct);
            EntFire("!activator","RunScriptCode","PortalPlayer = false;",2.00,handleAct);
        }
    }
}
