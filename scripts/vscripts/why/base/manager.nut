::LOG_LEVEL<-0;
const LOG_CONSOLE=1;
const LOG_CHAT=2;
const LOG_MSG=4;
::logText <- function(text){
    if(LOG_LEVEL&LOG_CONSOLE){
        printl(text);
    }
    if(LOG_LEVEL&LOG_CHAT){
        ScriptPrintMessageChatAll(" \x04脚本debug\x01："+text);
    }
    if(LOG_LEVEL&LOG_MSG){
        ScriptPrintMessageCenterAll("<font color='#00ff00'>脚本debug："+text+"</font>");
    }
}
::logTableText <- function(table){
    try{
        local text="";
        foreach(k,v in table){
            text=text+k+":::"+v+",,";
        }
        if(LOG_LEVEL&1){
            printl(text);
        }
        if(LOG_LEVEL&2){
            ScriptPrintMessageChatAll(" \x04脚本debug\x01："+text);
        }
        if(LOG_LEVEL&4){
            ScriptPrintMessageCenterAll("<font color='#00ff00'>脚本debug："+text+"</font>");
        }
    }catch(e){
        logText(e);
    }
}
SAVE_LEVEL_SWITCH<-true;
function CheckPlayerInfo(){
    player <- null;
    while( (player = Entities.FindByClassname(player,"*")) != null ) {
        if (player.GetClassname() == "player") {
            if(GetPlayerByHandle(player)==null){
                player.__KeyValueFromString("rendercolor", "0 255 0");
            }
        }
    }
    ScriptPrintMessageChatAll(" \x02疑似因stripper生成加载存在延迟，变为绿色以及跟随切换地图连接服务器的玩家请重进服务器，以免神器等级保存不生效！！！\x01");
    ScriptPrintMessageChatAll(" \x02疑似因stripper生成加载存在延迟，变为绿色以及跟随切换地图连接服务器的玩家请重进服务器，以免神器等级保存不生效！！！\x01");
    ScriptPrintMessageChatAll(" \x02疑似因stripper生成加载存在延迟，变为绿色以及跟随切换地图连接服务器的玩家请重进服务器，以免神器等级保存不生效！！！\x01");
}
gameevents_proxy<-null;
GameEventsCapturedPlayer <- null;
function PlayerUse(uid,eid) {
    if (GameEventsCapturedPlayer != null && eid == 0) {
        local script_scope = GameEventsCapturedPlayer.GetScriptScope();
        script_scope.userid <- uid;
        SetPlayerHandle(uid,GameEventsCapturedPlayer);
        GameEventsCapturedPlayer = null;
    }
}
class Player{
    userid = 0;
    name = "";
    steamid = "";
    handle = null;
    connected = true;
    itemInfo = "";
    constructor(_u,_s="",_n=""){userid=_u;steamid=_s;name=_n;}
}
PLAYER_LIST<-[];
function GetPlayerByUid(uid){
    for(local i=0;i<PLAYER_LIST.len();i++){
        if(PLAYER_LIST[i].userid==uid){
            return PLAYER_LIST[i];
        }
    }
    return null;
}
function GetPlayerByHandle(handle){
    for(local i=0;i<PLAYER_LIST.len();i++){
        if(PLAYER_LIST[i].handle==handle){
            return PLAYER_LIST[i];
        }
    }
    return null;
}
function GetPlayerBySteamId(sid){
    for(local i=0;i<PLAYER_LIST.len();i++){
        if(PLAYER_LIST[i].steamid==sid){
            return PLAYER_LIST[i];
        }
    }
    return null;
}
function SetPlayerHandle(uid,handle){
    local pl=GetPlayerByUid(uid);
    if(pl==null){
        PLAYER_LIST.push(Player(uid));
    }
    pl=GetPlayerByUid(uid);
    pl.handle=handle;
    RestoreItemLevel(pl);
    return true;
}
set_bot_data<-false;
function Think() {
    //if("LevelInit" in self.GetScriptScope()){LevelInit();}
    if ( gameevents_proxy==null || !gameevents_proxy.IsValid() ) {
        gameevents_proxy <- Entities.CreateByClassname("info_game_event_proxy");
        gameevents_proxy.__KeyValueFromString("event_name","player_use");
        gameevents_proxy.__KeyValueFromInt("range",0);
    }
    player <- null;
    while( (player = Entities.FindByClassname(player,set_bot_data?"*":"player")) != null ) {
        if (player.GetClassname() == "player") {
            if (player.ValidateScriptScope()) {
                local script_scope=player.GetScriptScope()
                if (!("attemptogenerateuserid" in script_scope)&&!("userid" in script_scope)) {
                    script_scope.attemptogenerateuserid <- true;
                    GameEventsCapturedPlayer=player;
                    EntFireByHandle(gameevents_proxy,"GenerateGameEvent","",0.0,player,null);
                    return;
                }
            }
        }
    }
}
function Init(){
    if("LevelInit" in self.GetScriptScope()){LevelInit();}
    ScriptPrintMessageChatAll(" \x07玩家等级保存已加载，如果存在任何问题请直接联系；by：健忘症晚期-2021-07-31\x01");
}
function Connected(uid,sid,name){
    if(sid=="BOT")return;
    local pl=GetPlayerBySteamId(sid);
    if(pl==null){
        PLAYER_LIST.push(Player(uid,sid,name));
        return;
    }
    pl.userid=uid;pl.name=name;pl.connected=true;
}
function Disconnected(uid,sid){
    local pl=GetPlayerBySteamId(sid);
    if(pl==null)pl=GetPlayerByUid(uid);
    if(pl==null)return;
    pl.steamid=sid;pl.handle=null;pl.connected=false;
}
function RoundStart(){
    for(local i=0;i<PLAYER_LIST.len();i++){
        local pl=PLAYER_LIST[i];
        if(pl.connected&&pl.handle!=null&&pl.handle.IsValid()){
            pl.itemInfo=pl.handle.GetName();
        }
    }
}
function ItemPickup(uid,itemName){
    local pl=GetPlayerByUid(uid);
    if(pl!=null&&pl.handle!=null&&pl.handle.IsValid()){
        pl.itemInfo=pl.handle.GetName();
    }
}
function RestoreItemLevel(pl){
    if(!SAVE_LEVEL_SWITCH)return;
    try{
        if(pl.itemInfo!=null&&pl.itemInfo!=""){
            pl.handle.__KeyValueFromString("targetname", pl.itemInfo);
        }
    }catch(e){
        logText(e);
    }
}
function RestoreAllPlayerItemLevel(){
    if(!SAVE_LEVEL_SWITCH){
        ScriptPrintMessageChatAll(" \x02神器等级还原功能已关闭！\x01");
        return;
    }
    for(local i=0;i<PLAYER_LIST.len();i++){
        if(PLAYER_LIST[i].handle!=null&&PLAYER_LIST[i].handle.IsValid()){
            RestoreItemLevel(PLAYER_LIST[i]);
        }
    }
    ScriptPrintMessageChatAll(" \x04神器等级还原执行完毕！\x01");
}
function GetPlayerInfo(uid){
    local pl=GetPlayerByUid(uid);
    if(pl==null){
        ScriptPrintMessageChatAll(" \x02玩家信息不存在，可能是uid错误\x01");
        return;
    }
    ScriptPrintMessageChatAll(" \x04玩家名："+pl.name+"；steamid："+pl.steamid+"；是否在服务器中："+pl.connected+"；等级信息："+pl.itemInfo+"；玩家捕获："+pl.handle+"\x01");
}
function GPI(uid){
    GetPlayerInfo(uid);
}
