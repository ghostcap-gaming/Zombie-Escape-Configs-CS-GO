EVENT_ARRAY <- [
	["EVENT_CRANE_BREAKABLE","null","St1 机械狗"], //0
	["EVENT_TANK_REACHES_END","null","St1 坦克"], //1
	["EVENT_GENERATOR_ACTIVATED","null","St1 东发电机"], //2
	["EVENT_HELICOPTER_ESCAPES","null","St1 直升机"], //3
	["EVENT_HUMAN_ESCAPE_STAGE1","null","St1 撤离"], //4
	["EVENT_STAGE2_TRUCK_ESCAPES","null","St2 卡车撤离"], //5
	["EVENT_STAGE2_TRUCK_ESCAPES_WITHHUMANS","null","St2 撤离"], //6
	["EVENT_STAGE2_PORTAL_GUN","null","St2 传送枪"], //7
	["EVENT_STAGE2_THUNDER_GUN","null","St2 旋风枪"], //8
	["EVENT_STAGE2_INMUNIZER_GUN","null","St2 神圣枪"], //9
	["EVENT_STAGE2_MUTATOR","null","St2 基因突变"], //10
	["EVENT_STAGE2_ZEROGRAVITY","null","St2 零重力枪"], //11
	["EVENT_STAGE2_TURRET","null","St2 炮塔"], //12
	["EVENT_STAGE2_GENERATOR","null","St2 南发电机"], //13
	["EVENT_STAGE3_GENERATOR","null","St3 北发电机"], //14
	["EVENT_ZMITEM_SUMMONER","null","ZM 黑洞巫师"], //15
	["EVENT_ZMITEM_JUMPER","null","ZM 跳跃者"], //16
	["EVENT_ZMITEM_ALMA","null","ZM 阿尔玛"], //17
	["EVENT_ZMITEM_VORTIGAUNT","null","ZM 弗地冈"], //18
	["EVENT_ZMITEM_ANTLION","null","ZM 蚁狮"], //19
	["EVENT_ZMITEM_SHOCKWAVE","null","ZM 冲击狗"], //20
	["EVENT_ZMITEM_PREDATOR","null","ZM 铁血战士"], //21
	["EVENT_STAGE3_TRUCK_REACHES_END","null","St3 撤离"], //22
	["EVENT_STAGE4_HUMAN_ESCAPES","null","St4 撤离"], //23
	["EVENT_STAGE4_GENERATOR_ACTIVATED","null","St4 西发电机"], //24
	["EVENT_STAGE4_ULTRALISK_DIES","null","St4 杀死雷兽"], //25
	["EVENT_STAGE4_PLANE_ESCAPE","null","St4 飞机"], //26
	["EVENT_STAGE4_APACHE_ESCAPES","null","St4 阿帕奇"], //27
	["EVENT_STAGE4_JUGGERNAUT_ESCAPES","null","St4 机甲"], //28
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_FLAMETHROWER","null","St4 机甲喷火器"], //29
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_ROCKETLAUNCHER","null","St4 机甲火箭筒"], //30
	["EVENT_STAGE4_JUGGERNAUT_UNLOCK_MINIGUN","null","St4 机甲机枪"] //31
];

TEMP_EVENTS_ARRAY <- [];
EVENTS_COMPLETED <- [];
TEXT_EVENT <- "";
COUNT_TEXT <- 0;

EVENTS_NOTCOMPLETED <- [];

function CheckTempEvent()
{
	for(local i = 0; i < TEMP_EVENTS_ARRAY.len(); i++)
    {
        for(local a = 0; a < EVENT_ARRAY.len(); a++)
        {
            if(TEMP_EVENTS_ARRAY[i] == EVENT_ARRAY[a][0])
            {
                EVENT_ARRAY[a][1] = "COMPLETED";
            }
        }
    }
}

function CompleteAllEvents()
{
    for(local i = 0; i < EVENT_ARRAY.len(); i++)
    {
        EVENT_ARRAY[i][1] = "COMPLETED";
    }
}

function ResetEvents()
{
    for(local i = 0; i < EVENT_ARRAY.len(); i++)
    {
        EVENT_ARRAY[i][1] = "null";
    }
}

function CheckEventsPrint()
{
    EVENTS_COMPLETED = [];
    COUNT_TEXT = 0;
    for(local i = 0; i < EVENT_ARRAY.len(); i++)
    {
        if(EVENT_ARRAY[i][1] == "COMPLETED")
        {
            local event = EVENT_ARRAY[i][2].tostring();
            EVENTS_COMPLETED.push(event);
        }
    }
    if(EVENTS_COMPLETED.len() == 0)
    {
        EVENTS_COMPLETED = "\n未完成任何事件";
		EntFireByHandle(self, "RunScriptCode", "CheckEventsNotCPrint();", 4.00, null, null);
        return ScriptPrintMessageCenterAll("已完成事件: "+EVENTS_COMPLETED);
    }
    SortArrayText();
}

function SortArrayText()
{
    TEXT_EVENT = "";
    local SortCount = 0;
    for(COUNT_TEXT; COUNT_TEXT < EVENTS_COMPLETED.len(); COUNT_TEXT++)
    {
        if(EVENTS_COMPLETED.len() > 0)
        {
            if(SortCount >= 5){return PrintEventMess();}
            TEXT_EVENT += "\n"+EVENTS_COMPLETED[COUNT_TEXT].tostring();
            SortCount++;
        }
    }
	EntFireByHandle(self, "RunScriptCode", "CheckEventsNotCPrint();", 5.00, null, null);
    return ScriptPrintMessageCenterAll("已完成事件 "+EVENTS_COMPLETED.len()+"/"+EVENT_ARRAY.len()+": "+TEXT_EVENT);;
}

function CheckEventsNotCPrint()
{
    EVENTS_NOTCOMPLETED = [];
    COUNT_TEXT = 0;
    for(local i = 0; i < EVENT_ARRAY.len(); i++)
    {
        if(EVENT_ARRAY[i][1] == "null")
        {
            local event = EVENT_ARRAY[i][2].tostring();
            EVENTS_NOTCOMPLETED.push(event);
        }
    }
    if(EVENTS_NOTCOMPLETED.len() == 0)
    {
        EVENTS_NOTCOMPLETED = "\n所有事件已全部完成";
        return ScriptPrintMessageCenterAll("未完成事件: "+EVENTS_NOTCOMPLETED);
    }
    SortArrayNotCText();
}

function SortArrayNotCText()
{
    TEXT_EVENT = "";
    local SortCount = 0;
    for(COUNT_TEXT; COUNT_TEXT < EVENTS_NOTCOMPLETED.len(); COUNT_TEXT++)
    {
        if(EVENTS_NOTCOMPLETED.len() > 0)
        {
            if(SortCount >= 5){return PrintEventNotCMess();}
            TEXT_EVENT += "\n"+EVENTS_NOTCOMPLETED[COUNT_TEXT].tostring();
            SortCount++;
        }
    }
    return ScriptPrintMessageCenterAll("未完成事件 "+EVENTS_NOTCOMPLETED.len()+"/"+EVENT_ARRAY.len()+": "+TEXT_EVENT);
}

function PrintEventMess()
{
    ScriptPrintMessageCenterAll("已完成事件 "+EVENTS_COMPLETED.len()+"/"+EVENT_ARRAY.len()+": "+TEXT_EVENT);
    EntFireByHandle(self, "RunScriptCode", "SortArrayText();", 4.00, null, null);
}

function PrintEventNotCMess()
{
    ScriptPrintMessageCenterAll("未完成事件 "+EVENTS_NOTCOMPLETED.len()+"/"+EVENT_ARRAY.len()+": "+TEXT_EVENT);
    EntFireByHandle(self, "RunScriptCode", "SortArrayNotCText();", 4.00, null, null);
}

