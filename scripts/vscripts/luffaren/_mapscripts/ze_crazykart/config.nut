valid_v4<-true;//===============================================================\\
//==============================================================================\\
//ze_crazykart config
//this script is meant for server managers to tweak the map to their liking (the current values are default)
//this script can be changed in real-time and will take effect the next round
//if you're using this for your server:
//make sure this .nut file is located in the folder and named like this:
//==============================================================================\\
//		csgo/scripts/vscripts/luffaren/_mapscripts/ze_crazykart/config.nut		\\
//==============================================================================\\
//
//		RECOMMENDED SERVER SETTINGS FOR THE BEST PLAYER EXPERIENCE:
//      ------------------------------------------------------------
//		set or whitelist: 			sv_allow_thirdperson 1
//		set zombie spawn time: 		1 second 				(just as fast as possible really, you can't hurt eachother in spawn)
//		whitelist: 					cam_collision 0			(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					cam_idealpitch 0		(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					cam_idealyaw 0			(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					cam_idealdistright 0	(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					cam_idealdist 150		(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					cam_idealdistup 0		(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					thirdperson				(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					firstperson				(may be called through the map/point_clientcommand, passed from player clients)
//		whitelist: 					retry					(may be called through the map/point_clientcommand, passed from player clients)
//	
//==============================================================================\\

//	the amount of karts to spawn in the spawn-area (for example: if you have a 32-slot mg server, set this to 32)
KART_SPAWN_AMOUNT			<-					64;

//	kart health for race stages					(warning: don't go too high or you might risk a crash, stay under 1000 for safety)
KART_HEALTH_RACE 			<- 					200;

//	kart health for battle stages				(warning: don't go too high or you might risk a crash, stay under 1000 for safety)
KART_HEALTH_BATTLE			<- 					50;

//	kart health for star royale stages			(warning: don't go too high or you might risk a crash, stay under 1000 for safety)
KART_HEALTH_STARROYALE 		<- 					10;

//	kart health for F-zero stages				(warning: don't go too high or you might risk a crash, stay under 1000 for safety)
KART_HEALTH_FZERO 			<- 					100;

//	set this to "true" instead of "false" if you want to lock players in their karts and kill everyone who gets thrown off (good for MG)
KILL_NON_KART_PLAYERS 		<- 					false;

//	set this to "true" if you want the karts to automatically save last-grounded-checkpoints (if you have tp-to-checkpoint enabled)
KART_AUTO_CHECKPOINT_ENABLED <- 				true;

//	set the rate of how often the karts should automatically save their last-grounded-checkpoints (in seconds)
KART_AUTO_CHECKPOINT_RATE 	<- 					2.00;

//	set this to "false" instead of "true" if you want to NOT spawn thwomps
SPAWN_THWOMPS 				<- 					true;

//	set this to "false" instead of "true" if you want to NOT spawn itemboxes (does not apply for battle mode)
SPAWN_ITEMBOXES 			<- 					true;

//	set this to "false" instead of "true" if you want to NOT spawn rng-things across the stage (mushrooms+repair+stars)
SPAWN_RNG 					<- 					true;

//	set this to "true" (recommended) in order to make players automatically retry if the name cannot be read (prevents "userid-XXXX")
//  note: this will only affect players who were already connected to the server as it changed to this map
//  note: there's a safety-relay in this feature to only allow max 1 retry per player (since that should be enough to fix the name)
//	note: the "retry" command may need to be whitelisted for this in order to work, it will be called through a point_clientcommand with the player as !activator
RETRY_TO_FIX_NAMES			<-					false;

//  sets the zombie item (bomb thrower item, only available during the finale) usage cooldown in seconds
ZOMBIE_ITEM_COOLDOWN		<-					10.00;

//  sets the explosion damage for the kartexplosion + artillery + !boom + zombie bomb item (in general, not during the finale)
GENERAL_EXPLOSION_DAMAGE	<-					0;

//  sets the explosion damage-radius for the kartexplosion + artillery + !boom + zombie bomb item (in general, not during the finale)
GENERAL_EXPLOSION_RADIUS	<-					200;

//  set this to "true" if you always want to allow players being able to take damage and damage/infect other players while in a kart
ALLOW_DAMAGE_IN_KART		<-					false;

//	set this to "true" if you do not want players being able to hurt eachother (they may still take damage from other things)
DISALLOW_PVP_DAMAGE			<-					false;

