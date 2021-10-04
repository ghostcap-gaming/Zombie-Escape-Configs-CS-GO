//===================================\\
// Script by Luffaren (STEAM_1:1:22521282)
// (PUT THIS IN: csgo/scripts/vscripts/luffaren/)
//===================================\\
// 
// This script is made for mass-spawning templates with ease (and cheaply, only one entity)
// No need to place out entity_makers or hours of hard work with "AddOutput origin" in hammer
// It is all handled in runtime, restart the round to see the updates
// 
// [HOW TO USE]
// Add this script to any entity (a logical entity is recommended)
// Compile the map and go ingame, then noclip around to the desired spawning-spots
// Position and angle yourself (it will be relative to your eye-position and will only angle the Y-axis automatically)
// Run this in console:		ent_fire scriptholder RunScriptCode " AddSeed(0,0,0,0,0,0); "
// (the first  0,0,0 = random xyz position offset if needed	-	it runs the offset between negative-xyz and positive-xys)
// (the second 0,0,0 = random xyz angle offset if needed	-	it runs the offset between negative-xyz and positive-xys)
// Do this for every spawn position, you can call UndoSeed(); to undo the last addition or ClearSeed(); to start all over
// (restarting the round will clear the seed too)
// When done, run PrintSeed(); to print out the results in the console
// Copy+paste the contents from the console and add it to the Start(); function below
// Replace "XXXXX" with the template/entitymaker name
// Replace "YYYYY" with the index (always starts with 0, then adds +1 for each added group)
// Replace "COMMENT" with an appropriate comment of what/where it spawns, not obligatory
// Once done, you can finally run the function Spawn(index,interval); to spawn the desired group (by index)
// (example "interval" at 0.10 would pos/rot the template at 0.00, spawn at 0.10, pos/rot the template at 0.20, etc)
// 
// [FUNCTIONS]
// AddSeed(pX,pY,pZ,rX,rY,rZ);	-	add seed (with optional random pos/rot offsets)
// UndoSeed();					-	undo last seed
// ClearSeed();					-	clear entire seed list (restarting the round will also do this)
// PrintSeed();					-	print seed list (which can be copy+pasted into the Start(); function)
// Spawn(index,interval);		-	spawn a group of templated entities by index at a specified interval
// 
//===================================\\

