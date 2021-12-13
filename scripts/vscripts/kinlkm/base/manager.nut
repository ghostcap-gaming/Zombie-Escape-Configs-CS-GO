DEBUG <- false;
::PLAYERS <- [];
PL_HANDLE <- [];
TEMP_HANDLE <- null;

eventinfo <- null;
eventproxy <- null;
eventlist <- null;
g_zone <- null;
once_check <- false;

T_Player_Check <- 5.00;

function MapStart()
{
    once_check = true;
    SendToConsoleServer("sv_disable_immunity_alpha 1");
    if(eventinfo == null || eventinfo != null && !eventinfo.IsValid()){eventinfo = Entities.FindByName(null, "pl_ginfo");}
    if(eventproxy == null || eventproxy != null && !eventproxy.IsValid()){eventproxy = Entities.FindByClassname(null, "info_game_event_proxy");}
    if(g_zone == null || g_zone != null && !g_zone.IsValid()){g_zone = Entities.FindByName(null, "check_players");}
    LoopPlayerCheck();
}

function LoopPlayerCheck()
{
    EntFireByHandle(self, "RunScriptCode", "LoopPlayerCheck();", T_Player_Check, null, null);
    if(PL_HANDLE.len() > 0){PL_HANDLE.clear();}
    EntFireByHandle(g_zone, "FireUser1", "", 0.00, null, null);
    EntFireByHandle(self, "RunScriptCode", "CheckValidInArr();", T_Player_Check*1.5, null, null);
}

class PlayerInfo
{
	userid = null;
	name = null;
	steamid = null;
	handle = null;
    next_check = false;
	constructor(_userid,_name,_steamid)
	{
		userid = _userid;
		name = _name;
		steamid = _steamid;
	}
    function GetCheckPl()
    {
        if(this.next_check){return true;}
        else{return false;}
    }
    function SetPlCheck()
    {
        if(!this.next_check){return this.next_check = true;}
    }
}


function CheckValidInArr()
{
    if(PLAYERS.len() > 0 && once_check)
    {
        local Temp_Player_Arr = [];
        for(local i = 0; i < PLAYERS.len(); i++)
        {
            if(PLAYERS[i].handle != null && PLAYERS[i].handle.IsValid())
            {
                Temp_Player_Arr.push(PLAYERS[i]);
                if(DEBUG){ScriptPrintMessageChatAll("push: "+PLAYERS[i].name+" | "+PLAYERS[i].GetCheckPl());}
            }
            else if(PLAYERS[i].handle == null || !PLAYERS[i].handle.IsValid() && !PLAYERS[i].GetCheckPl())
            {
                PLAYERS[i].SetPlCheck();
                Temp_Player_Arr.push(PLAYERS[i]);
                if(DEBUG){ScriptPrintMessageChatAll("handle not valid | push: "+PLAYERS[i].name+" | "+PLAYERS[i].GetCheckPl());}
            }
        }
        PLAYERS.clear();
        for(local a = 0; a < Temp_Player_Arr.len(); a++)
        {
            PLAYERS.push(Temp_Player_Arr[a])
        }
        once_check = false;
    }
}

function PlayerConnect()
{
    if(eventlist == null || eventlist != null && !eventlist.IsValid())
    {
        eventlist = Entities.FindByName(null, "event_player_connect");
    }
	local userid = eventlist.GetScriptScope().event_data.userid;
    local name = eventlist.GetScriptScope().event_data.name;
	local steamid = eventlist.GetScriptScope().event_data.networkid;
    local p = PlayerInfo(userid,name,steamid);
    PLAYERS.push(p);
}

function EventInfo()
{
    if(eventinfo == null || eventinfo != null && !eventinfo.IsValid())
    {
        eventinfo = Entities.FindByName(null, "eventinfo");
    }
	local userid = eventinfo.GetScriptScope().event_data.userid;
    if(PLAYERS.len() > 0)
    {
        for(local i=0; i < PLAYERS.len(); i++)
        {
            if(PLAYERS[i].userid == userid)
            {
                PLAYERS[i].handle = TEMP_HANDLE;
                return;
            }
        }
    }
    local p = PlayerInfo(userid,"NOT GETED","NOT GETED");
    p.handle = TEMP_HANDLE;
    PLAYERS.push(p);
}