//	set the needed player-percentage to pass the vote (relative to the amount of players on the server), 70.00 = 70% players must vote for it to pass
STARHUNTER_VOTES_NEEDED 	<- 					70.00;

//	set the scoreboard-bias for the RNG-starhunter pick (only the top-15 players can get picked as starhunter, but if none are valid, a 100% rng player gets it)
//	with a bigger bias-number, place #1 is more likely to get picked compared to place #15
//	with a lower bias-number, place #1 is not gonna be as biased, therefore place #15 might have a bigger chance to get picked
//  10 should be a good start value, it adds +10 chances for each placement, for example:
//  ----#15 gets +10 chances
//  ----#14 gets +20 chances
//  ----#01 gets +150 chances
//  it adds incentive to play/do well, and it doesn't completely lock other scoreboard-candidates out
STARHUNTER_SCORE_BIAS 		<- 					10;

//	set the amount of seconds the star hunter should wait at the starting line from the moment the race starts (so people don't get destroyed instantly)
STARHUNTER_START_WAIT_TIME 	<- 					10.00;

//	set the speed modifier for the star hunter, since he gets a star every ~10 seconds he'll get a lot of speed, use this to negate (or boost?) it
//	when a player gets a star, it adds +0.60 speed to their kart
//	by default this value is set to -0.50 to negate most of the extra speed, while still having just slightly more speed than a normal kart
//  to negate the star speed completely, just set this to -0.60
STARHUNTER_SPEED_MODIFIER 	<- 					-0.50;

//	set this to true if you want the starhunter to rant very angry things, it should add to the experience that you're being chased by someone
STARHUNTER_KONI_VOICE 		<- 					true;

//	set this to "true" if you only want CT's being able to win in the end (fit for zombie escape), set to "false" for other gamemodes
FINALE_ONLY_ALLOW_CT_WIN	<-					true;

//	amount of tries you have before aborting/skipping the finale (going back to the standard/free stage-vote mode)
FINALE_MAX_TRIES_UNTIL_SKIP	<-					6;

//	amount of tries you have before skipping the judgement + ZE defense part of the finale (going directly to the boss)
FINALE_MAX_TRIES_UNTIL_SKIP_TO_BOSS	<-			3;

//	set this to "true" if you want to skip/abort the finale if the players fail at the very, very end(lasers+final platform)
FINALE_SKIP_IF_REACHED_AND_FAILED_LASERS <-		false;

//	once a player reaches this score it will activate the finale-mode the upcoming round (if you don't want to enable the finale, just set it to 99999999)
FINALE_ACTIVATION_SCORE		<-					2000;

//	set this to "true" if you want to skip the judgement + ZE-defense part of the finale (aka just go straight to the boss)
FINALE_SKIP_TO_BOSS			<-					false;

//	set this to "true" if you want to skip the judgement + ZE-defense part of the finale (aka just go straight to the boss) IF the boss has been reached before
FINALE_SKIP_TO_BOSS_IF_REACHED	<-				true;

//	sets the amount of artillery strikes to spawn on each "scan" during the bossfight (integer), 0=disable, 1=one, 2=two(max)
FINALE_BOSS_ARTILLERY_AMOUNT	<-				2;

//	set this to true if you also want terrorists to get green shells + get targeted by boss (use "false" for ZE, set "true" if you want to teamwork CT's+T's)
//	setting this to "false" (default) makes the T's not get targeted by the boss, and will also give T's redshells+stars instead of green shells only (like ct's)
FINALE_BOSS_INCLUDE_T_IN_FIGHT	<-				false;

//	set the finale lasers min/max spawnrate in seconds ("jumplaser" = lasers you gotta jump, "laser" = vertical lasers you dodge left/right)
FINALE_LASER_TIMER_MIN			<-				0.20;
FINALE_LASER_TIMER_MAX			<-				2.00;
FINALE_JUMPLASER_TIMER_MIN		<-				1.50;
FINALE_JUMPLASER_TIMER_MAX		<-				7.00;

//  sets the explosion damage for the kartexplosion + artillery + !boom + zombie bomb item (only during finale)
FINALE_EXPLOSION_DAMAGE		<-					500;

//  sets the explosion damage-radius for the kartexplosion + artillery + !boom + zombie bomb item (only during finale)
FINALE_EXPLOSION_RADIUS		<-					200;