function Start()
{
	SPAWNLIST.push(SeedGroup());//----------> s1 mines and soldiers
	SPAWNLIST[0].seeds.push(Seed("s_nksoldier",Vector(917,-5559,-309),Vector(0,194,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_nksoldier",Vector(1263,495,119),Vector(0,299,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_nksoldier",Vector(12544,1360,-959),Vector(0,270,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_nksoldier",Vector(14465,4479,-1023),Vector(0,180,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_nksoldier",Vector(13662,10427,-1378),Vector(0,271,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(-335,-2428,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(-217,-2309,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(-48,-2174,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(204,-2078,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(441,-2032,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(705,-2013,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(999,-1992,556),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(1220,-2002,617),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(1495,-2015,650),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(1684,-2025,650),Vector(0,-74,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(1089,1864,1248),Vector(0,31,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(1046,2039,1248),Vector(0,31,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(977,2325,1248),Vector(0,31,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(13571,9782,-941),Vector(0,81,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(13571,9782,-941),Vector(0,81,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_mine",Vector(13571,9782,-941),Vector(0,81,0),Vector(200,200,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_nkbabysoldier",Vector(6617,1712,-959),Vector(0,154,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[0].seeds.push(Seed("s_babysuicide",Vector(12959,2034,-1016),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	
	SPAWNLIST.push(SeedGroup());//----------> s1 soldier behind door next to tram
	SPAWNLIST[1].seeds.push(Seed("s_nksoldier",Vector(6720,-23,-959),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	
	SPAWNLIST.push(SeedGroup());//----------> s2 soldiers, mines, babysoldiers
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-14758,-9177,-63),Vector(0,19,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-8069,-10375,192),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-9078,-7053,128),Vector(0,271,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-6486,-8338,-115),Vector(0,64,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-6622,-7079,-96),Vector(0,-60,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-5377,-5413,192),Vector(0,183,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-6952,-5080,64),Vector(0,132,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-6510,-4185,192),Vector(0,35,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-9584,-2676,256),Vector(0,242,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-10014,-3235,64),Vector(0,296,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-8633,-2232,256),Vector(0,46,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-11520,780,64),Vector(0,311,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-12605,4168,64),Vector(0,270,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-12048,6911,64),Vector(0,292,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-10105,1994,64),Vector(0,87,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-9897,2334,64),Vector(0,95,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-10093,2756,64),Vector(0,82,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-12782,9767,320),Vector(0,322,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-13717,-1353,60),Vector(0,40,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-14624,-1957,192),Vector(0,320,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-12076,-1918,320),Vector(0,237,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-14935,-141,-447),Vector(0,180,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nksoldier",Vector(-14939,-524,-447),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-12556,480,40),Vector(0,89,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-12386,480,40),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-12183,478,40),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-11942,558,40),Vector(0,136,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-11805,696,40),Vector(0,134,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-11745,1008,40),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-11747,1303,40),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_babysuicide",Vector(-11747,1585,40),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-6938,-4512,512),Vector(0,359,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4712,256),Vector(0,90,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4583,256),Vector(0,89,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4456,256),Vector(0,89,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4327,256),Vector(0,89,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4200,256),Vector(0,89,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-8320,-4096,256),Vector(0,89,0),Vector(80,80,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1762,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1729,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1798,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1846,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1788,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1708,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1664,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1753,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1819,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_mine",Vector(-11568,1844,270),Vector(0,-142,0),Vector(170,170,0),Vector(0,360,0)));
	SPAWNLIST[2].seeds.push(Seed("s_nkbabysoldier",Vector(-8768,-1326,256),Vector(0,270,0),Vector(0,0,0),Vector(0,0,0)));
	
	SPAWNLIST.push(SeedGroup());//----------> s3 soldiers, mines, ikeaboxes
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(8364,672,2624),Vector(0,359,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(11447,2827,2496),Vector(0,269,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(9983,6551,3904),Vector(0,270,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(9582,11567,4160),Vector(0,181,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(5759,9979,4672),Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(5326,10742,9920),Vector(0,86,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(9514,11004,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nksoldier",Vector(10947,13013,10304),Vector(0,267,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9988,7423,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9988,7547,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9987,7674,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9987,7804,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9986,7938,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9988,8066,3904),Vector(0,90,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9169,8906,7428),Vector(0,153,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(8626,8813,7425),Vector(0,153,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(8095,8792,7423),Vector(0,153,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(7756,8779,7422),Vector(0,153,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(8162,8747,7468),Vector(0,40,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(8719,8805,7444),Vector(0,40,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_mine",Vector(9269,8922,7419),Vector(0,40,0),Vector(250,250,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(7648,-213,4032),Vector(0,87,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(7646,-283,4032),Vector(0,87,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(7643,-352,4032),Vector(0,87,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(7644,-439,4032),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(9265,9933,4160),Vector(0,314,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(10695,9927,4160),Vector(0,224,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_nkbabysoldier",Vector(8039,10622,4160),Vector(0,3,0),Vector(0,0,0),Vector(0,0,0)));
;	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(10332,9464,7450),Vector(0,121,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(10112,9616,7448),Vector(0,121,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(7452,9286,7700),Vector(0,180,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(7394,8221,7315),Vector(0,39,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(10983,8214,7315),Vector(0,144,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(11131,8226,7840),Vector(0,138,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_ikea_castlebox",Vector(11767,12045,8210),Vector(0,90,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_babysuicide",Vector(6258,10367,10120),Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_babysuicide",Vector(9469,10767,9736),Vector(0,270,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_babysuicide",Vector(9294,10825,9736),Vector(0,225,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_babysuicide",Vector(9657,10827,9736),Vector(0,315,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[3].seeds.push(Seed("s_babysuicide",Vector(9711,11007,9736),Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)));
	
	SPAWNLIST.push(SeedGroup());//----------> s3 gachi babyswarm
	SPAWNLIST[4].seeds.push(Seed("s_nkbabysoldier",Vector(8425,10072,8036),Vector(0,-58,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[4].seeds.push(Seed("s_nkbabysoldier",Vector(7764,10050,8002),Vector(0,-77,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[4].seeds.push(Seed("s_nkbabysoldier",Vector(7463,10051,8002),Vector(0,-77,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[4].seeds.push(Seed("s_nkbabysoldier",Vector(8791,10051,8003),Vector(0,-129,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[4].seeds.push(Seed("s_nkbabysoldier",Vector(8937,10313,8256),Vector(0,285,0),Vector(0,0,0),Vector(0,0,0)));
	
	SPAWNLIST.push(SeedGroup());//----------> s3 top babies
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8887,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8691,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8531,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8363,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8199,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	SPAWNLIST[5].seeds.push(Seed("s_nkbabysoldier",Vector(8023,11008,9792),Vector(0,179,0),Vector(0,0,0),Vector(0,0,0)));
	
}

function Spawn(index,interval)
{
	if(SPAWNLIST.len()>index&&SPAWNLIST[index].seeds.len()>0)
	{
		local time = 0.00;
		foreach(s in SPAWNLIST[index].seeds)
		{
			EntFire(s.name,"AddOutput","origin "+(s.position.x+(RandomInt(-s.position_random_offset.x,s.position_random_offset.x)))
			+" "+(s.position.y+(RandomInt(-s.position_random_offset.y,s.position_random_offset.y)))
			+" "+(s.position.z+(RandomInt(-s.position_random_offset.z,s.position_random_offset.z))),time,null);
			EntFire(s.name,"AddOutput","angles "+(s.rotation.x+(RandomInt(-s.rotation_random_offset.x,s.rotation_random_offset.x)))
			+" "+(s.rotation.y+(RandomInt(-s.rotation_random_offset.y,s.rotation_random_offset.y)))
			+" "+(s.rotation.z+(RandomInt(-s.rotation_random_offset.z,s.rotation_random_offset.z))),time,null);
			EntFire(s.name,"ForceSpawn","",time+interval,null);
			time += (interval*2);
		}
	}
}
function AddSeed(rpx,rpy,rpz,rrx,rry,rrz)
{
	local pos = activator.GetOrigin();pos.z+=64;
	SEEDLIST.push("SPAWNLIST[YYYYY].seeds.push(Seed(\"XXXXX\",Vector("+pos.x.tointeger()+","+pos.y.tointeger()+","
	+pos.z.tointeger()+"),Vector(0,"+activator.GetAngles().y.tointeger()+",0),Vector("+rpx.tointeger()
	+","+rpy.tointeger()+","+rpz.tointeger()+"),Vector("+rrx.tointeger()+","+rry.tointeger()+","+rrz.tointeger()+")));");
}
function ClearSeed(){SEEDLIST.clear();}
function UndoSeed(){SEEDLIST.remove(SEEDLIST.len()-1);}
function PrintSeed()
{
	if(SEEDLIST.len()==0)printl("========[ NO SEEDS PLACED, USE FUNCTION AddSeed(); ]========");
	else
	{
		printl("====================================================");
		printl("//XXXXX = name of the point_template (or env_entity_maker) which will be used for spawning");
		printl("//YYYYY = index of the seedgroup, the index starts at 0 and adds up for each group that is added");
		printl("//order matters, top of the code gets index 0, below that is index 1, below that is 2 (and so on)");
		printl("//add the code below in the Start(); function");
		printl("----------------------------------------------------");
		printl("SPAWNLIST.push(SeedGroup());//----------> COMMENT");
		foreach(seed in SEEDLIST){printl(seed);}
		printl("====================================================");
	}
}
SEEDLIST <- [];
SPAWNLIST <- [];
class Seed
{
	name = null;
	position = null;
	rotation = null;
	position_random_offset = null;
	rotation_random_offset = null;
	constructor(_name,_pos,_rot,_posrand,_rotrand)
	{
		name = _name;
		position = _pos;
		rotation = _rot;
		position_random_offset = _posrand;
		rotation_random_offset = _rotrand;
	}
}
class SeedGroup
{
	seeds = null;
	constructor(){seeds = [];}
}