function CompleteEventCrane()
{
    local event = "EVENT_CRANE_BREAKABLE"
	return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventTankEnd()
{
	local event = "EVENT_TANK_REACHES_END"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventGenerator()
{
	local event = "EVENT_GENERATOR_ACTIVATED"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventHelicopter()
{
    local event = "EVENT_HELICOPTER_ESCAPES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventHumanEscapeStage1()
{
	local event = "EVENT_HUMAN_ESCAPE_STAGE1"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2TruckEscapes()
{
	local event = "EVENT_STAGE2_TRUCK_ESCAPES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2TruckEscapesWH()
{
	local event = "EVENT_STAGE2_TRUCK_ESCAPES_WITHHUMANS"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2PortalG()
{
	local event = "EVENT_STAGE2_PORTAL_GUN"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2ThunGun()
{
	local event = "EVENT_STAGE2_THUNDER_GUN"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2InmunizerG()
{
	local event = "EVENT_STAGE2_INMUNIZER_GUN"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2Mutator()
{
	local event = "EVENT_STAGE2_MUTATOR"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2ZeroGGun()
{
	local event = "EVENT_STAGE2_ZEROGRAVITY"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2Turret()
{
	local event = "EVENT_STAGE2_TURRET"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage2Generator()
{
	local event = "EVENT_STAGE2_GENERATOR"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage3Generator()
{
	local event = "EVENT_STAGE3_GENERATOR"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemSummoner()
{
	local event = "EVENT_ZMITEM_SUMMONER"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemJumper()
{
	local event = "EVENT_ZMITEM_JUMPER"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemAlma()
{
	local event = "EVENT_ZMITEM_ALMA"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemVortigaunt()
{
	local event = "EVENT_ZMITEM_VORTIGAUNT"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemAntlion()
{
	local event = "EVENT_ZMITEM_ANTLION"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemShockwave()
{
	local event = "EVENT_ZMITEM_SHOCKWAVE"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteItemPredator()
{
	local event = "EVENT_ZMITEM_PREDATOR"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteStage3TruckReachEnd()
{
	local event = "EVENT_STAGE3_TRUCK_REACHES_END"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteStage4End()
{
	local event = "EVENT_STAGE4_HUMAN_ESCAPES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventStage4Generator()
{
	local event = "EVENT_STAGE4_GENERATOR_ACTIVATED"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventUltraliskD()
{
	local event = "EVENT_STAGE4_ULTRALISK_DIES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventPlane()
{
	local event = "EVENT_STAGE4_PLANE_ESCAPE"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventApaches()
{
	local event = "EVENT_STAGE4_APACHE_ESCAPES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventJugger()
{
	local event = "EVENT_STAGE4_JUGGERNAUT_ESCAPES"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventJugFlame()
{
	local event = "EVENT_STAGE4_JUGGERNAUT_UNLOCK_FLAMETHROWER"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventJugRocket()
{
	local event = "EVENT_STAGE4_JUGGERNAUT_UNLOCK_ROCKETLAUNCHER"
    return TEMP_EVENTS_ARRAY.push(event);
}

function CompleteEventJugMini()
{
	local event = "EVENT_STAGE4_JUGGERNAUT_UNLOCK_MINIGUN"
    return TEMP_EVENTS_ARRAY.push(event);
}

STAGE <- 0;
SAVESTAGE <- 0;
STAGE_CHANGE <- true;

mp <- 0;
Time <- 480.00;
SaveTime <- 0.00;
TimerTick <- true;
TimerText <- "核弹发射倒计时: ";
End <- true;
SpawnTp <- true;
AfkTp <- 0;
EXTREME <- false;
Music <- true;
MaxVolume <- 2;
PlayersArr <- [];
Zone_Kill <- null;

TELEPORT_PLAYER <- [
	//WARMUP SPAWN
	[Vector(3696,4376,1832),
	Vector(3390.09,4383.69,1832),
	Vector(3319.65,3477.39,1832),
	Vector(3719.44,3920.56,1832),
	Vector(3522.49,3959.04,1832),
	Vector(3341.61,3956.15,1832),
	Vector(3526.95,4389.62,1832),
	Vector(3529.5,4209.68,1832),
	Vector(3531.57,3593.14,1832),
	Vector(2976.01,4607.99,2240),
	Vector(2752.01,4231.99,2024),
	Vector(2656.01,4231.99,2024),
	Vector(2648.01,4135.99,2024),
    Vector(2648.01,3535.99,2024),
    Vector(2744.01,3535.99,2024),
    Vector(2752.01,3631.99,2024),
    Vector(2656.01,3631.99,2024),
    Vector(2488.01,3871.99,2024),
    Vector(2496.01,3975.99,2024),
    Vector(2392.01,3927.99,2024),
    Vector(2304.01,3911.99,2024),
    Vector(2184.01,3911.99,2024),
    Vector(2080.01,3903.99,2024),
    Vector(2000.01,3903.99,2024),
    Vector(3507.27,4132.94,1832),
    Vector(3370.41,4127.01,1832),
    Vector(3676.32,4119.32,1832),
    Vector(3474.89,3764.39,1832),
    Vector(3338.03,3758.46,1832),
    Vector(3643.94,3750.77,1832),
    Vector(3485.65,3497.27,1832),
    Vector(3432,3199.99,1960),
    Vector(3654.7,3483.65,1832),
    Vector(2062.95,3789.62,2024),
    Vector(1926.09,3783.69,2024),
    Vector(2232,3776,2024),
    Vector(2054.95,4031.99,2024),
    Vector(1918.09,4026.06,2024),
    Vector(2224,4018.37,2024),
    Vector(3448,4384,1832),
    Vector(3428.32,4127.32,1832),
    Vector(3377.56,3477.7,1832),
    Vector(3395.94,3758.77,1832),
    Vector(3399.52,3956.46,1832),
    Vector(3176,3956.15,1872),
    Vector(3024,3956.15,1928),
    Vector(3032.01,3215.99,2024),
    Vector(2936.01,3215.99,2024),
    Vector(2944.01,3311.99,2024),
    Vector(3040.01,3311.99,2024),
    Vector(2912.01,4527.99,2024),
    Vector(3008.01,4527.99,2024),
    Vector(2920.01,4623.99,2024),
    Vector(3016.01,4623.99,2024),
    Vector(3144.01,4607.99,2240),
    Vector(3344.01,4607.99,2240),
    Vector(2760.01,4127.99,2024),
    Vector(3808,3400,1832),
    Vector(2656.01,3711.99,2024),
    Vector(2752.01,3711.99,2024),
    Vector(2656.01,4319.99,2024),
    Vector(2752.01,4319.99,2024),
    Vector(2576.01,4215.99,2024),
    Vector(2568.01,4119.99,2024)],

	//LEVEL 1

    [Vector(-6352,251.74,-15184),
    Vector(-6352.2,383.99,-15184),
    Vector(-6216,239.99,-15184),
    Vector(-6248.2,311.99,-15184),
    Vector(-6256,399.99,-15184),
    Vector(-6168,607.99,-15184),
    Vector(-6112.2,535.99,-15184),
    Vector(-6120.2,375.99,-15184),
    Vector(-6120,243.74,-15184),
    Vector(-6008.2,599.99,-15184),
    Vector(-6016.2,463.99,-15184),
    Vector(-6016.2,303.99,-15184),
    Vector(-5928.2,543.99,-15184),
    Vector(-5936.2,383.99,-15184),
    Vector(-5936,251.74,-15184),
    Vector(-5824.2,607.99,-15184),
    Vector(-5832.2,471.99,-15184),
    Vector(-5832.2,311.99,-15184),
    Vector(-5696.2,535.99,-15184),
    Vector(-5704.2,375.99,-15184),
    Vector(-5704,243.74,-15184),
    Vector(-5592.2,599.99,-15184),
    Vector(-5600.2,463.99,-15184),
    Vector(-5592,263.99,-15072),
    Vector(-5520,599.99,-15184),
    Vector(-5536,359.99,-15032),
    Vector(-5528.2,255.99,-15072),
    Vector(-5416.2,591.99,-15184),
    Vector(-5480,479.99,-15112),
    Vector(-5448,407.99,-15040),
    Vector(-5292,516,-15184),
    Vector(-5296,351.99,-15064),
    Vector(-5248,359.99,-15064),
    Vector(-5184.2,583.99,-15184),
    Vector(-5192.2,447.99,-15184),
    Vector(-5192.2,244.24,-15016),
    Vector(-5152,191.99,-15016),
    Vector(-5112.2,367.99,-15184),
    Vector(-5104.2,527.99,-15184),
    Vector(-5008.2,295.99,-15184),
    Vector(-5008.2,455.99,-15184),
    Vector(-5000.2,591.99,-15184),
    Vector(-4880,227.74,-15184),
    Vector(-4880.2,359.99,-15184),
    Vector(-4872.2,519.99,-15184),
	Vector(-4776.2,287.99,-15184),
	Vector(-4776.2,447.99,-15184),
	Vector(-4768.2,583.99,-15184),
	Vector(-4672,283.74,-15184),
	Vector(-4664.2,575.99,-15184),
	Vector(-4592,251.74,-15184),
	Vector(-4592.2,383.99,-15184),
	Vector(-4584.2,543.99,-15184),
	Vector(-4488.2,311.99,-15184),
	Vector(-4488.2,471.99,-15184),
	Vector(-4480.2,607.99,-15184),
	Vector(-4360,243.74,-15184),
	Vector(-4360.2,375.99,-15184),
	Vector(-4352.2,535.99,-15184),
	Vector(-4256.2,303.99,-15184),
	Vector(-4256.2,463.99,-15184),
	Vector(-4248.2,599.99,-15184),
	Vector(-4248.2,599.99,-15184),
	Vector(-4248.2,599.99,-15184)],

	//LEVEL 2

	[Vector(4376.01,-13624,-7256),
	Vector(4440.01,-13728,-7256),
	Vector(4512.01,-13632,-7256),
	Vector(4600.01,-13736,-7256),
	Vector(4672.01,-13632,-7256),
	Vector(4732.26,-13735.8,-7256),
	Vector(4360.01,-14032,-7256),
	Vector(4424.01,-14136,-7256),
	Vector(4496.01,-14040,-7256),
	Vector(4584.01,-14144,-7256),
	Vector(4656.01,-14040,-7256),
	Vector(4716.26,-14143.8,-7256),
	Vector(4384.01,-13392,-7256),
	Vector(4448.01,-13496,-7256),
	Vector(4520.01,-13400,-7256),
	Vector(4608.01,-13504,-7256),
	Vector(4680.01,-13400,-7256),
	Vector(4740.26,-13503.8,-7256),
	Vector(4368.01,-13800,-7256),
	Vector(4432.01,-13904,-7256),
	Vector(4504.01,-13808,-7256),
	Vector(4592.01,-13912,-7256),
	Vector(4664.01,-13808,-7256),
	Vector(4724.26,-13911.8,-7256),
	Vector(4368.01,-14216,-7256),
	Vector(4432.01,-14320,-7256),
	Vector(4504.01,-14224,-7256),
	Vector(4592.01,-14328,-7256),
	Vector(4664.01,-14224,-7256),
	Vector(4724.26,-14327.8,-7256),
	Vector(4360.01,-14448,-7256),
	Vector(4424.01,-14552,-7256),
	Vector(4496.01,-14456,-7256),
	Vector(4584.01,-14560,-7256),
	Vector(4656.01,-14456,-7256),
	Vector(4716.26,-14559.8,-7256),
	Vector(4400.01,-13192,-7256),
	Vector(4464.01,-13296,-7256),
	Vector(4536.01,-13200,-7256),
	Vector(4624.01,-13304,-7256),
	Vector(4696.01,-13200,-7256),
	Vector(4756.26,-13303.8,-7256),
	Vector(4408.01,-12960,-7256),
	Vector(4472.01,-13064,-7256),
	Vector(4544.01,-12968,-7256),
	Vector(4632.01,-13072,-7256),
	Vector(4704.01,-12968,-7256),
	Vector(4764.26,-13071.8,-7256),
	Vector(4400.01,-12776,-7256),
	Vector(4464.01,-12880,-7256),
	Vector(4536.01,-12784,-7256),
	Vector(4624.01,-12888,-7256),
	Vector(4696.01,-12784,-7256),
	Vector(4756.26,-12887.8,-7256),
	Vector(4408.01,-12544,-7256),
	Vector(4472.01,-12648,-7256),
	Vector(4544.01,-12552,-7256),
	Vector(4632.01,-12656,-7256),
	Vector(4704.01,-12552,-7256),
	Vector(4764.26,-12655.8,-7256),
	Vector(4424.01,-12136,-7256),
	Vector(4488.01,-12240,-7256),
	Vector(4560.01,-12144,-7256),
	Vector(4648.01,-12248,-7256)],

	//LEVEL 3

	[Vector(4227.78,10432,-848),
	Vector(4187.78,10432,-848),
	Vector(4187.78,10472,-848),
	Vector(4227.78,10472,-848),
	Vector(4216.97,9679.99,-848),
	Vector(4176.97,9679.99,-848),
	Vector(4176.97,9719.99,-848),
	Vector(4216.97,9719.99,-848),
	Vector(4218.41,10040,-856),
	Vector(4178.41,10040,-856),
	Vector(4178.41,10080,-856),
	Vector(4218.41,10080,-856),
	Vector(4104,9744,-848),
	Vector(4064,9744,-848),
	Vector(4064,9784,-848),
	Vector(4104,9784,-848),
	Vector(4104,10128,-848),
	Vector(4064,10128,-848),
	Vector(4064,10168,-848),
	Vector(4104,10168,-848),
	Vector(4120,10520,-856),
	Vector(4080,10520,-856),
	Vector(4080,10560,-856),
	Vector(4120,10560,-856),
	Vector(4104,9616,-856),
	Vector(4064,9616,-856),
	Vector(4064,9656,-856),
	Vector(4104,9656,-856),
	Vector(4104,9992,-856),
	Vector(4064,9992,-856),
	Vector(4064,10032,-856),
	Vector(4104,10032,-856),
	Vector(4120,10384,-856),
	Vector(4080,10384,-856),
	Vector(4080,10424,-856),
	Vector(4120,10424,-856),
	Vector(4227.78,10432,-848),
	Vector(4187.78,10432,-848),
	Vector(4187.78,10472,-848),
	Vector(4227.78,10472,-848),
	Vector(4216.97,9679.99,-848),
	Vector(4176.97,9679.99,-848),
	Vector(4176.97,9719.99,-848),
	Vector(4216.97,9719.99,-848),
	Vector(4218.41,10040,-856),
	Vector(4178.41,10040,-856),
	Vector(4178.41,10080,-856),
	Vector(4218.41,10080,-856),
	Vector(4104,9744,-848),
	Vector(4064,9744,-848),
	Vector(4064,9784,-848),
	Vector(4104,9784,-848),
	Vector(4104,10128,-848),
	Vector(4064,10128,-848),
	Vector(4064,10168,-848),
	Vector(4104,10168,-848),
	Vector(4120,10520,-856),
	Vector(4080,10520,-856),
	Vector(4080,10560,-856),
	Vector(4120,10560,-856),
	Vector(4104,9616,-856),
	Vector(4064,9616,-856),
	Vector(4064,9656,-856),
	Vector(4104,9656,-856)],

    //LEVEL 4

    [Vector(4438.63,7824,3383.75),
	Vector(4502.63,7720,3383.75),
	Vector(4574.63,7816,3383.75),
	Vector(4662.63,7712,3383.75),
	Vector(4734.63,7816,3383.75),
	Vector(4794.88,7712.2,3383.75),
	Vector(4352.01,7720,3383.75),
	Vector(4288.01,7824,3383.75),
	Vector(4454.63,7632,3383.75),
	Vector(4518.63,7528,3383.75),
	Vector(4590.63,7624,3383.75),
	Vector(4678.63,7520,3383.75),
	Vector(4750.63,7624,3383.75),
	Vector(4810.88,7520.2,3383.75),
	Vector(4368.01,7528,3383.75),
	Vector(4304.01,7632,3383.75),
	Vector(4462.63,7224,3383.75),
	Vector(4526.63,7120,3383.75),
	Vector(4598.63,7216,3383.75),
	Vector(4686.63,7112,3383.75),
	Vector(4758.63,7216,3383.75),
	Vector(4818.88,7112.2,3383.75),
	Vector(4376.01,7120,3383.75),
	Vector(4312.01,7224,3383.75),
	Vector(4446.63,7416,3383.75),
	Vector(4510.63,7312,3383.75),
	Vector(4582.63,7408,3383.75),
	Vector(4670.63,7304,3383.75),
	Vector(4742.63,7408,3383.75),
	Vector(4802.88,7304.2,3383.75),
	Vector(4360.01,7312,3383.75),
	Vector(4296.01,7416,3383.75),
	Vector(3878.63,7248,3383.75),
	Vector(3942.63,7144,3383.75),
	Vector(4014.63,7240,3383.75),
	Vector(4102.63,7136,3383.75),
	Vector(4174.63,7240,3383.75),
	Vector(4234.88,7136.2,3383.75),
	Vector(3792.01,7144,3383.75),
	Vector(3728.01,7248,3383.75),
	Vector(3862.63,7440,3383.75),
	Vector(3926.63,7336,3383.75),
	Vector(3998.63,7432,3383.75),
	Vector(4086.63,7328,3383.75),
	Vector(4158.63,7432,3383.75),
	Vector(4218.88,7328.2,3383.75),
	Vector(3776.01,7336,3383.75),
	Vector(3712.01,7440,3383.75),
	Vector(3870.63,7656,3383.75),
	Vector(3934.63,7552,3383.75),
	Vector(4006.63,7648,3383.75),
	Vector(4094.63,7544,3383.75),
	Vector(4166.63,7648,3383.75),
	Vector(4226.88,7544.2,3383.75),
	Vector(3784.01,7552,3383.75),
	Vector(3720.01,7656,3383.75),
	Vector(3854.63,7848,3383.75),
	Vector(3918.63,7744,3383.75),
	Vector(3990.63,7840,3383.75),
	Vector(4078.63,7736,3383.75),
	Vector(4150.63,7840,3383.75),
	Vector(4210.88,7736.2,3383.75),
	Vector(3768.01,7744,3383.75),
	Vector(3704.01,7848,3383.75)],

	//LEVEL 5

    [Vector(8504,-1096,9544),
	Vector(8408,-1096,9544),
	Vector(8408,-1000,9544),
	Vector(8504,-1000,9544),
	Vector(827.01,-8270.08,9544),
	Vector(731.01,-8270.08,9544),
	Vector(731.01,-8174.08,9544),
	Vector(827.01,-8174.08,9544),
	Vector(1097.18,-770.51,9544),
	Vector(1001.18,-770.51,9544),
	Vector(1001.18,-674.51,9544),
	Vector(1097.18,-674.51,9544),
	Vector(8082.12,-8573.99,9544),
	Vector(7986.12,-8573.99,9544),
	Vector(7986.12,-8477.99,9544),
	Vector(8082.12,-8477.99,9544),
	Vector(8539.79,-8215.29,9544),
	Vector(8443.79,-8215.29,9544),
	Vector(8443.79,-8119.29,9544),
	Vector(8539.79,-8119.29,9544),
	Vector(8168.04,-818.71,9544),
	Vector(8072.04,-818.71,9544),
	Vector(8072.04,-722.71,9544),
	Vector(8168.04,-722.71,9544),
	Vector(797.68,-1183.56,9544),
	Vector(701.68,-1183.56,9544),
	Vector(701.68,-1087.56,9544),
	Vector(797.68,-1087.56,9544),
	Vector(1202.08,-8542.94,9544),
	Vector(1106.08,-8542.94,9544),
	Vector(1106.08,-8446.94,9544),
	Vector(1202.08,-8446.94,9544),
	Vector(8476.96,-8545.53,9544),
	Vector(8380.96,-8545.53,9544),
	Vector(8380.96,-8449.53,9544),
	Vector(8476.96,-8449.53,9544),
	Vector(8495.59,-819.65,9544),
	Vector(8399.59,-819.65,9544),
	Vector(8399.59,-723.65,9544),
	Vector(8495.59,-723.65,9544),
	Vector(840,-871.68,9544),
	Vector(744,-871.68,9544),
	Vector(744,-775.68,9544),
	Vector(840,-775.68,9544),
	Vector(920.95,-8529.4,9544),
	Vector(824.95,-8529.4,9544),
	Vector(824.95,-8433.4,9544),
	Vector(920.95,-8433.4,9544),
	Vector(8254.19,-8278.61,9544),
	Vector(8158.19,-8278.61,9544),
	Vector(8158.19,-8182.61,9544),
	Vector(8254.19,-8182.61,9544),
	Vector(8252.57,-1093.27,9544),
	Vector(8156.57,-1093.27,9544),
	Vector(8156.57,-997.27,9544),
	Vector(8252.57,-997.27,9544),
	Vector(1093.79,-1081.58,9544),
	Vector(997.79,-1081.58,9544),
	Vector(997.79,-985.58,9544),
	Vector(1093.79,-985.58,9544),
	Vector(1124.82,-8254.94,9544),
	Vector(1028.82,-8254.94,9544),
	Vector(1028.82,-8158.94,9544),
	Vector(1124.82,-8158.94,9544)]
]

AFK_TELEPORT <- [
	[Vector(0,0,0)],

	//LEVEL 1 AFK TP

	[Vector(0,0,0),
	Vector(6396,244,-13628.6),
	Vector(12180,-10404,-13628),
	Vector(3854.41,-9344,-12839.5)],

	//LEVEL 2 AFK TP

	[Vector(0,0,0),
	Vector(3917.35,744.01,-7372.61)],

	//LEVEL 3 AFK TP

    [Vector(0,0,0),
	Vector(-315.99,6392,-548.61),
	Vector(8019.99,3878,1219.39),
	Vector(700.02,1908,1443.39)],

	//LEVEL 4 AFK TP

    [Vector(0,0,0),
	Vector(5970,7971.98,3379.39),
	Vector(180,-780.02,3379.39),
	Vector(-11092,-10486,3379.39),
	Vector(9627.16,-7708,3379.39)],

	//LEVEL 5 AFK TP

    [Vector(0,0,0),
	Vector(4622,4981,11015),
	Vector(8468,-9885.58,11580),
	Vector(-740,-1052,11844),
	Vector(1786.24,-9676,11916),
	Vector(7108,1500,11764)]
]

TeleportCount <- 0;

MUSIC_COUNT <- 0;

MUSIC_ARRAY <- [
	["FIRST INDEX CLEAR"],//FOR WARM UP
    // STAGE 1
	["FIRST INDEX CLEAR",
	"message rafuron/music/hard_new_new/stage_1_start.mp3",//STAGE 1 FIRST MUSIC
    "message rafuron/music/hard_new_new/stage_1_end.mp3",//STAGE 1 END MUSIC
	// STAGE 6 EXTREME
    "message rafuron/music/extreme_new_new/e_stage_1_start.mp3",//STAGE 6 FIRST MUSIC //INDEX 3
    "message rafuron/music/extreme_new_new/e_stage_1_midt.mp3"],//STAGE 6 END MUSIC //INDEX 4
	// STAGE 2
	["FIRST INDEX CLEAR",
	"message rafuron/music/hard_new_new/stage_2_start.mp3",//STAGE 2 FIRST MUSIC
    "message rafuron/music/hard_new_new/stage_2_end.mp3",//STAGE 2 END MUSIC
	// STAGE 7 EXTREME
	"message rafuron/music/extreme_new_new/e_stage_2_start.mp3",//STAGE 7 FIRST MUSIC //INDEX 3
    "message rafuron/music/extreme_new_new/e_stage_2_mid.mp3"],//STAGE 7 END MUSIC //INDEX 4
	// STAGE 3
	["FIRST INDEX CLEAR",
	"message rafuron/music/hard_new_new/stage_3_start.mp3",//STAGE 3 FIRST MUSIC
    "message rafuron/music/hard_new_new/stage_3_mid.mp3",//STAGE 3 SECOND MUSIC
	"message rafuron/music/hard_new_new/stage_3_boss.mp3",//STAGE 3 END MUSIC
	//STAGE 8 EXTREME
	"message rafuron/music/extreme_new_new/e_stage_3_start.mp3",//STAGE 8 FIRST MUSIC //INDEX 4
    // "message #rafuron/music/hard_new_new/stage_3_mid.mp3",//STAGE 8 SECOND MUSIC //INDEX 5 //FIRST SONG IS THE SAME SECOND
	"message rafuron/music/extreme_new_new/e_stage_3_boss.mp3"],//STAGE 8 END MUSIC //INDEX 5 **(//INDEX 6)**
	// STAGE 4
	["FIRST INDEX CLEAR",
	"message rafuron/music/hard_new_new/stage_4_start.mp3",//STAGE 4 FIRST MUSIC
    "message rafuron/music/hard_new_new/stage_4_mid.mp3",//STAGE 4 SECOND MUSIC
	"message rafuron/music/hard_new_new/stage_4_end.mp3",//STAGE 4 END MUSIC
	//STAGE 9 EXTREME
	"message rafuron/music/extreme_new_new/e_stage_4_start.mp3",//STAGE 9 FIRST MUSIC //INDEX 4
    "message rafuron/music/extreme_new_new/e_stage_4_mid.mp3",//STAGE 9 SECOND MUSIC //INDEX 5
	"message rafuron/music/extreme_new_new/e_stage_4_end.mp3"],//STAGE 9 END MUSIC //INDEX 6
	// STAGE 5
	["FIRST INDEX CLEAR",
	"message rafuron/music/hard_new_new/stage_5_start.mp3",//STAGE 5 FIRST MUSIC
    "message rafuron/music/hard_new_new/stage_5_top_1.mp3",//STAGE 5 SECOND MUSIC
	"message rafuron/music/hard_new_new/stage_5_top_2.mp3",//STAGE 5 TEAM WIN // INDEX 3 //PlayMusic(14);
	"message rafuron/music/hard_new_new/stage_5_end_bad.mp3",//STAGE 5 END BAD // INDEX 4 //PlayMusic(16);
	"message rafuron/music/hard_new_new/stage_5_end_good_1.mp3",//STAGE 5 CORE DESTROYED // INDEX 5 //PlayMusic(17);
	"message rafuron/music/hard_new_new/stage_5_end_good_2.mp3",//STAGE 5 GOOD END // INDEX 6 //PlayMusic(18);
	//STAGE 10 EXTREME
	"message rafuron/music/extreme_new_new/e_stage_5_start.mp3",//STAGE 10 FIRST MUSIC //INDEX 7
    "message rafuron/music/extreme_new_new/e_stage_5_top.mp3",//STAGE 10 SECOND MUSIC //INDEX 8
	"message rafuron/music/extreme_new_new/e_stage_5_top2.mp3",//STAGE 10 TEAM WIN // INDEX 9 //PlayMusic(14);
	"message rafuron/music/extreme_new_new/e_stage_5_end_bad.mp3",//STAGE 10 END BAD // INDEX 10 //PlayMusic(16);
	"message rafuron/music/extreme_new_new/e_stage_5_end_good_1.mp3",//STAGE 10 CORE DESTROYED // INDEX 11 //PlayMusic(17);
	"message rafuron/music/extreme_new_new/e_stage_5_end_good_2.mp3"]//STAGE 10 GOOD END // INDEX 12 //PlayMusic(18);
]

CounTextWarmUp <- -1;

WARMUP_TEXT <- [
	"团队合作是通关此地图的关键!",//INDEX 0
	"最终关卡的体验将完全取决于\n前面所有关卡所收集的进度!",//INDEX 1
	"你的任何行动将会改变下一轮",//INDEX 2
	"开启四个发电机!\n激活任何一个僵尸将会大规模传送!",//INDEX 3
	"想想你的行为!\n加油!\n在某些关卡需要一定技巧或者牺牲!",//INDEX 4
	"没有看不见的墙!\n你可以去你任何想去的地方!",//INDEX 5
	"想怎么玩就怎么玩\n但别忘了倒计时\n核弹不会等你的!",//INDEX 6
	"想要解锁极限模式\n但首先需要完成正常模式!",//INDEX 7
	"僵尸提示:\n地形和环境将是你的盟友.\n总是不止有一条路!",//INDEX 8
	"人类:\n前面四个关卡中的每一个关卡都有一台发电机.\n您的目标就是开启发电机!",//INDEX 9
	"僵尸神器:\n某些僵尸神器功能非常强大\n但是需要正确使用技巧!",//INDEX 10
	"在大多数情况下爆炸都是可以对双方造成伤害!\n小心!",//INDEX 11
	"一枚全球核弹将在9分钟后消灭所有生物",//INDEX 12
	"甚至一个人都可以改变世界!\n未来并不是一成不变的!",//INDEX 13
	"装满尸体的垃圾桶将会是\n僵尸的重生点!"//INDEX 14
]

function WarmUpMessage()
{
	local TIME_WARMTEXT = 0.00;
	local WarmUpTextEnt = Entities.FindByName(null, "Global_GameText_Stage_Start");
	while(CounTextWarmUp < WARMUP_TEXT.len()-1)
	{
		CounTextWarmUp++;
		EntFireByHandle(WarmUpTextEnt,"SetText",WARMUP_TEXT[CounTextWarmUp],0.00,null,null);
		EntFireByHandle(WarmUpTextEnt,"Display","",TIME_WARMTEXT,null,null);
		EntFireByHandle(self,"RunScriptCode","WarmUpMessage();",TIME_WARMTEXT+4.00,null,null);
		TIME_WARMTEXT += 4.00;
		return;
	}
}

function TeleportTo()
{
	try
	{
		if(SpawnTp)
		{
			activator.__KeyValueFromString("origin", ""+TELEPORT_PLAYER[GetMapLevel()][TeleportCount].x+" "+TELEPORT_PLAYER[GetMapLevel()][TeleportCount].y+" "+TELEPORT_PLAYER[GetMapLevel()][TeleportCount].z);
			TeleportCount++;
			if(TeleportCount >= 64){TeleportCount = 0;}
		}
		else
		{
			activator.__KeyValueFromString("origin", ""+AFK_TELEPORT[GetMapLevel()][AfkTp].x+" "+AFK_TELEPORT[GetMapLevel()][AfkTp].y+" "+AFK_TELEPORT[GetMapLevel()][AfkTp].z);
		}
	}
	catch(error)
	{
		return;
	}
}

function ChangeTp()
{
	if(SpawnTp){SpawnTp = false;}
	if(STAGE > 0 && !SpawnTp){AfkTp++;}
}

function GetMapLevel()
{
	if(STAGE <= 5){return STAGE;}
	else if(STAGE == 6){return 1;}
	else if(STAGE == 7){return 2;}
	else if(STAGE == 8){return 3;}
	else if(STAGE == 9){return 4;}
	else if(STAGE == 10){return 5;}
	else if(STAGE == 11){return 0;}
}

function MapStart()
{
	Zone_Kill = Entities.FindByName(null, "player_kill");
	STAGE_CHANGE = true;
	SendToConsoleServer("sv_disable_radar 1");
	SAVESTAGE = STAGE;
	TeleportCount = 0;
    MUSIC_COUNT = 0;
	SetPlayerScript();
	CheckEventsCompleted();
	RestartParticle();
	Time = 540.00;
    End = true;
	SpawnTp = true;
    AfkTp = 0;
	CounTextWarmUp = -1;
	if(TEMP_EVENTS_ARRAY.len() > 0){TEMP_EVENTS_ARRAY.clear();}
	if(PlayersArr.len() > 0){PlayersArr.clear();}
	//stage0 热身关尸变比64
	//stage1-4  尸变比7
	//stage5、10 尸变比2
	//stage6-9 尸变比4
	if(STAGE >= 6 && STAGE < 11)
	{
		EXTREME = true;
        EntFire("stages_clouds","AddOutput","rendercolor 250 100 100",1.00,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 4",3.00,null);
	}
	EntFire("tonemap","SetAutoExposureMin",".7",0.00,null);
    EntFire("tonemap","SetAutoExposureMax",".7",0.00,null);
	EntFire("tonemap","SetBloomExponent",".70",0.00,null);
	EntFire("tonemap","SetTonemapRate",".1",0.00,null);
	EntFire("tonemap","SetBloomScale","2.2",0.00,null);
	EntFire("tonemap","SetTonemapPercentTarget","75",0.00,null);
	EntFire("tonemap","SetTonemapPercentBrightPixels","2",0.00,null);
	EntFire("Human_Item_Mech_Cam","Disable","",0.00,null);
	EntFire("Map_End_Camera","Disable","",0.00,null);
	EntFire("v_cam1","Disable","",0.00,null);
	EntFire("Zombie_Item_Boss_Cam","Disable","",0.00,null);
	if(EXTREME && STAGE == 6 && MUSIC_COUNT == 0){MUSIC_COUNT = 2;}
	if(EXTREME && STAGE == 7 && MUSIC_COUNT == 0){MUSIC_COUNT = 2;}
	if(EXTREME && STAGE == 8 && MUSIC_COUNT == 0){MUSIC_COUNT = 3;}
	if(EXTREME && STAGE == 9 && MUSIC_COUNT == 0){MUSIC_COUNT = 3;}
	if(EXTREME && STAGE == 10 && MUSIC_COUNT == 0){MUSIC_COUNT = 6;}
	if(STAGE != 0 && STAGE <= 10)
	{
        StartTimer();
		EntFireByHandle(self, "RunScriptCode", "PlayMusic();", 1.00, null, null);
	}
    if(STAGE == 0)
	{
        EntFire("Global_GameText_Announcement","AddOutput","message 在实验过程中,警卫保卫该区域 ",25.00,null);
		EntFire("Global_GameText_Announcement","AddOutput","message 警告!!核心不稳定,请马上离开实验房间 ",35.00,null);
		EntFire("Global_GameText_Announcement","AddOutput","message 红色警报,开始隔离实验房间 ",45.00,null);
		EntFire("Global_GameText_Announcement","AddOutput","message 黑色警报,神经毒气开始释放 ",81.00,null);
		EntFireByHandle(self, "RunScriptCode", "KillAll();", 85.00, null, null);
		EntFire("stage_0_zombie_boss","Kill","",25.00,null);
		EntFire("stage_0_trigger_detect_zombification","Enable","",25.00,null);
		EntFire("stage_0_trigger_detect_zombification_human_protection","Kill","",25.00,null);
		EntFire("stage_0_trigger_detect_zombification_human_protection_disable","Enable","",26.00,null);
		EntFire("stage_0_tube_boss_wall","Toggle","",44.00,null);
		EntFire("Stage_0_end_nuke","Fade","",81.00,null);
		EntFire("stage_0_alarm_sound","PlaySound","",30.00,null);
		EntFire("stage_0_alarm_sound_emergency","PlaySound","",45.00,null);
		EntFire("stage_0_red_light","TurnOn","",45.00,null);
		EntFire("stage_0_breakable_glas","Break","",44.00,null);
		EntFire("stage_0_emergency_doors","Close","",45.00,null);
		EntFire("stage_0_emergency_doors_2","Open","",45.00,null);
		EntFire("Zombie_Item_Boss_Normal_Transformation","Kill","",0.00,null);
		EntFire("stage_0_breakable_glas","FireUser1","",34.00,null);
		EntFire("Global_GameText_Announcement","FireUser3","",25.00,null);
		EntFire("Global_GameText_Announcement","FireUser3","",35.00,null);
		EntFire("Global_GameText_Announcement","FireUser3","",45.00,null);
		EntFire("Global_GameText_Announcement","FireUser3","",81.00,null);
		EntFire("stage_0_trigger_detect_zombification_human_protection","Enable","",0.00,null);
		EntFireByHandle(self, "RunScriptCode", "WarmUpMessage();", 1.00, null, null);
		EntFire("stage_0_music","PlaySound","",11.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- 热身回合 --",2.00,null);
		EntFire("music_stage_0","PlaySound","",0.00,null);
		EntFire("Stage_0_Music_Selector","Kill","",30.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("STAGE_5_WORLD","Kill","",0.00,null);
		EntFire("Event_Status_Stage_*","FireUser1","",0.50,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 64",6.00,null);
		EntFire("console","Command","zr_infect_mzombie_respawn 1",6.00,null);
		EntFire("console","Command","zr_mzombie_respawn 1",6.00,null);
		EntFire("Extreme_stage_0","Enable","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
        EntFireByHandle(self, "RunScriptCode", "STAGE = 1;", 30.00, null, null);
	}
	else if(STAGE == 1)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 1 :  致命旅途 --",2.00,null);
		EntFire("Spawn_Tank_Teleport","Teleport","",1.00,null);
		EntFire("stages_1_skybox_mountains","Enable","",0.50,null);
		EntFire("Mode_Extreme_Counter","Enable","",0.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser1","",0.00,null);
		EntFire("STAGE_5_WORLD","Kill","",0.50,null);
		EntFire("stage1_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 1008 -10280 -12685.9",0.00,null);
		EntFire("Extreme_stage_1","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("stage_x_door","Disable","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 0",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("s1_itemspawns_relay","Trigger","",2.00,null);
	}
	else if(STAGE == 2)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 2 : 被遗忘的工厂 --",2.00,null);
		EntFire("Stage_Start_Stage_2_Spawn","Trigger","",0.00,null);
		EntFire("Weapon_Mutator_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Thundergun_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Inmunizer_Template","FireUser1","",2.00,null);
		EntFire("Weapon_PortalGun_Template","FireUser1","",2.00,null);
		EntFire("Weapon_ZeroGravity_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Turret_Template","FireUser1","",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser2","",0.00,null);
		EntFire("stage2_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 4269.44 -474.46 -7198.04",0.00,null);
		EntFire("Extreme_stage_2","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 0",12.00,null);
		EntFire("correction","Enable","",3.00,null);
	}
	else if(STAGE == 3)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 3 : 死亡实验室 --",2.00,null);
		EntFire("stage_x_boss_pipe","FireUser1","",0.00,null);
		EntFire("Spawn_Explosive_Barrel_Spawner","FireUser1","",0.00,null);
		EntFire("stage_x_boss_candidate","Enable","",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("Zombie_Item_Boss_Normal_Model","TurnOff","",0.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser3","",0.00,null);
		EntFire("stage3_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 2449.46 -10248 1489.96",0.00,null);
		EntFire("Extreme_stage_3","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("stage_0_thanks_too","Kill","",0.00,null);
		EntFire("stage_target_helper","AddOutput","origin 2721 6912 -656",2.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 0",12.00,null);
		EntFire("correction","Enable","",3.00,null);
	}
	else if(STAGE == 4)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 4 : 最后的防线 --",2.00,null);
		EntFire("Global_Sound_War_Loop","PlaySound","",2.00,null);
		EntFire("Global_Sound_Siren","PlaySound","",3.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser4","",0.00,null);
		EntFire("stage4_things","ForceSpawn","",1.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("Spawn_Phy_Car_Generator_Rotating","Kill","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 0",12.00,null);
		EntFire("correction","Enable","",3.00,null);
	}
	else if(STAGE == 5)
	{
		EntFireByHandle(self, "RunScriptCode", "SetMaxHealthZm();", 30.00, null, null);
        EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 5 : AN END. ONCE AND FOR ALL --",2.00,null);
		EntFire("fade_nuke","AddOutput","duration 25",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_clouds","AddOutput","rendercolor 250 200 150",1.00,null);
		EntFire("stage5_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 4556.32 -4602.26 12506.2",0.00,null);
		EntFire("Human_Item_Mech_Teleportation","Kill","",0.00,null);
		EntFire("Extreme_stage_5","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 2",12.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 0",12.00,null);
		EntFire("correction","Enable","",3.00,null);
        EntFire("console","Command","zr_class_modify zombies health 900",0.00,null);
		EntFire("console","Command","zr_class_reload @all",0.00,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 2",1.00,null);
	}
	else if(STAGE == 6)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 1 :  死亡轮回 --",2.00,null);
		EntFire("Spawn_Tank_Teleport","Teleport","",1.00,null);
		EntFire("stages_1_skybox_mountains","Enable","",3.50,null);
		EntFire("Mode_Extreme_Counter","Enable","",0.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser1","",0.00,null);
		EntFire("STAGE_5_WORLD","Kill","",0.50,null);
		EntFire("stage1_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 1008 -10280 -12685.9",0.00,null);
		EntFire("Extreme_stage_1","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("stage_x_door","Disable","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("s1_itemspawns_relay","Trigger","",2.00,null);
		EntFire("stage_x_breakable_wall_brush_2","Break","",11.50,null);
		EntFire("stage_x_breakable_wall_brush_1","Break","",11.50,null);
		EntFire("stage_1_base_button_4","AddOutput","OnPressed stage_1_base_tower_2:SetAnimation:Break:15:1",5.00,null);
		EntFire("Stage_x_Spawn_Tank_Teleport_2","Teleport","",2.00,null);
		EntFire("Zombie_Item_Jumper_Template","AddOutput","origin -3008 -1632 -13415.8",0.00,null);
		EntFire("Zombie_Item_Summoner_Template","AddOutput","origin 2576 711.95 -13656",0.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","AddOutput","origin 7840 2885 -13660",0.00,null);
		EntFire("Zombie_Item_Shockwave_Template","AddOutput","origin 4946.86 -10594.4 -12904",0.00,null);
		EntFire("Zombie_Item_Shockwave_Template","ForceSpawn","",1.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","ForceSpawn","",1.00,null);
		EntFire("Zombie_Item_Summoner_Template","ForceSpawn","",1.00,null);
		EntFire("Zombie_Item_Jumper_Template","ForceSpawn","",1.00,null);
		EntFire("stage_1_wall_extreme","Toggle","",3.00,null);
		EntFire("stage_1_wall_extreme_model","Enable","",3.00,null);
		EntFire("stage_1_wall_extreme_model","EnableCollision","",3.00,null);
		EntFire("stage_1_wall_extreme_model_disable","Disable","",3.00,null);
		EntFire("stage_1_wall_extreme_model_disable","DisableCollision","",3.00,null);
		EntFire("stage_1_wall_extreme_kill","Disable","",3.00,null);
		EntFire("stage_1_wall_extreme_kill","DisableCollision","",3.00,null);
		EntFire("stage_x_breakable_wall_brush_1","Kill","",100.00,null);
		EntFire("stage_x_breakable_wall_brush_2","Kill","",100.00,null);
		EntFire("correction2","Enable","",3.00,null);
	}
	else if(STAGE == 7)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 2 : 重返神秘工厂 --",2.00,null);
		EntFire("Stage_Start_Stage_2_Spawn","Trigger","",0.00,null);
		EntFire("Weapon_Mutator_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Thundergun_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Inmunizer_Template","FireUser1","",2.00,null);
		EntFire("Weapon_PortalGun_Template","FireUser1","",2.00,null);
		EntFire("Weapon_ZeroGravity_Template","FireUser1","",2.00,null);
		EntFire("Weapon_Turret_Template","FireUser1","",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser2","",0.00,null);
		EntFire("stage2_things","ForceSpawn","",1.00,null);
		EntFire("stage_2_mountains","FireUser4","",2.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 4269.44 -474.46 -7198.04",0.00,null);
		EntFire("Extreme_stage_2","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("stage_2_btn_main","AddOutput","OnPressed stage_2_open_random_relay:PickRandom::8:1",5.00,null);
		EntFire("stage_2_minifier_door_brush","Close","",5.00,null);
		EntFire("stage_2_flame","Kill","",5.00,null);
		EntFire("stage_flame_particle","Kill","",5.00,null);
		EntFire("stage_2_extreme_wall","Toggle","",5.00,null);
		EntFire("stage_2_teleport_2","AddOutput","OnStartTouch stage_2_conveyor_reverse:Press::0:1",5.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","AddOutput","origin 4232 -9360.7 -7224",0.00,null);
		EntFire("Zombie_Item_Summoner_Template","AddOutput","origin 4848 -9360.7 -7224",0.00,null);
		EntFire("Zombie_Item_Predator_Template","AddOutput","origin 5911.24 1054.95 -7386",0.00,null);
		EntFire("Zombie_Item_Alma_Template","AddOutput","origin 915.11 2508.08 -7160",0.00,null);
		EntFire("Zombie_Item_Alma_Template","ForceSpawn","",0.01,null);
		EntFire("Zombie_Item_Predator_Template","ForceSpawn","",0.01,null);
		EntFire("Zombie_Item_Summoner_Template","ForceSpawn","",0.01,null);
		EntFire("Zombie_Item_Vortigaunt_Template","ForceSpawn","",0.01,null);
		EntFire("correction2","Enable","",3.00,null);
	}
	else if(STAGE == 8)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 3 : 死亡实验室 --",2.00,null);
		EntFire("stage_x_boss_pipe","FireUser1","",0.00,null);
		EntFire("Spawn_Explosive_Barrel_Spawner","FireUser1","",0.00,null);
		EntFire("stage_x_boss_candidate","Enable","",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("Zombie_Item_Boss_Normal_Model","TurnOff","",0.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser3","",0.00,null);
		EntFire("stage3_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 2449.46 -10248 1489.96",0.00,null);
		EntFire("Extreme_stage_3","Enable","",2.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("stage_0_thanks_too","Kill","",0.00,null);
		EntFire("stage_target_helper","AddOutput","origin 2721 6912 -656",2.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("stage_3_spawn_timer_funnels","AddOutput","UpperRandomBound 2",5.00,null);
		EntFire("stage_3_spawn_timer_funnels","AddOutput","LowerRandomBound 1",5.00,null);
		EntFire("stage_x_tube_elevator_1_button","Kill","",5.00,null);
		EntFire("stage_x_tube_elevator_1","Kill","",5.00,null);
		EntFire("stage_x_tube_elevator_1_button1","Kill","",5.00,null);
		EntFire("stage_x_tube_elevator_2","Kill","",5.00,null);
		EntFire("stage_3_breakables","Break","",20.50,null);
		EntFire("stage_x_extreme_ladder","Enable","",5.00,null);
		EntFire("stage_3_extreme_trigger","Disable","",5.00,null);
		EntFire("stage_3_glass_model_clean_*","TurnOff","",20.00,null);
		EntFire("stage_3_glass_model_br_*","TurnOn","",20.00,null);
		EntFire("stage_3_door_2","Kill","",5.00,null);
		EntFire("stage_3_weapons_button_3","Kill","",5.00,null);
		EntFire("stage_3_corridor_door_1","Kill","",5.00,null);
		EntFire("stage_3_corridor_door_2","Kill","",5.00,null);
		EntFire("stage_3_wall_extreme_to_disable","Toggle","",2.00,null);
		EntFire("stage_target_helper","AddOutput","origin 0 0 0",4.00,null);
		EntFire("correction2","Enable","",3.00,null);
	}
	else if(STAGE == 9)
	{
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 7",1.00,null);
		EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 4 : 背水一战 --",2.00,null);
		EntFire("Global_Sound_War_Loop","PlaySound","",2.00,null);
		EntFire("Global_Sound_Siren","PlaySound","",3.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_skybox_mountains_movelinear","FireUser4","",0.00,null);
		EntFire("stage4_things","ForceSpawn","",1.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("Spawn_Phy_Car_Generator_Rotating","Kill","",0.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("stage_4_extreme_walls","Toggle","",5.00,null);
		EntFire("stage_x_extreme_walls_brush","Enable","",5.00,null);
		EntFire("Vehicle_Cannon_Model*","Kill","",5.00,null);
		EntFire("Vehicle_Cannon_Button_*","Kill","",5.00,null);
		EntFire("stage_4_glass_1","Break","",5.00,null);
		EntFire("stage_4_glass_2","Break","",5.00,null);
		EntFire("stage_4_glass_3","Break","",5.00,null);
		EntFire("stage_4_glass_4","Break","",5.00,null);
		EntFire("stage_x_end_bridge_1","Open","",5.00,null);
		EntFire("Zombie_Item_Tank_Spawn","AddOutput","origin 6210.22 7529.37 3371",0.00,null);
		EntFire("Zombie_Item_Jumper_Template","AddOutput","origin 4002.84 6253.26 3371",0.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","AddOutput","origin 2999.58 323.83 3371",0.00,null);
		EntFire("Zombie_Item_Freezer_Template","AddOutput","origin 6051.19 2113.72 3371",0.00,null);
		EntFire("Zombie_Item_Predator_Template","AddOutput","origin 10280 -1393.96 3400",0.00,null);
		EntFire("Zombie_Item_Shockwave_Template","AddOutput","origin 9269.86 1169.37 3371 ",0.00,null);
		EntFire("Zombie_Item_Shockwave_Template","ForceSpawn","",22.00,null);
		EntFire("Zombie_Item_Predator_Template","ForceSpawn","",22.00,null);
		EntFire("Zombie_Item_Freezer_Template","ForceSpawn","",22.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","ForceSpawn","",22.00,null);
		EntFire("Zombie_Item_Jumper_Template","ForceSpawn","",22.00,null);
		EntFire("Zombie_Item_Tank_Spawn","ForceSpawn","",22.00,null);
		EntFire("stage_x_end_bridge_3_physbox","SetHealth","999999",0.00,null);
		EntFire("stage_x_end_bridge_2_physbox","SetHealth","999999",0.00,null);
		EntFire("correction2","Enable","",3.00,null);
	}
	else if(STAGE == 10)
	{
		EntFireByHandle(self, "RunScriptCode", "SetMaxHealthZm();", 30.00, null, null);
        EntFire("Global_GameText_Stage_Start","AddOutput","message -- STAGE 5 : AN END. ONCE AND FOR ALL --",2.00,null);
		EntFire("fade_nuke","AddOutput","duration 25",0.00,null);
		EntFire("Global_GameText_Stage_Start","FireUser1","",2.00,null);
		EntFire("stages_clouds","AddOutput","rendercolor 250 200 150",1.00,null);
		EntFire("stage5_things","ForceSpawn","",1.00,null);
		EntFire("spawn_explosion_nuke_particle","AddOutput","origin 4556.32 -4602.26 12506.2",0.00,null);
		EntFire("Human_Item_Mech_Teleportation","Kill","",0.00,null);
		EntFire("Extreme_stage_5","Enable","",0.00,null);
		EntFire("Supreme_Trigger","Kill","",0.00,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 2",12.00,null);
		EntFire("console","Command","sv_enablebunnyhopping 1",12.00,null);
		EntFire("correction","Enable","",3.00,null);
		EntFire("stage_5_top_door_south_east","AddOutput","OnOpen stage_5_top_door_north_east:Open::0:1",5.00,null);
		EntFire("stage_5_top_door_north_west","AddOutput","OnOpen stage_5_top_door_south_west:Open::0:1",5.00,null);
		EntFire("stage_5_extreme_relay","Enable","",5.00,null);
		EntFire("correction2","Enable","",3.00,null);
		EntFire("console","Command","zr_class_modify zombies health 900",0.00,null);
		EntFire("console","Command","zr_class_reload @all",0.00,null);
		EntFire("console","Command","sm_cvar zr_infect_mzombie_ratio 2",1.00,null);
	}
	else if(STAGE == 11)
	{
		EntFire("Supreme_Fade","Fade","",7.50,null);
		EntFire("stage_0_alarm_sound_emergency","Kill","",0.00,null);
		EntFire("stage_0_supreme_music","PlaySound","",3.00,null);
		EntFire("Supreme_End_Wall_1","Toggle","",11.00,null);
		EntFire("Supreme_Fade","Fade","",16.50,null);
		EntFire("Supreme_Fade","Fade","",26.50,null);
		EntFire("Map_End_Camera","Enable","",12.00,null);
		EntFire("Supreme_End_Wall_1","Toggle","",21.00,null);
		EntFire("Supreme_End_Wall_2","Toggle","",21.00,null);
		EntFire("Supreme_End_Wall_3","Toggle","",31.00,null);
		EntFire("Supreme_End_Wall_2","Toggle","",31.00,null);
		EntFire("stage_0_alarm_sound","Kill","",0.00,null);
		EntFire("Supreme_Fade","Fade","",36.50,null);
		EntFire("Map_End_Camera","Disable","",42.00,null);
		EntFire("stage_0_music","StopSound","",3.00,null);
		EntFire("stage_0_music","Kill","",3.02,null);
		EntFire("stage_0_music","Volume","0",3.00,null);
		EntFire("tonemap","SetAutoExposureMin",".3",3.00,null);
        EntFire("tonemap","SetAutoExposureMax",".3",3.00,null);
	    EntFire("tonemap","SetBloomScale","1",3.00,null);
	}
	EntFire("v_model1","DisableMotion","",6.00,null);
}

function RestartParticle()
{
	EntFire("stage_flame_particle","Start","",5.00,null);
    EntFire("Fire_1","StartFire","",3.00,null);
}

function MessageStage5Hud(mes)
{
	if(mes == 1)
	{
        ScriptPrintMessageCenterAll(" 人类: 保护核心直到充能完毕 \n 僵尸: 冲入核心并破坏它 ");
	}
	if(mes == 2)
	{
        ScriptPrintMessageCenterAll(" 快上电梯 ");
	}
	if(mes == 3)
	{
        ScriptPrintMessageCenterAll(" 快坐直升机逃离 ");
	}
	if(mes == 4)
	{
        ScriptPrintMessageCenterAll(" 基地内的剩余人类请马上前往北门防守进犯的僵尸直到4座桥连接中央核心 ");
	}
}



function CheckEventsCompleted()
{
	if(EVENT_ARRAY[0][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[0][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_cargo_heli_track_train","AddOutput","OnUser1 !self:FireUser3::0:1",2.00,null);
	}
	if(EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 4 || EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 9)
	{
		EntFire("stage_x_end_rescue_helicopter","Enable","",2.00,null);
        EntFire("stage_nuke_inmuzer1","Kill","",3.00,null);
	}
	// else if(EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[1][1] == "COMPLETED" && STAGE == 10)
	// {
	// 	EntFire("Spawn_Tank_Teleport_Stage_5","Teleport","",2.00,null);
	// }
	if(EVENT_ARRAY[2][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[2][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_top_door_to_east","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[3][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[3][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_cargo_heli_track_train","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
		EntFire("stage_x_helicopter_tracktrain","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[4][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[4][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_lower_door_relay_reinforcements_5","Enable","",2.00,null);
	}
	if(EVENT_ARRAY[5][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[5][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_relay","Enable","",2.00,null);
        EntFire("stage_x2_escape_vehicle","FireUser2","",2.00,null);
	}
	if(EVENT_ARRAY[6][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[6][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_lower_door_relay_reinforcements_7","Enable","",2.00,null);
	}
	if(EVENT_ARRAY[7][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[7][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp1","AddOutput","EntityTemplate Weapon_PortalGun_Template",2.00,null);
	}
	if(EVENT_ARRAY[8][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[8][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp2","AddOutput","EntityTemplate Weapon_Thundergun_Template",2.00,null);
	}
	if(EVENT_ARRAY[9][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[9][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp3","AddOutput","EntityTemplate Weapon_Inmunizer_Template",2.00,null);
	}
	if(EVENT_ARRAY[10][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[10][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp4","AddOutput","EntityTemplate Weapon_Mutator_Template",2.00,null);
	}
	if(EVENT_ARRAY[11][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[11][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp5","AddOutput","EntityTemplate Weapon_ZeroGravity_Template",2.00,null);
	}
	if(EVENT_ARRAY[12][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[12][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_reward_vehicle_with_weapons_wp6","AddOutput","EntityTemplate Weapon_Turret_Template",2.00,null);
	}
	if(EVENT_ARRAY[13][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[13][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_top_door_to_south","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[14][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[14][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_top_door_to_north","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[15][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[15][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Summoner_Template","AddOutput","origin 5327 2006 11737",0.00,null);
		EntFire("Zombie_Item_Summoner_Template","ForceSpawn","",0.50,null);
	}
	if(EVENT_ARRAY[16][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[16][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Jumper_Template","AddOutput","origin 6295.77 4737.17 10780",30.00,null);
		EntFire("Zombie_Item_Jumper_Template","ForceSpawn","",30.50,null);
	}
	if(EVENT_ARRAY[17][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[17][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Alma_Template","AddOutput","origin 4260.98 3755.62 10780",0.00,null);
		EntFire("Zombie_Item_Alma_Template","ForceSpawn","",0.50,null);
	}
	if(EVENT_ARRAY[18][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[18][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Vortigaunt_Template","AddOutput","origin 5005.31 3296.61 10780",0.00,null);
		EntFire("Zombie_Item_Vortigaunt_Template","ForceSpawn","",0.50,null);
	}
	if(EVENT_ARRAY[19][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[19][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Antlion_Template","AddOutput","origin 530 2687 11331",40.00,null);
		EntFire("Zombie_Item_Antlion_Template","ForceSpawn","",40.50,null);
	}
	if(EVENT_ARRAY[20][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[20][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Shockwave_Template","AddOutput","origin 2655.39 4574.21 10780",40.00,null);
		EntFire("Zombie_Item_Shockwave_Template","ForceSpawn","",40.50,null);
	}
	if(EVENT_ARRAY[21][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[21][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Zombie_Item_Predator_Template","AddOutput","origin 6981 278 11948",50.00,null);
		EntFire("Zombie_Item_Predator_Template","ForceSpawn","",50.50,null);
	}
	if(EVENT_ARRAY[22][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[22][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_reward_stage_3_truck_*","Enable","",2.00,null);
		EntFire("stage_5_reward_stage_3_truck_*","EnableCollision","",2.00,null);
		EntFire("Weapon_Extra_Unlimmited_Template","AddOutput","origin 3560.83 -2181.05 9951.18",2.00,null);
		EntFire("Weapon_Extra_Unlimmited_Template","ForceSpawn","",2.05,null);
		EntFire("Weapon_Extra_Inmunizer_Template","AddOutput","origin 3672 -2120 9951.18",2.00,null);
		EntFire("Weapon_Extra_Inmunizer_Template","ForceSpawn","",2.05,null);
	}
	if(EVENT_ARRAY[23][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[23][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_lower_door_relay_reinforcements_1","Enable","",2.00,null);
	}
	if(EVENT_ARRAY[24][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[24][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_top_door_to_west","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[25][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[25][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_5_lower_ultralisk","Disable","",2.00,null);
	}
	if(EVENT_ARRAY[26][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[26][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("pidaras_temp","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[27][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[27][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("stage_x_part_1_maker_apache","AddOutput","OnUser1 !self:FireUser2::0:1",2.00,null);
	}
	if(EVENT_ARRAY[28][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[28][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",2.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",30.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",32.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",34.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",36.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",38.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",40.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",42.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",44.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",46.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",48.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",50.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",52.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",54.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",56.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",58.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",60.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",62.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",64.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",66.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",68.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",70.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",80.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",90.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",100.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",110.00,null);
		EntFire("Human_Item_Mech_Knife","AddOutput","origin 3952 -1536 9890",120.00,null);
		EntFire("Human_Item_Mech_Model","SetAnimation","idle",2.00,null);
		EntFire("Human_Item_Mech_Model","SetDefaultAnimation","idle",2.00,null);
	}
	if(EVENT_ARRAY[29][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[29][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Human_Item_Mech_Logic","AddOutput","OnCase02 !self:FireUser2::0.01:0",2.00,null);
	}
	if(EVENT_ARRAY[30][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[30][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Human_Item_Mech_Logic","AddOutput","OnCase03 !self:FireUser3::0.01:0",2.10,null);
	}
	if(EVENT_ARRAY[31][1] == "COMPLETED" && STAGE == 5 || EVENT_ARRAY[31][1] == "COMPLETED" && STAGE == 10)
	{
		EntFire("Human_Item_Mech_Logic","AddOutput","OnCase04 !self:FireUser4::0.01:0",2.20,null);
	}
}

function SetStage(stg)
{
	if(stg == 1)
	{
        if(EXTREME){STAGE = 6;}
		else if(!EXTREME){STAGE = 1;}
	}
	else if(stg == 2)
	{
		if(EXTREME){STAGE = 7;}
		else if(!EXTREME){STAGE = 2;}
	}
	else if(stg == 3)
	{
        if(EXTREME){STAGE = 8;}
	    else if(!EXTREME){STAGE = 3;}
	}
	else if(stg == 4)
	{
        if(EXTREME){STAGE = 9;}
	    else if(!EXTREME){STAGE = 4;}
	}
	else if(stg == 5)
	{
		if(EXTREME){STAGE = 10;}
	    else if(!EXTREME){STAGE = 5;}
	}
	ScriptPrintMessageChatAll("++Stage "+STAGE+" Set++");
}

function StopMusic()
{
	if(Music && mp == 0)
	{
		Music = false;
		mp++;
		EntFire("Global_GameText_Announcement","SetText","** 下回合地图音乐已禁用 **",0.00,null);
	}
	else if(!Music)
	{
		Music = true;
		MaxVolume = 10;
		mp++;
		EntFire("Global_GameText_Announcement","SetText","** 下回合地图音乐已启用 **",0.00,null);
	}
	else if(Music && mp == 2)
	{
		mp = 0;
	    MaxVolume = 2;
		EntFire("Global_GameText_Announcement","SetText","** 地图音乐音量降低至 2 **",0.00,null);
	}
}

function SetExtreme()
{
	if(EXTREME)
	{
		EXTREME = false;
		EntFire("Global_GameText_Announcement","SetText","** 极限模式禁用 **",0.00,null);
	}
	else if(!EXTREME)
	{
		EXTREME = true;
		EntFire("Global_GameText_Announcement","SetText","** 极限模式已启用 **",0.00,null);
	}
}

function GameTextMisc(n)
{
	if(n == 0)
	{
		EntFire("Global_GameText_Announcement","SetText"," 艾利克斯死了\n 在援军到来之前生存下来 ",0.00,null);
	}
	if(n == 1)
	{
		EntFire("Global_GameText_Announcement","SetText"," 僵尸破坏了核弹保护罩\n 即将失效! ",0.00,null);
	}
	if(n == 2)
	{
		EntFire("Global_GameText_Announcement","SetText"," 检测到基地内泄露了丧尸病毒\n 开始隔离清除中 ",0.00,null);
	}
	if(n == 3)
	{
		EntFire("Global_GameText_Announcement","SetText"," 感染源已清除!\n 隔离解除! ",0.00,null);
	}
	if(n == 4)
	{
		EntFire("Global_GameText_Announcement","SetText"," 增援部队到了!\n 快远离正门 ",0.00,null);
	}
	if(n == 5)
	{
		EntFire("Global_GameText_Announcement","SetText"," 所有人类已经集合\n 现在乘坐电梯\n 去面对人类命运的终焉! ",0.00,null);
	}
	if(n == 6)
	{
		EntFire("Global_GameText_Announcement","SetText"," 吊机已经成功启动\n 闸门将在35秒后自动开启 ",0.00,null);
	}
	if(n == 7)
	{
		EntFire("Global_GameText_Announcement","SetText"," 没有时间缅怀那些断后的英雄了\n 快上电梯! ",0.00,null);
	}
	if(n == 8)
	{
		EntFire("Global_GameText_Announcement","SetText"," 快使用能量柱连接三个核心发电机! ",0.00,null);
	}
	if(n == 9)
	{
		EntFire("Global_GameText_Announcement","SetText"," 世界的命运掌握在你手中\n **\n 你会选择什么?\n (你只有20秒的选择时间) ",0.00,null);
	}
	if(n == 10)
	{
		EntFire("Global_GameText_Announcement","SetText"," 这道门需要解锁\n **\n 门将在10秒后打开 ",0.00,null);
	}
	if(n == 11)
	{
		EntFire("Global_GameText_Announcement","SetText"," 核心已被激活\n 传送将在5秒后启动\n 准备撤退! ",0.00,null);
	}
	if(n == 12)
	{
		EntFire("Global_GameText_Announcement","SetText"," 这道门需要解锁\n **\n 门将在15秒后打开 ",0.00,null);
	}
	if(n == 14)
	{
		EntFire("Global_GameText_Announcement","SetText"," 检测到丧尸存在\n **\n 门将延迟打开 ",0.00,null);
	}
	if(n == 15)
	{
		EntFire("Global_GameText_Announcement","SetText"," 感染源消失\n **\n 门已经打开 ",0.00,null);
	}
	if(n == 16)
	{
		EntFire("Global_GameText_Announcement","SetText"," 我们总算到了\n 集合!\n 现在赶紧去中央大门! ",0.00,null);
	}
	if(n == 17)
	{
		EntFire("Global_GameText_Announcement","SetText"," 现在我们就是这里最后的防线!\n 构筑阵地\n 拿起你的武器消灭僵尸和雷兽! ",0.00,null);
	}
	if(n == 18)
	{
		EntFire("Global_GameText_Announcement","SetText"," 整个区域快要爆炸了\n 请务必在80秒内打开发电机 ",0.00,null);
	}
	if(n == 19)
	{
		EntFire("Global_GameText_Announcement","SetText"," 发电机已经满功率运行\n 15秒后充能完毕! ",0.00,null);
	}
	if(n == 20)
	{
		EntFire("Global_GameText_Announcement","SetText"," 就是这样\n做得很好\n 现在赶紧离开这座基地 ",0.00,null);
	}
	if(n == 21)
	{
		EntFire("Global_GameText_Announcement","SetText"," 核心已经弹出\n **\n 需要有人手动启动开关 ",0.00,null);
	}
	if(n == 22)
	{
		EntFire("Global_GameText_Announcement","SetText"," 南门有人类的幸存军队\n 我们需要更多的支援\n 让全世界汇合! ",0.00,null);
	}
	if(n == 23)
	{
		EntFire("Global_GameText_Announcement","SetText"," 冲\n我们搞到了火车!\n 现在可以走了 ",0.00,null);
	}
	if(n == 24)
	{
		EntFire("Global_GameText_Announcement","SetText","你在EX模式完成了30个支线任务\n 干得漂亮!",0.00,null);
	}
	if(n == 24)
	{
		EntFire("Global_GameText_Announcement","SetText"," 快撤\n核心已经不需要我们保护了\n 净化世界还有2分钟 ",0.00,null);
	}
	if(n == 25)
	{
		EntFire("Global_GameText_Announcement","SetText"," 我们已经退无可退,身后就是核心!\n 准备进行最后的防御! ",0.00,null);
	}
	if(n == 26)
	{
		EntFire("Global_GameText_Announcement","SetText"," 核心充能完毕\n 现在启动电梯! ",0.00,null);
	}
	if(n == 27)
	{
		EntFire("Global_GameText_Announcement","SetText"," 艾利克斯暂时处于机能停止状态\n 我们赶紧离开这里 ",0.00,null);
	}
}

function PlayMusicFromIndex(index, index2)
{
	if(Music)
	{
        local AmbientEnt = Entities.FindByName(null, "music_master_ambient");
		if(GetMod() == false) //false NORMAL
		{
			EntFireByHandle(AmbientEnt,"Volume","0",0.00,null,null);
			EntFireByHandle(AmbientEnt,"AddOutput",MUSIC_ARRAY[GetMapLevel()][index],0.10,self,null);
			EntFireByHandle(AmbientEnt,"PlaySound","",0.20,null,null);
			EntFireByHandle(AmbientEnt,"Volume",""+MaxVolume,0.30,null,null);
		}
		else if(GetMod() == true) //true EXTREME
		{
			EntFireByHandle(AmbientEnt,"Volume","0",0.00,null,null);
			EntFireByHandle(AmbientEnt,"AddOutput",MUSIC_ARRAY[GetMapLevel()][index2],0.10,self,null);
			EntFireByHandle(AmbientEnt,"PlaySound","",0.20,null,null);
			EntFireByHandle(AmbientEnt,"Volume",""+MaxVolume,0.30,null,null);
		}
	}
}

function PlayMusicFromIndexAnyLevel(stage, index)
{
	if(Music)
	{
		local AmbientEnt = Entities.FindByName(null, "music_master_ambient");
		EntFireByHandle(AmbientEnt,"Volume","0",0.00,null,null);
		EntFireByHandle(AmbientEnt,"AddOutput",MUSIC_ARRAY[stage][index],0.10,self,null);
		EntFireByHandle(AmbientEnt,"PlaySound","",0.20,null,null);
		EntFireByHandle(AmbientEnt,"Volume",""+MaxVolume,0.30,null,null);
	}
}

function GetMod(){if(EXTREME){return true;}else{return false;}}

function PlayMusic()
{
	try
	{
		if(Music)
		{
			local AmbientEnt = Entities.FindByName(null, "music_master_ambient");
			MUSIC_COUNT++;
			EntFireByHandle(AmbientEnt,"Volume","0",0.00,null,null);
			// AmbientEnt.__KeyValueFromString("AddOutput", MUSIC_ARRAY[GetMapLevel()][MUSIC_COUNT]);
			EntFireByHandle(AmbientEnt,"AddOutput",MUSIC_ARRAY[GetMapLevel()][MUSIC_COUNT],0.10,self,null);
			EntFireByHandle(AmbientEnt,"PlaySound","",0.20,null,null);
			EntFireByHandle(AmbientEnt,"Volume",""+MaxVolume,0.30,null,null);
		}
	}
	catch(error)
	{
		return;
	}
}
//PREDATOR / TANK
//Tank new origin

function ActivatorGeneratorStage401()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivatorGeneratorStage402()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivatorGeneratorStage403()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function PressButtonStage3()
{
	if(activator.GetTeam() == 3)
	{
        EntFire("Global_GameText_Announcement","AddOutput","message ** 垂直升降电梯将在20秒后离开 **",0.00,null);
		EntFire("Global_GameText_Announcement","FireUser4","",0.00,null);
		EntFire("stage_3_timer_tubes","Disable","",0.00,null);
		EntFire("stage_3_tube_elevators_case","PickRandom","",0.00,null);
        EntFire("fallback_fade","Fade","",0.00,null);
		EntFire("stage_target_helper_2","AddOutput","origin 0 0 0",0.00,null);
	    EntFireByHandle(self, "RunScriptCode", "PlayMusic();", 5.00, null, null);
		EntFire("stage_3_tube_elevators_timer","Enable","",20.00,null);
	}
	else if(activator.GetTeam() == 2)
	{
        EntFire("Global_GameText_Announcement","AddOutput","message ** 垂直升降电梯将在35秒后离开 **",0.00,null);
		EntFire("Global_GameText_Announcement","FireUser4","",0.00,null);
		EntFire("stage_3_timer_tubes","Disable","",0.00,null);
		EntFire("stage_3_tube_elevators_case","PickRandom","",0.00,null);
		EntFire("stage_target_helper_2","AddOutput","origin 0 0 0",0.00,null);
	    EntFireByHandle(self, "RunScriptCode", "PlayMusic();", 5.00, null, null);
		EntFire("stage_3_tube_elevators_timer","Enable","",35.00,null);
	}
}

function ActivateMainButtonSt5()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivateCoreButton()
{
    if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function Stage2TruckButtonAct()
{
    if(activator.GetTeam() == 3 && STAGE == 2 || activator.GetTeam() == 3 && STAGE == 7)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function CheckPlayer()
{
	if(STAGE_CHANGE)
	{
		STAGE_CHANGE = false;
		Time = 540.00;
		EntFire("checkpoint_reached","Trigger","",0.00,null);
		EntFire("stage_3_nuke","Disable","",0.00,null);
		EntFireByHandle(self, "RunScriptCode", "CheckTempEvent();", 0.10, null, null);
		if(STAGE == 5 || STAGE == 10){EntFireByHandle(self, "RunScriptCode", "ResetEvents();", 0.50, null, null);}
		EntFireByHandle(self, "RunScriptCode", "STAGE++;", 0.90, null, null);
		EntFireByHandle(self, "RunScriptCode", "KillZm();", 1.00, null, null);
	}
}

function BadEndStage4()
{
	Time = 540.00;
	EntFire("checkpoint_reached","Trigger","",0.00,null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 2.00, null, null);
	STAGE++;
}


function ExplodeFigher()
{
	local ratt = RandomInt(1, 2);
	if(ratt == 1)
	{
        EntFire("stage_x_jet_missile_track_2","AddOutput","origin 7176 -1176 -12768",0.00,null);
		EntFire("stage_1_base_explosion","AddOutput","origin 7176 -1176 -12768",0.00,null);
		EntFire("stage_1_base_tower_1","SetAnimation","Break",0.02,null);
	}
	if(ratt == 2)
	{
		EntFire("stage_x_jet_missile_track_2","AddOutput","origin 6220.02 -3788 -12738",0.00,null);
		EntFire("stage_1_base_explosion","AddOutput","origin 6220.02 -3788 -12738",0.00,null);
		EntFire("stage_1_base_tower_2","SetAnimation","Break",0.02,null);
	}
	EntFire("stage_x_missile_track_train","StartForward","",0.01,null);
}

function Stage5BlueEnding()
{
	if(activator.GetTeam() == 3)
	{
        EntFire("Global_GameText_Announcement","AddOutput","message ** 核心已经展开就绪\n 你就是拯救这个世界最后的希望!! **",0.00,null);
		EntFire("stage_5_extreme_relay","Trigger","",3.00,null);
		EntFire("stage_5_core_column_end_button_*","Kill","",0.00,null);
		EntFire("stage_5_end_button_blue","FireUser1","",0.00,null);
		EntFire("stage_5_top_core_tunnel_effect","Kill","",0.00,null);
		EntFire("stage_5_end_button_red","Kill","",0.00,null);
		EntFire("stage_5_lower_core_tunnel_effect","Kill","",0.00,null);
		EntFire("stage_x_main_lift","Kill","",0.00,null);
		EntFire("stage_5_teleport_to_core","Enable","",0.00,null);
		EntFire("Global_GameText_Announcement","FireUser4","",0.00,null);
		EntFire("stage_5_end_hint","AddOutput","message 人类的命运皆与你手中!",0.00,null);
		EntFire("stage_5_end_wall_to_core","Kill","",3.00,null);
		EntFire("item_c","RunScriptCode","DisableZmItem();",3.00,null);
	}
}

function Stage5RedEnding()
{
	if(activator.GetTeam() == 3)
	{
		PlayMusicFromIndex(4, 10);
		EntFire("Global_GameText_Announcement","FireUser3","",0.00,null);
		EntFire("stage_5_end_button_blue","FireUser1","",0.00,null);
		EntFire("stage_5_end_button_blue","Kill","",0.00,null);
		EntFire("stage_5_end_button_red","Lock","",0.00,null);
		EntFire("stage_5_core_column_end_button_*","Kill","",0.00,null);
		EntFire("Global_GameText_Announcement","AddOutput","message ** 充能完毕 **",0.00,null);
		EntFire("map_brush","RunScriptCode","CheckPlayer();",37.00,null);
		EntFire("Global_Big_Shake","FireUser2","",0.00,null);
		EntFire("stage_5_last_man_trigger_core_end_bad","Enable","",28.00,null);
		EntFire("stage_x_rotation","Start","",13.00,null);
		EntFire("stage_5_core_light_2_end_bad","FireUser1","",13.50,null);
		EntFire("stage_5_end_hint","AddOutput","message 生存下去\n让整个世界一起毁灭吧 ",0.00,null);
	}
}

function Stage4ButtonRProtect()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ShortCutZmStage1()
{
	if(ReturnPlayerCT() >= 12)
	{
        EntFire("humancounter_s1_phase1_explosion", "Explode", "", 2.00, null);
		EntFire("Global_Explosion_Crush", "FireUser1", "", 2.00, null);
		EntFire("humancounter_s1_phase1_door1", "Break", "", 2.10, null);
		EntFire("humancounter_s1_phase1_door2", "Break", "", 2.10, null);
	}
	if(ReturnPlayerCT() >= 20)
	{
        EntFire("humancounter_s1_phase2_particle", "Start", "", 4.00, null);
		EntFire("Global_Explosion_Crush", "FireUser1", "", 4.00, null);
		EntFire("humancounter_s1_phase2_door1", "Break", "", 4.10, null);
		EntFire("humancounter_s1_phase2_particle", "Stop", "", 4.50, null);
	}
}

function ActivateGeneratorS501()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivateGeneratorS502()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivateGeneratorS503()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function ActivateGeneratorS504()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function Stage4ActButton01()
{
	if(activator.GetTeam() == 3)
	{
		EntFireByHandle(caller,"FireUser1","",0.00,activator,null);
	}
}

function TimerMap(timer, text)
{
   TimerTick = true;
   Time = timer;
   SaveTime = timer;
   AddText(text);
   StartTextHud();
}

function StopTimer(){TimerTick = false;}

function ResetTimer(){Time = SaveTime;}

function AddTime(t){Time += t;}

function AddText(text)
{
	if(text == 1){TimerText = "Total Destruction: ";}
}

function StartTimer(){TimerTick = true;StartTextHud();}

function StartTextHud()
{
    if(TimerTick)
    {
        local min1 = (((Time/60) % 60) % 10);
        local min2 = (((Time/60) % 60) / 10);
        local sec1 = ((Time % 60) % 10);
        local sec2 = ((Time % 60) / 10);
        for(local au = 1; au < 2; au++)
        {
            if(au == 1)
            {
				EntFire("td_text", "SetText", TimerText+"还剩"+min1+"分钟", 0.00, null);
		        EntFire("td_text", "Display", "", 0.05, null);
                // Time--;
            }
            if(Time <= 0)
            {
				STAGE_CHANGE = false;
                Time = SaveTime;
				if(STAGE > SAVESTAGE){return;}
				STAGE++;
                EntFire("Global_Sound_Nuke", "FireUser1", "", 0.00, null);
	        	EntFire("spawn_explosion_nuke_particle", "FireUser1", "", 0.00, null);
	        	EntFire("Human_Item_Mech_Cam", "Disable", "", 0.00, null);
		        EntFire("Human_Item_Mech_Body", "Break", "", 0.01, null);
	        	EntFireByHandle(self, "RunScriptCode", "KillAll();", 0.05, null, null);
                return;
            }
        }
		EntFireByHandle(self,"RunScriptCode","Time -= 60;",60.00,null,null);
        EntFireByHandle(self,"RunScriptCode","StartTextHud();",60.00,null,null);
    }
}

function KillAll()
{
	EntFire("Weapon_Inmunizer_Inmunize_Trigger","Kill","",0.00,null);
	EntFire("Human_Item_Mech_Cam","Disable","",0.00,null);
	EntFire("Map_End_Camera","Disable","",0.00,null);
	EntFire("v_cam1","Disable","",0.00,null);
	EntFire("Zombie_Item_Boss_Cam","Disable","",0.00,null);
	EntFireByHandle(Zone_Kill, "countplayersinzone", "", 2.00, null, null);
}

function KillZm()
{
	local TempPlArr = [];
	EntFire("Weapon_Inmunizer_Inmunize_Trigger","Kill","",0.00,null);
	EntFire("Human_Item_Mech_Cam","Disable","",0.00,null);
	EntFire("Map_End_Camera","Disable","",0.00,null);
	EntFire("v_cam1","Disable","",0.00,null);
	EntFire("Zombie_Item_Boss_Cam","Disable","",0.00,null);
	local z = null;
	while(null != (z = Entities.FindByClassname(z, "player")))
	{
		if(PlayersArr.len() > 0)
		{
			if(z != null && z.IsValid() && z.GetHealth() > 0)
			{
				TempPlArr.push(z);
			}
		}
		else
		{
			EntFireByHandle(z, "SetDamageFilter", "", 0.00, z, null);
			EntFireByHandle(z, "SetHealth", "-1", 0.01, z, null);
		}
	}
	for(local i = 0; i < TempPlArr.len(); i++)
	{
		foreach(item in PlayersArr)
		{
			if(item == TempPlArr[i])
			{
				TempPlArr[i].SetOrigin(Vector(7270,3430,1300));
			}
		}
	}
	EntFireByHandle(Zone_Kill, "countplayersinzone", "", 1.00, null, null);
}

function AddToSurvive()
{
	PlayersArr.push(activator);
}

function KillHu()
{
	EntFire("Weapon_Inmunizer_Inmunize_Trigger","Kill","",0.00,null);
	EntFire("Human_Item_Mech_Cam","Disable","",0.00,null);
	EntFire("Map_End_Camera","Disable","",0.00,null);
	EntFire("v_cam1","Disable","",0.00,null);
	EntFire("Zombie_Item_Boss_Cam","Disable","",0.00,null);
	local h = null;
	while(null != (h = Entities.FindByClassname(h, "player")))
	{
		if(h != null && h.IsValid() && h.GetHealth() > 0 && h.GetTeam() == 3)
		{
			EntFireByHandle(h, "SetDamageFilter", "", 0.00, null, null);
            EntFireByHandle(h, "SetHealth", "-1", 0.50, null, null);
		}
	}
}

function BridgeBrokenStage4()
{
	if(ReturnPlayerCT() <= 15)
	{
		EntFire("stage_x_end_bridge_2_physbox", "Break", "", 0.00, null);
		EntFire("stage_x_end_bridge_3_physbox", "Break", "", 0.00, null);
	}
}

function SetPlayerScript()
{
	local Fpl = null;
	while(null != (Fpl = Entities.FindByClassname(Fpl, "player")))
	{
		if(Fpl.GetHealth() > 0 && Fpl.IsValid())
		{
			local FindOw = Fpl.GetScriptScope()
			if("OWNER" in FindOw){}
			else
			{
				EntFireByHandle(Fpl,"RunScriptFile","kinlkm/last_man_standing/player_lastman_cn.nut",0.00,Fpl,Fpl);
			}
		}
	}
	EntFireByHandle(self,"RunScriptCode","SetPlayerScript();",5.00,null,null);
}

function ReturnPlayerCT()
{
    local hupl = null;
	local hulc = 0;
	while(null != (hupl = Entities.FindByClassname(hupl, "player")))
	{
		if(hupl.GetTeam() == 3 && hupl.GetHealth() > 0 && hupl.IsValid())
		{
			hulc++;
		}
	}
	return hulc;
}

function ReturnPlayerT()
{
    local zmpl = null;
	local zmlc = 0;
	while(null != (zmpl = Entities.FindByClassname(zmpl, "player")))
	{
		if(zmpl.GetTeam() == 2 && zmpl.GetHealth() > 0 && zmpl.IsValid())
		{
			zmlc++;
		}
	}
	return zmlc;
}

function SetMaxHealthZm()
{
	if(STAGE == 5 || STAGE == 10)
	{
		local hpzm = null;
		while(null != (hpzm = Entities.FindByClassname(hpzm, "player")))
		{
			if(hpzm != null && hpzm.IsValid() && hpzm.GetHealth() > 900 && hpzm.GetTeam() == 2)
			{
				EntFireByHandle(hpzm, "AddOutput", "Health 1000", 0.00, null, null);
			}
		}
		EntFireByHandle(self, "RunScriptCode", "SetMaxHealthZm();", 2.00, null, null);
	}
}

function ClearPlayer()
{

    EntFireByHandle(activator,"AddOutput","max_health 100",0.00,activator,activator);
    EntFireByHandle(activator,"AddOutput","gravity 1",0.00,activator,activator);
    EntFireByHandle(activator,"AddOutput","modelscale 1",0.00,activator,activator);
    EntFireByHandle(activator,"AddOutput","rendermode 0",0.00,activator,activator);
    EntFireByHandle(activator,"SetDamageFilter","",0.00,activator,activator);
	activator.ValidateScriptScope();
	if("OWNER" in activator.GetScriptScope())
	{
		EntFireByHandle(activator,"RunScriptCode","ClearVar();",0.00,activator,activator);
	}
}

function FixBridgeHp()
{
	if(STAGE == 9){
		EntFire("stage_x_end_bridge_2_physbox","SetHealth","600",10.00,null);
		EntFire("stage_x_end_bridge_3_physbox","SetHealth","600",10.00,null);
	}
}
