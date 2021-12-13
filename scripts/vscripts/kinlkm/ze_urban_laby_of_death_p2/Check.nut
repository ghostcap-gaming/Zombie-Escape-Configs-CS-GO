ticking <- false;

function Start()
{
    ticking = true;
    Tick();
}
function Tick()
{
    if(ticking)
    {
        EntFire("dumbasses","ModifySpeed","0",0.00,null);
        EntFireByHandle(self, "RunScriptCode", "Tick()", 0.5, null, null);
    }
}