function Set_Player()
{
    if(!ValidHandleArr(activator))
    {
        PL_HANDLE.push(activator);
    }
}

function Reg_Player()
{
    if(PL_HANDLE.len() > 0)
    {
        EntFireByHandle(self, "RunScriptCode", "Reg_Player();", 0.10, null, null);
        TEMP_HANDLE = PL_HANDLE[0];
        PL_HANDLE.remove(0);
        if(TEMP_HANDLE.IsValid())
        {
            EntFireByHandle(eventproxy, "GenerateGameEvent", "", 0.00, TEMP_HANDLE, null);
        }
        else
        {
            return;
        }
    }
}

function ValidHandleArr(h)
{
    foreach(p in PLAYERS)
	{
		if(p.handle == h)
		{
            return true;
		}
	}
	return false;
}

function CheckPlInArr()
{
    if(PLAYERS.len() > 0)
    {
        try
        {
            ScriptPrintMessageCenterAll("ARRAY LEN: "+PLAYERS.len()+
            "\nPL NAME: "+GetPlayerClassByHandle(activator).name+
            "\nPL UID: "+GetPlayerClassByHandle(activator).userid+
            "\nPL STEAMID: "+GetPlayerClassByHandle(activator).steamid+
            "\nHANDLE: "+GetPlayerClassByHandle(activator).handle+
			"\nCHECK: "+GetPlayerClassByHandle(activator).GetCheckPl());
        }
        catch(error)
        {
            ScriptPrintMessageCenterAll("PLAYER ERROR, TRY RETRY");
        }
        
    }
    else
    {
        ScriptPrintMessageCenterAll("ARRAY CLEAR");
    }
}

function CheckPlInArrUid(uid)
{
    if(PLAYERS.len() > 0)
    {
        try
        {
            ScriptPrintMessageCenterAll("ARRAY LEN: "+PLAYERS.len()+
            "\nPL NAME: "+GetPlayerClassByUserID(uid).name+
            "\nPL UID: "+GetPlayerClassByUserID(uid).userid+
            "\nPL STEAMID: "+GetPlayerClassByUserID(uid).steamid+
            "\nHANDLE: "+GetPlayerClassByUserID(uid).handle+
            "\nCHECK: "+GetPlayerClassByHandle(activator).GetCheckPl());
        }
        catch(error)
        {
            ScriptPrintMessageCenterAll("PLAYER ERROR, TRY RETRY");
        }
    }
    else
    {
        ScriptPrintMessageCenterAll("ARRAY CLEAR");
    }
}

function GetPlayerByUserID(userid)
{
	foreach(p in PLAYERS)
	{
		if(p.userid == userid)
		{
            return p.handle;
		}
	}
	return null;
}

function GetPlayerClassByHandle(handle)
{
	foreach(p in PLAYERS)
	{
		if(p.handle == handle)
		{
            return p;
		}
	}
	return null;
}

function GetPlayerClassByUserID(uid)
{
    foreach(p in PLAYERS)
	{
		if(p.userid == uid)
		{
            return p;
		}
	}
	return null;
}

::GetPlayerNameOrUidByHandle <- function(handle)
{
    foreach(p in PLAYERS)
	{
		if(p.handle == handle)
		{
            if(p.name == "NOT GETED")
            {
                return "UID: "+p.userid;
            }
            else
            {
                return ""+p.name;
            }
		}
	}
	return null;
}


function HealthChanged(n)
{
    local player_name = null;
    local type_name = null;
    switch(n)
    {
        case 0:
        {
            type_name = "箱子";
            break;
        }
        default:
        {
            type_name = "障碍物";
        }
    }
    if(activator.GetTeam() == 3)
    {
        player_name = GetPlayerClassByHandle(activator).name;
        ScriptPrintMessageChatTeam(3," \x02 [Even事件]：\x09" + player_name + "尝试攻击" + type_name);
    }
}

function Break(n)
{
    local player_name = null;
    local type_name = null;
    switch(n)
    {
        case 0:
        {
            type_name = "箱子";
            break;
        }
        default:
        {
            type_name = "障碍物";
        }
    }

    player_name = GetPlayerClassByHandle(activator).userid;
    ScriptPrintMessageChatAll(" \x02 [Even事件]：\x09 UID:" + player_name + "破坏了" + type_name + " 控制台输入status查询");
}