//	set this to "true" if you want to ensure that no items (shells/stars) can be used during the finale lasers
FINALE_DISALLOW_ITEMS_AT_LASERS	<-				false;

//	sets the rate which to tick sudden-death spawns in star royale, formula goes like: (active_karts / S7_SUDDEN_DEATH_RATE = tickrate)
S7_SUDDEN_DEATH_RATE		<-					10.0;

//	when it's star royale and it's only this amount of karts left (or under), start spawning bombs
S7_SUDDEN_DEATH_START		<-					20;

//	when it's star royale and it's only this amount of karts left (or under), start spawning artillery
S7_SUDDEN_DEATH_ARTILLERYSTART	<-				10;

//	set this to "true" in order to spawn a smoke particle on broken karts for better looks/effect (it costs 1 extra entity per broken kart, not much)
KARTDESTROYED_SMOKE_ENABLED <- 					true;

//	set the percentage chance to spawn a smoke particle on broken karts (between 0% - 100%), if it looks like too much/weird with 100%, lower it to 50/80 perhaps?
KARTDESTROYED_SMOKE_CHANCE 	<- 					100;

//	set the time (in seconds) that a spawned kart-smoke should stay active/alive
KARTDESTROYED_SMOKE_CLEANTIME <-				100.00;

//	sets the rate (seconds) in which to update the position-placement for players during a race (ITEMCHANCE_TIER_ENABLE must be "true" for this)
RACEPLACEMENT_UPDATE_RATE 	<- 					2.00;

//	set this to "true" in order to enable item-tier calculations (see below for more), if disabled it'll only use ITEMCHANCE_TIER_2 and ITEMCHANCE_TIER_BATTLE
ITEMCHANCE_TIER_ENABLE 		<- 					true;

//	set the item-tier borders for normal race-stages, there's 3 tiers in total that are given to players based on their lap/checkpoint placement:
//	> tier 1 (people up ahead)		- 	generally bad items, like bananas
//	> tier 2 (people in the middle)	- 	a default rng-mix in between
//	> tier 3 (people in the back)	- 	generally OP items, like stars
//	the two variables below define the borders between each tier, it's counted between 0-100 (percentage-wise)
//	by the default values it goes like this:
//	> 0  - 30  = tier 1
//	> 30 - 70  = tier 2
//	> 70 - 100 = tier 3
//	^and the percentage-value is calculated like this:	PERCENTAGE = (((player_placement) * 100) / (amount_of_active_karts))
//	EXAMPLE: if you're 7th place out of 44 racers:		PERCENTAGE = (((7) * 100) / (44))		*RESULT: 15.90* (aka tier 1, since it's between 0 - 30)
ITEM_TIER_FIRST 			<- 					30.00;
ITEM_TIER_LAST 				<- 					70.00;

