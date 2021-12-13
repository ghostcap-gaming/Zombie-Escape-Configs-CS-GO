checkEnt <- null;
killEnt <- null;

function CheckToKill()
{
	if(!checkEnt || !checkEnt.IsValid())
	{
		self.Destroy();
		if(killEnt.IsValid())
		{
			killEnt.Destroy();
		}
		return;
	}
	EntFireByHandle(self, "FireUser1", "", 0.1, self, self);
}

function SaveKillEnt(check, kill)
{
	checkEnt = Entities.FindByName(null, check);
	killEnt = Entities.FindByName(null, kill);
	
	EntFireByHandle(self, "FireUser1", "", 0.0, self, self);
}

self.ConnectOutput("OnUser1", "CheckToKill");
