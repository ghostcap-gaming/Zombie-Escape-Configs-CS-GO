iTimer <- 10;
iNextSound <- 0;
sEntity <- "xmas_sound";

function TickFunc()
{
	if(iTimer > 0) iTimer--;
	else
	{
		EntFire(sEntity,"StopSound","",0.00,null);
		EntFire(sEntity,"Volume","0",0.02,null);
		EntFireByHandle(self, "RunScriptCode","ReadyPlay();",0.1, null, null);
	}
	EntFireByHandle(self, "RunScriptCode", "TickFunc();", 1.0, null, null);
}

function ReadyPlay()
{
	if(iNextSound == 0)
	{
		iTimer = 188; //на 2 сек меньше для правильной работы
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Halocene - Carol of the Bells");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Halocene - Carol of the Bells.mp3",0.0,null);
	}else if(iNextSound == 1)
	{
		iTimer = 221;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Wham - Last Christmas (Paul Gannon Bootleg)");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Wham - Last Christmas (Paul Gannon Bootleg).mp3",0.0,null);
	}else if(iNextSound == 2)
	{
		iTimer = 199;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 The Living Tombstone - Carol of the Bells");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/The Living Tombstone - Carol of the Bells.mp3",0.0,null);
	}else if(iNextSound == 3)
	{
		iTimer = 154;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 DJ Snake & Alesia - Bird Machine (Jingle Bells Version)");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Aero Chord feat. DDARK - Shootin Stars (NCS release).mp3",0.0,null);
	}else if(iNextSound == 4)
	{
		iTimer = 207;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Ryu feat. Mayumi Morinaga - Din Don Dan");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Ryu feat. Mayumi Morinaga - Din Don Dan.mp3",0.0,null);
	}else if(iNextSound == 5)
	{
		iTimer = 210;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Tristam & Stephen Walking - Jingle Bells");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Tristam & Stephen Walking - Jingle Bells.mp3",0.0,null);
	}else if(iNextSound == 6)
	{
		iTimer = 166;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Lindsey Stirling - Carol of the Bells");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Lindsey Stirling - Carol of the Bells.mp3",0.0,null);
	}else if(iNextSound == 7)
	{
		iTimer = 217;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Jibbs - Chain Hang Low (Crizzly & AFK Remix)");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Jibbs - Chain Hang Low (Crizzly & AFK Remix).mp3",0.0,null);
	}else if(iNextSound == 8)
	{
		iTimer = 148;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 LITTLE BIG - Suck My Dick");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/LITTLE BIG - Suck My Dick.mp3",0.0,null);
	}else if(iNextSound == 9)
	{
		iTimer = 202;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 7th Dimension - Iron Will");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/7th Dimension - Iron Will.mp3",0.0,null);
	}else if(iNextSound == 10)
	{
		iTimer = 208;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 JayKode - Nutcraka");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/JayKode - Nutcraka.mp3",0.0,null);
	}else if(iNextSound == 11)
	{
		iTimer = 153;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Gunther ft. The Sunshine Girls - Ding Dong Song");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Gunther ft. The Sunshine Girls - Ding Dong Song.mp3",0.0,null);
	}else if(iNextSound == 12)
	{
		iTimer = 326;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Scott D. Davis - The Final Countdown (Piano Tribute to Europe)");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/Scott D. Davis - The Final Countdown (Piano Tribute to Europe).mp3",0.0,null);
	}else if(iNextSound == 13)
	{
		iTimer = 215;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 V O E - Giants");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/V O E - Giants.mp3",0.0,null);
	}else if(iNextSound == 14)
	{
		iTimer = 227;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Sauniks - Carol of the Bells");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Sauniks - Carol of the Bells.mp3",0.0,null);
	}else if(iNextSound == 15)
	{
		iTimer = 215;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Geoxor - Nana");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Geoxor - Nana.mp3",0.0,null);
	}else if(iNextSound == 16)
	{
		iTimer = 168;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Lil Jon feat. Kool-Aid Man - All I Really Want For Christmas");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Lil Jon feat. Kool-Aid Man - All I Really Want For Christmas.mp3",0.0,null);
	}else if(iNextSound == 17)
	{
		iTimer = 169;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Razihel & Aero Chord - Titans");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Razihel & Aero Chord - Titans.mp3",0.0,null);
	}else if(iNextSound == 18)
	{
		iTimer = 168;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Knife Party - Power Glove");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Knife Party - Power Glove.mp3",0.0,null);
	}else if(iNextSound == 19)
	{
		iTimer = 210;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Eisbrecher - Sturmfahrt");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Eisbrecher - Sturmfahrt.mp3",0.0,null);
	}else if(iNextSound == 20)
	{
		iTimer = 194;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Allexinno & Starchild - Joanna");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Allexinno & Starchild - Joanna.mp3",0.0,null);
	}else if(iNextSound == 21)
	{
		iTimer = 215;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Powerwolf - Demons Are a Girls Best Friend");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Powerwolf - Demons Are a Girls Best Friend.mp3",0.0,null);
	}else if(iNextSound == 22)
	{
		iTimer = 127;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 William N. Lewis - Last Ones Standing (feat. Tamara Bubble & Abrina)");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/William N. Lewis - Last Ones Standing (feat. Tamara Bubble & Abrina).mp3",0.0,null);
	}else if(iNextSound == 23)
	{
		iTimer = 172;
		ScriptPrintMessageChatAll(" \x0B[\x04Music Manager\x0B]\x10 Caramella Girls - Caramelldansen");
		EntFire(sEntity,"AddOutput","message darkerz_mapper/ze_pirates_xmas_stripper/extreme/Caramella Girls - Caramelldansen.mp3",0.0,null);
	}
	EntFire(sEntity,"PlaySound","",0.1,null);
	EntFire(sEntity,"Volume","10",0.12,null);
}

function SetMusic(iNumber)
{
	iTimer = 2;
	iNextSound = iNumber;
}

function Precache()
{
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Halocene - Carol of the Bells.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Wham - Last Christmas (Paul Gannon Bootleg).mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/The Living Tombstone - Carol of the Bells.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Aero Chord feat. DDARK - Shootin Stars (NCS release).mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Ryu feat. Mayumi Morinaga - Din Don Dan.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Tristam & Stephen Walking - Jingle Bells.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Lindsey Stirling - Carol of the Bells.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Jibbs - Chain Hang Low (Crizzly & AFK Remix).mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/LITTLE BIG - Suck My Dick.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/7th Dimension - Iron Will.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/JayKode - Nutcraka.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Gunther ft. The Sunshine Girls - Ding Dong Song.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/Scott D. Davis - The Final Countdown (Piano Tribute to Europe).mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/V O E - Giants.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Sauniks - Carol of the Bells.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Geoxor - Nana.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Lil Jon feat. Kool-Aid Man - All I Really Want For Christmas.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Razihel & Aero Chord - Titans.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Knife Party - Power Glove.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Eisbrecher - Sturmfahrt.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Allexinno & Starchild - Joanna.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Powerwolf - Demons Are a Girls Best Friend.mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/William N. Lewis - Last Ones Standing (feat. Tamara Bubble & Abrina).mp3");
	self.PrecacheScriptSound("darkerz_mapper/ze_pirates_xmas_stripper/extreme/Caramella Girls - Caramelldansen.mp3");
}