//	set the item-chance pools for tier1, tier2, tier3 and tier-battle (see more about tiers above^)
//	do not touch the first value (on the left), only tweak the second value (on the right), higher value = bigger chance
//	this is basically how it's calculated/picked:
//	> the value on the left is the item-identifier value
//	> the value on the right is the amount of times to include the item-identifier value in an array
//	> when an itembox is picked up, a random element is picked from the array
//	> based on the amount of times the item-identifier value of a specific item was included (compared to others), the bigger the chance is for it to get picked
//	NOTE: in case something goes wrong in the tier-check, it will default to TIER_2
ITEMCHANCE_TIER_1 <- [//==========> for people up ahead, very low chance for good items
0	,	30	 ,//-----> artillery
2	,	200	 ,//-----> banana_1
3	,	80	 ,//-----> banana_3
4	,	20	 ,//-----> bomb
5	,	30	 ,//-----> feather
6	,	15	 ,//-----> ghost
7	,	10	 ,//-----> mushroom_1
8	,	7	 ,//-----> mushroom_3
9	,	60	 ,//-----> oil
10	,	1	 ,//-----> panic
11	,	50	 ,//-----> shellgreen_1
12	,	30	 ,//-----> shellgreen_3
13	,	25	 ,//-----> shellred_1
14	,	10	 ,//-----> shellred_3
15	,	1	 ,//-----> star
16	,	1	 ,//-----> thunder
21	,	100  ,//-----> fakeitembox
22	,	1   ];//-----> shellblue
ITEMCHANCE_TIER_2 <- [//==========> for people in the middle, a default/generally mixed item pool
0	,	30	 ,//-----> artillery
2	,	120	 ,//-----> banana_1
3	,	100	 ,//-----> banana_3
4	,	40	 ,//-----> bomb
5	,	60	 ,//-----> feather
6	,	30	 ,//-----> ghost
7	,	120	 ,//-----> mushroom_1
8	,	90	 ,//-----> mushroom_3
9	,	50	 ,//-----> oil
10	,	1	 ,//-----> panic
11	,	100	 ,//-----> shellgreen_1
12	,	90	 ,//-----> shellgreen_3
13	,	80	 ,//-----> shellred_1
14	,	70	 ,//-----> shellred_3
15	,	6	 ,//-----> star
16	,	3	 ,//-----> thunder
21	,	40   ,//-----> fakeitembox
22	,	10  ];//-----> shellblue
ITEMCHANCE_TIER_3 <- [//==========> for people in the back, very high chance for good items
0	,	10	 ,//-----> artillery
2	,	1	 ,//-----> banana_1
3	,	10	 ,//-----> banana_3
4	,	30	 ,//-----> bomb
5	,	35	 ,//-----> feather
6	,	15	 ,//-----> ghost
7	,	20	 ,//-----> mushroom_1
8	,	100	 ,//-----> mushroom_3
9	,	15	 ,//-----> oil
10	,	2	 ,//-----> panic
11	,	15	 ,//-----> shellgreen_1
12	,	40	 ,//-----> shellgreen_3
13	,	20	 ,//-----> shellred_1
14	,	100	 ,//-----> shellred_3
15	,	60	 ,//-----> star
16	,	4	 ,//-----> thunder
21	,	15   ,//-----> fakeitembox
22	,	20  ];//-----> shellblue
ITEMCHANCE_TIER_BATTLE <- [//==========> item pool for battle-mode, more aggressive items (no blue shell as it only works for races)
0	,	30	 ,//-----> artillery
2	,	120	 ,//-----> banana_1
3	,	100	 ,//-----> banana_3
4	,	40	 ,//-----> bomb
5	,	60	 ,//-----> feather
6	,	30	 ,//-----> ghost
7	,	120	 ,//-----> mushroom_1
8	,	90	 ,//-----> mushroom_3
9	,	50	 ,//-----> oil
10	,	1	 ,//-----> panic
11	,	100	 ,//-----> shellgreen_1
12	,	90	 ,//-----> shellgreen_3
13	,	80	 ,//-----> shellred_1
14	,	70	 ,//-----> shellred_3
15	,	10	 ,//-----> star
16	,	3	 ,//-----> thunder
21	,	40   ];//----> fakeitembox

//	set this to "true" if you want to disable ghost-mode when there's only one player in a race/f-zero race
DISABLE_GHOSTMODE			<-					false;

//	sets the score for being the first player driving into omar during the finale (which stops spawning the lasers)
SCORE_KILLED_OMAR			<-					500;

//	sets the score for being one of the surviving humans/CT's as the finale ends
SCORE_FINISHED_MAP			<-					500;

//	set this to "true" in order to prefer thirdperson while in karts, should serve as a better experience (players can type !kartcam to toggle their preference)
PREFER_THIRDPERSON			<-					true;

//  set this to "true" to hide HUD-elements (radar, chat, deathnotices, etc) during the 3-5 second intro as a race stage begins
HIDE_HUD_DURING_STAGEINTRO	<-					true;

//  set this to "true" if you want to automatically slay/punish players delaying/not driving/camping/trolling (race only)
PUNISH_INACTIVITY			<-					true;

//	set this to "true" if you want to automatically slay/punish players that are camping a single itembox/vicinity of itemboxes within a smaller radius (race only)
PUNISH_ITEMCAMPING			<-					true;

//	sets the unit radius range (not diameter) of what is considered a "vicinity of itemboxes" for the itemcamping punish
PUNISH_ITEMCAMPING_RANGE	<-					512;

//	sets the amount of itemboxes you need to pick up before getting punished (in the same vicinity), 3 is default, meaning that you'll die on the 3rd pickup
PUNISH_ITEMCAMPING_COUNT	<-					3;

//  set this to "true" (recommended) if you want to remove/clean dropped weapons from the map
CLEAN_DROPPED_WEAPONS		<-					true;

