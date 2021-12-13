SummonerMaxUses = 30;
PortalList<-[];
SpeedM<-null

function UseItemSummoner()
{
    try
    {
        if(SummonerCaller.GetOwner() == SummonerAct)
        {
            if(SummonerUses <= SummonerMaxUses && SummonerToggle && SummonerAct.GetTeam() == 2 && activator == SummonerAct && SummonerAct.IsValid())
            {
                SummonerToggle = false;
                SummonerUses++;
                if(PortalList.len()>1){
                    PortalList[0].Destroy();
                    PortalList.remove(0);
                }
                EntFire("Summoner_Tele_Maker", "ForceSpawnAtEntityOrigin", "!activator", 0.0, activator);
                EntFire("summoner_tele&*", "AddOutput", "solid 2", 0, activator);
                EntFire("summoner_tele&*", "AddOutput", "mins -20 -20 -20", 0.2, activator);
                EntFire("summoner_tele&*", "AddOutput", "maxs 20 20 20", 0.2, activator);
                EntFireByHandle(caller, "FireUser4", "", 0.00, SummonerAct, null);
                EntFireByHandle(self, "RunScriptCode", "SummonerToggle = true;", 4.00, null, null);
            }
            if(SummonerUses >= SummonerMaxUses && SummonerToggle && SummonerAct.GetTeam() == 2 && activator == SummonerAct && SummonerAct.IsValid())
            {
                SummonerToggle = false;
                SummonerUses = 60;
            }
        }
    }
    catch(error)
    {
        printl(error);
        return;
    }
}

function DetectSummoner(){
    if(!SummonerCaller.IsValid()||SummonerCaller.GetOwner() != SummonerAct){
        ClearSummon();return;
    }
    EntFireByHandle(caller, "FireUser4", "", 0.1, activator, caller);
    local cal=caller;
    local hasAdd=false;
    for(local i=0;i<PortalList.len();i++){
        if(PortalList[i]==cal){
            hasAdd=true;
            break;
        }
    }
    if(!hasAdd){
        if(PortalList.len()<2){
            PortalList.push(cal);
        }else{
            PortalList[1]=cal;
        }
    }
    local player=null;
    while((player = Entities.FindInSphere(player, cal.GetOrigin(), 60)) != null){
        if(player.GetClassname()!="player")continue;
        if(player==SummonerAct){
            EntFireByHandle(caller, "Disable", "", 0, null, null);
            return;
        }
    }
    EntFireByHandle(caller, "Enable", "", 0, null, null);
}

function SummonTele(){
    if(!SummonerCaller.IsValid()||!SummonerAct.IsValid())return;
    if(SpeedM==null){
        SpeedM=Entities.FindByClassname(null, "player_speedmod");
        if(SpeedM==null){
            SpeedM=Entities.CreateByClassname("player_speedmod");
        }
    }
    EntFireByHandle(SpeedM,"Modifyspeed","0.9",0,activator,self);
    EntFireByHandle(SpeedM,"Modifyspeed","1",1.5,activator,self);
    activator.SetOrigin(SummonerAct.GetOrigin());
}

function ClearSummon(){
    for(local i=PortalList.len()-1;i>-1;i--){
        PortalList[i].Destroy();
        PortalList.remove(i);
    }
}

function ClearSummonOnL3(){
    for(local i=PortalList.len()-1;i>-1;i--){
        local tmpV=PortalList[i].GetOrigin();
        if(tmpV.x<7000&&tmpV.x>6800&&tmpV.y<6400&&tmpV.y>6000){
            PortalList[i].Destroy();
            PortalList.remove(i);
        }
    }
}