//	set this to one of the below numbers for various weapon-restrictions:
//	0:	restrict no weapons at all
//	1:	restrict all weapons except knife+bizon
//	2:	restrict all weapons except knife+glock
//	3:	restrict all weapons except knife
WEAPON_RESTRICT_MODE		<-					2;

//	same as "WEAPON_RESTRICT_MODE" above^ but only for the finale-portion of the map
WEAPON_RESTRICT_MODE_FINALE	<-					0;

//	set this to "true" to restrict/remove ALL weapons on a fast timer, in case you only want to race/drive (^RESTRICT_WEAPONS must be "true" for this to work)
RESTRICT_ALL_WEAPONS		<-					false;

//  tweak this to increase/decrease speed for karts in general, -0.20 would decrease speed by 20%, 0.70 would increase speed by 70%, etc
KART_SPEED_MODIFIER			<-					0.00;

//  set this to "false" if you do not want to enable/allow jumping with the normal karts
ENABLE_KART_JUMP			<-					true;

//  sets how often a player can manually jump with right-mouse while grounded (normal karts)
KART_JUMP_COOLDOWN			<-					0.50;

//  set this to "true" if you want to teleport karts back to spawn instead of exploding them when falling down during race-stages
KART_FALLDOWN_TP_TO_SPAWN	<-					true;

//  set this to "true" if you want to teleport karts back to the latest checkpoint instead of spawn (setting above^)
//  note: in order to use this, set this to "true" AND make sure to also set "KART_FALLDOWN_TP_TO_SPAWN" above^ to "true"
KART_FALLDOWN_TP_TO_LASTCP	<-					true;

//  set this to "true" if you want to enable kart honking/beeping when pressing left mouse button (only for normal karts)
KART_ALLOW_LMB_BEEP			<-					true;

//  the amount of jumps you need to perform in order to punish the player for bhopping
KART_BHOP_PUNISH_LIMIT		<-					3;

//  the cooldown for each jump in seconds (for the ^KART_BHOP_PUNISH_LIMIT counter)
KART_BHOP_PUNISH_COOLDOWN	<-					5.00;

//  the amount to slow down the kart on punish (0.30 would make the kart speed go from 1.00 to 0.70, for example)
KART_BHOP_PUNISH_SLOWAMOUNT	<-					0.30;

//  the time-amount to slow the kart down^ (in seconds)
KART_BHOP_PUNISH_SLOWTIME	<-					0.70;

//	sets the time window in which the players can press "W" for a boost, just as the green light shows (only race+fzero), set <= 0.00 to disable
STARTBOOST_TIMEWINDOW		<-					0.10;

//	set this to "true" in order to attempt fixing/preventing karts melting into the ground (experimental fix/workaround for a most-likely-unsolvable issue)
//  this will basically detect if a kart is melting into the ground and teleport the kart X units backwards, set this to "false" if bigger issues arise
//  if you notice that it teleports karts even when not ground-melting (perhaps when driving through other karts/items/certain areas), set this to "false"
KART_GROUNDMELT_TRY_FIX		<-					true;

//  sets the amount of health that should be drained as you manually boost (LMB) during F-zero races (after the first lap)
FZERO_BOOST_HP_DRAIN		<-					15;

//	set this to "true" if you want to not damage f-zero vehicles that hits the wall (not recommended if you want to stay true to f-zero)
FZERO_DISABLE_WALL_DAMAGE	<-					false;

//  sets the time-amount of how often you can use the LMB-boost during F-zero races (after the first lap)
FZERO_BOOST_COOLDOWN		<-					1.50;

//	set this to "true" if you want to allow the "!boom" chat command to be used during race mode
BOOM_RACE					<-					true;

//	set this to "true" if you want to allow the "!boom" chat command to be used during battle mode
BOOM_BATTLE					<-					true;

//	set this to "true" if you want to allow the "!boom" chat command to be used during star royale mode
BOOM_STARROYALE				<-					false;

//	set this to "true" if you want to allow the "!boom" chat command to be used during f-zero mode
BOOM_FZERO					<-					false;

//	set this to "true" if you want to allow the "!boom" chat command to be used during the finale (activates once you enter the main boss arena with karts)
//  "false" is recommended as you most likely want damage to be enabled during the finale, in order to make zombie items/boss attacks work
BOOM_FINALE					<-					false;

//	set the "!boom" chat command cooldown (in seconds)
BOOM_COMMAND_COOLDOWN		<-					10.00
