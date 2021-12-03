iLevel <- 1; //Start Level
bReplaceKnife <- true; //Change Knife

iNumLaser <- 0;
iNumCrystall <- 0;
iNumSphere <- 0;
iBossStady <- 0;
bZMDetect <- false;
hLaserMaker <- null;
hCrystallSpawner <- null;
hSphereMaker <- null;

bLaser1 <- false;
bLaser2 <- false;
bLaser3 <- false;
bLaser4 <- false;

bSphere <- false;

function RoundInit()
{
	EntFire("consola","Command","mp_roundtime 60",0.0,null);
	//Fog
	EntFire("xmas_fog","SetColor","20 185 255",0.0,null);
	EntFire("xmas_fog","SetStartDist","4096",0.0,null);
	EntFire("xmas_fog","SetEndDist","10240",0.0,null);
	
	bZMDetect = false;
	GetLevel();
	if(bReplaceKnife) EntFireByHandle(self, "RunScriptCode", "ReplaceKnife();", 1.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(0);", 2.0, null, null);
	Laser_Disable();
	bSphere = false;
}

function AdminSet1()
{
	SetLevel(1);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(3);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet2()
{
	SetLevel(2);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(4);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet3()
{
	SetLevel(3);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(5);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet4()
{
	SetLevel(4);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(6);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet5()
{
	SetLevel(5);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(7);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet6()
{
	SetLevel(6);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(8);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function AdminSet7()
{
	SetLevel(7);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(9);", 0.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(2);", 4.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillAll();", 4.0, null, null);
}

function SetLevel(iNextLevel)
{
	if(iNextLevel == 1)
	{
		SpawnPoints1();
		iLevel = 1;
	}else if(iNextLevel == 2)
	{
		SpawnPoints1();
		iLevel = 2;
	}else if(iNextLevel == 3)
	{
		SpawnPoints2();
		iLevel = 3;
	}else if(iNextLevel == 4)
	{
		SpawnPoints1();
		iLevel = 4;
	}else if(iNextLevel == 5)
	{
		SpawnPoints1();
		iLevel = 5;
	}else if(iNextLevel == 6)
	{
		SpawnPoints1();
		iLevel = 6;
	}else if(iNextLevel == 7)
	{
		SpawnPoints1();
		iLevel = 7;
	}
}

function GetLevel()
{
	if(iLevel == 1)
	{
		Level_Relay1();
	}else if(iLevel == 2)
	{
		Level_Relay2();
	}else if(iLevel == 3)
	{
		Level_Relay3();
	}else if(iLevel == 4)
	{
		Level_Relay4();
	}else if(iLevel == 5)
	{
		Level_Relay5();
	}else if(iLevel == 6)
	{
		Level_Relay6();
	}else if(iLevel == 7)
	{
		Level_Relay7();
	}
}

function Level_Relay1()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigoblue_hdr",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_321_sky","Toggle","",0.0,null);
	EntFire("sky_pilire","Break","",0.0,null);
	//Level1 Special
	EntFire("hradba_template","Kill","",0.0,null); //бомба из пушки на 1 локе
	EntFire("zaslep_2lvl","Kill","",0.0,null);	// блок дыры на верх, где 2 итема
	EntFire("zombie_barbossat_knife","Kill","",0.0,null); //итем барбосса
	EntFire("jack_track_train","Kill","",0.0,null);//дорога джека на 2 лвл
	EntFire("jack_model","Kill","",0.0,null); //++
	EntFire("jack_track*","Kill","",0.0,null); //++
	EntFire("trigger_first_2","Kill","",0.0,null); // триггер перед первым мостом после спавна
	
	EntFire("zed_mapa3","Break","",0.0,null); //дверь в подвал
	
	EntFire("level1_konec","Enable","",0.0,null); // релей переключатель уровня
	EntFire("otevreni_barak","Enable","",0.0,null); // триггер открывает дверь в резеденцию
	EntFire("dvere_zavesnici_barak","Enable","",0.0,null); //триггер открывает дверь в сад
	EntFire("trigger_predpevnosti","Enable","",0.0,null); //триггер закрытия и открытия дверей у каннона
	EntFire("anti_spawn_pf_2","Enable","",0.0,null); //триггер фикс антибага спавна во 2 зоне
	
	EntFire("port_level1","Trigger","",0.0,null); //спавн итемов в рандомном месте
	EntFire("prekazka_most1","Lock","",0.0,null); //дверь направо блокировка
	
	EntFire("template_jacklvl1","ForceSpawn","",0.0,null); //финальный джек
	EntFire("template_mapa_1-3","ForceSpawn","",0.0,null); //спавнер уровня
		//dvere1-двери выхода справа в зону где 2 итема 
		//ohen_mapa_1-3 - партикли факелов в подвале
		//dvere_mapa333 - первые двери на 3 спавне
		//prekazka - забор открытия из зоны где 2 итема
		//mapa2_door1 и mapa2_door2 - двери выхода из зоны где 2 итема в сад 
		//doors1 - двери в сад
		//doors2 - двери к повозке
	EntFire("template_mapa_1-3_2","ForceSpawn","",0.0,null); //спавнер уровня
		//dlazka_finale - дверь в люк в конце 2 лвл
		//dvere_barak_3 - дверь из резеденции
		//white_house_door - дверь к итему в резеденции
		//nastaveni_pevnost_trigger - триггер в комнате в резеденции
		//dvere_barak_2 - дверь в комнату в резеденции
		//vchod_2mapa - дверь в сторону 3 лвл из сада
		//padaci_most_pada2 - мост на 3 лвл
		//3lvl_kolo - крутилка для моста
		//brana_padaci - дверь блока моста
		//padaci_most_pada - rotor для моста
		//door_barak - входные двери в резеденцию
	EntFire("mapacast1-2","ForceSpawn","",0.5,null); //спавнер уровня
		//pevnost_zatarasa - решётка к колокольчикам
		//vrata1 - двери к висилице
		//kolo11 - вращалка у колеса на тележке
		//kolo2 - вторая вращалка у колеса на тележке
		//kola_kocar - колёса у тележки
		//vozik_kone - сама тележка
		//kone - кони у тележки
		//vozik_2 - конечная точка для тележки
		//vozik_jedna - начальная точка для тележки
		//dverekdelu - ворота для каннона
		//vezeni_bedny - деревянные ящики перед тюрьмой джека
		//zed - каменная стена перед чёрной жемчужиной
	EntFire("template_level1_2","ForceSpawn","",1.0,null); //спавнер уровня
		//ohen_level1_2 - партикли фикелов в стороне лошади
		//kone_temp - кони в конюшне
		//vesnice - триггер открывающие забор где 2 итема
		//level2_multiple_score - триггер награды в конце 2 лвл
		//hurt_antizm - триггер детект зомби в конце 2 лвл
		//level2_multiple - странный триггер на активацию других триггеров при прикосновении в конце 2 лвл
		//konec2_zombie_hp - убийство зомбей за барикадами в конце 2 лвл
	
	EntFire("ohen_level1_2","Start","",5.0,null); //партикль факелов в стороне лошади +запуск
	EntFire("ohen_mapa_1-3","Start","",5.0,null); //партикль факелов в подвале +запуск
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(10);", 10.0, null, null);
	
	EntFire("zacatek_mp3","PlaySound","",16.0,null);
	EntFire("xmas_hud_stage","AddOutput","message Level 1 - Black Pearl",1.0,null);
}

function Level_Relay2()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigo",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_321_sky","Toggle","",0.0,null);
	EntFire("sky_pilire","Break","",0.0,null);
	
	EntFire("hradba_template","Kill","",0.0,null); //L1
	EntFire("zombie_barbossat_knife","Kill","",0.0,null); //L1
	EntFire("trigger_first_2","Kill","",0.0,null); //L1
	
	EntFire("zataras_kone","Disable","",0.0,null); // стенка перед тележкой
	EntFire("kone","Kill","",1.0,null); //L1
	EntFire("kone_start","Kill","",0.0,null); //Триггер для запуска тележки
	EntFire("vozik_kone","Kill","",1.0,null); //L1
	
	EntFire("delo_buttons1","Kill","",0.1,null); //Кнопка у пушки где висилица
	EntFire("delo_buttons2","Kill","",0.1,null); //Кнопка у пушки где висилица
	EntFire("delo_buttons3","Kill","",0.1,null); //Кнопка у пушки где висилица
	EntFire("delo_buttons4","Kill","",0.1,null); //Кнопка у пушки где висилица

	//EntFire("zed_mapa3","Break","",0.0,null);
	
	EntFire("anti_spawn_pf_2","Enable","",0.0,null); //L1
	EntFire("trigger_spoust_boss_pevnost","Enable","",0.0,null); //Триггер босса каннона
	EntFire("level_2_win","Enable","",0.0,null); //релей перехода уровня
	EntFire("trigger_predpevnosti","Disable","",0.0,null); //L1
	
	EntFire("port_level2","Trigger","",0.0,null); //спавн итемов
	EntFire("prekazka_most2","Lock","",0.0,null); //блокировка двери налево
	
	EntFire("template_mapa_1-3","ForceSpawn","",0.0,null); //L1
	EntFire("template_mapa_1-3_2","ForceSpawn","",0.0,null); //L1
	EntFire("mapacast1-2","ForceSpawn","",0.0,null); //L1
	EntFire("template_level1_2","ForceSpawn","",1.0,null); //L1
	EntFire("template_boss_lvl2","ForceSpawn","",3.5,null); //спавнер босса
		//track_boss_1 track_boss_2 track_boss_3 track_boss_4 track_boss_5 track_boss_6 - треки
		//kolo1 - колёса
		//Delo_spousteni - триггер толкашки
		//delo_cast_2 - моделька босса получающая дамаг
		//delo_cast_1 - моделька босса получающая дамаг
		//Delo_strelba - пушер зомби
		//viko_delo_boss - заглушка дула
		//Delo_bosss - основа движения паровозик
		//particle_boss_dead - партикль взрыва
	
	EntFire("ohen_level1_2","Start","",5.0,null); //L1
	EntFire("ohen_mapa_1-3","Start","",5.0,null); //L1
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(11);", 10.0, null, null);
	
	EntFire("zacatek_mp3","PlaySound","",16.0,null);
	EntFire("xmas_hud_stage","AddOutput","message Level 2 - Cannon",1.0,null);
}

function Level_Relay3()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigoblue_hdr",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_321_sky","Toggle","",0.0,null);
	EntFire("voda_spawn_sky","Toggle","",1.0,null);
	EntFire("sky_barak","Break","",0.0,null);
	EntFire("sky_pilire","Break","",0.0,null);
	
	EntFire("hradba_template","Kill","",0.0,null); //L1
	EntFire("zombie_barbossat_knife","Kill","",0.0,null); //L1
	EntFire("jack_track_train","Kill","",0.0,null); //L1
	EntFire("jack_model","Kill","",0.0,null); //L1
	EntFire("jack_track*","Kill","",0.0,null); //L1
	EntFire("trigger_first_2","Kill","",0.0,null); //L1
	EntFire("zaslep_2lvl","Kill","",0.0,null); //L1
	
	EntFire("anti_spawn_pf","Enable","",0.0,null); //Фикс спавна на 1 респе
	EntFire("level_34_win","Enable","",0.0,null); //релей победы и переключения уровня на 3 лвл
	EntFire("mapa3_hold","Enable","",0.0,null); //триггер открытия дверей из сада
	EntFire("3_lvl_dverevesnice","Enable","",0.0,null); //триггер открытия дверей из зоны где 2 итема
	EntFire("zombie_hp_timer","Enable","",10.0,null); //глобал хп зомби раз в 1 сек
	
	EntFire("port_level3","Trigger","",0.0,null); //спавн итемов
	EntFire("prekazka_most1","Lock","",0.0,null); //L1
	
	EntFire("template_mapa_1-3","ForceSpawn","",0.0,null); //L1
	EntFire("template_mapa_1-3_2","ForceSpawn","",0.0,null); //L1
	EntFire("mapa2_template1","ForceSpawn","",0.0,null); //спавнер уровня
	//mapa2_ohen - факела
	//lod1_dvere1 - двери корабля наверху
	//lod1_dvere2 - двери корабля внизу
	//pirates_port_3level - триггер телепорта с корабля
	//pirate_stred_stredu - ландмарк
	//level34_multiple_score - триггер вина с назначением награды
	//hurt34_antizm - триггер антизм в конце
	//level34_multiple - странный триггер на активацию в конце
	//jeskyne_door - дверь в финальную комнату
	//pirate_konec_break - дверь после босса
	//pirate_zmmrize - дверь в зомби клетку
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(12);", 10.0, null, null);
	
	EntFire("mapa2_ohen","Start","",5.0,null);
	EntFire("ohen_mapa_1-3","Start","",5.0,null); //L1
	
	EntFire("consola","Command","zr_infect_spawntime_min 14",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_max 14",0.5,null);
	
	EntFire("mapa2_hudba1","PlaySound","",8.0,null);
	EntFire("xmas_hud_stage","AddOutput","message Level 3 - SnowMaiden",1.0,null);
}

function Level_Relay4()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigoblue_hdr",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_44_55_2_sky","Toggle","",0.0,null);
	EntFire("sky_barak","Break","",0.0,null);
	
	EntFire("jack_track_train","Kill","",0.0,null); //L1
	EntFire("jack_model","Kill","",0.0,null); //L1
	EntFire("jack_track*","Kill","",0.0,null); //L1
	EntFire("lvl5_1","Kill","",0.0,null); //музыка на 5 лвл
	EntFire("lvl5_2","Kill","",0.0,null); //музыка на 5 лвл
	EntFire("lvl5_3_kraken","Kill","",0.0,null); //музыка на 5 лвл
	EntFire("trigger_first_2","Kill","",0.0,null); //L1
	EntFire("zatarasa_spawn","Kill","",19.0,null); //стенка виннер спавн
	
	EntFire("zatarasa_predvesnici","Break","",0.0,null); //ящики на мосте
	EntFire("dvere_mapa3","Break","",0.0,null); //двери в сторону 4-5 лвл в подвале
	EntFire("zombie_barbossa_vchod","Break","",20.0,null); //дверь к барбоссе итем
	
	EntFire("anti_spawn_pf_2","Enable","",0.0,null); //L1
	EntFire("zombie_hp_timer","Enable","",10.0,null); //L3
	EntFire("barbossa_port_antilide","Enable","",0.0,null); //триггер тп анти барбосса за людей
	EntFire("level_4_win","Enable","",0.0,null); //релей смены уровня
	
	EntFire("port_level5","Trigger","",0.0,null); //спавн итемов
	Action_Spawn_Medalion(); //спавн медальки в рандомном месте
	EntFire("prekazka_most1","Lock","",0.0,null); //L1
	
	EntFire("mapa4_template","ForceSpawn","",0.2,null); //спавн уровня
	//jail_mapa_zm - зомби клетка
	//mapa3_schody_break - лесенка
	//barbossa_start - триггер барбоссы-босса
	//once_2 - триггер в здание барбоссы
	//swordbar5 swordbar4 swordbar3 swordbar2 swordbar1 - мечи hpbar барбоссы
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(13);", 10.0, null, null);
	
	EntFire("ohen_4_4","Start","",5.0,null); //факела на уровне где борбосса
	EntFire("ohen_4_5","Start","",5.0,null); //факела в стороне 4-5 лвл
	
	EntFire("consola","Command","zr_infect_mzombie_ratio 7",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_min 10",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_max 10",0.5,null);
	
	EntFireByHandle(self, "RunScriptCode", "ZM_AutoHeal();", 20.00, null, null);
	
	EntFire("lvl4_1","PlaySound","",1.0,null);
	EntFire("xmas_hud_stage","AddOutput","message Level 4 - Bad Santa",1.0,null);
}

function Level_Relay5()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigoblue_hdr",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_44_55_2_sky","Toggle","",0.0,null);
	EntFire("sky_barak","Break","",0.0,null);
	
	EntFire("jack_track_train","Kill","",0.0,null); //L1
	EntFire("jack_model","Kill","",0.0,null); //L1
	EntFire("jack_track*","Kill","",0.0,null); //L1
	EntFire("trigger_first","Kill","",0.0,null); //триггер перед первым мостом после спавна пускает бомбы
	EntFire("level4_multiple","Kill","",0.0,null); //странный триггер запускающий вин 4 лвл
	EntFire("lvl4_1","Kill","",0.0,null); //музыка 4 лвл
	EntFire("lvl4_2","Kill","",0.0,null); //музыка 4 лвл
	EntFire("utok2_push_god","Kill","",5.0,null); //триггер пуша на год кракене
	EntFire("zatarasa_spawn","Kill","",19.0,null); //L4
	
	EntFire("dvere_mapa3","Break","",0.0,null); //L4
	EntFire("zatarasa_predvesnici","Break","",0.0,null); //L4
	EntFire("zombie_barbossa_vchod","Break","",20.0,null); //L4
	
	EntFire("anti_spawn_pf_2","Enable","",0.0,null); //L1
	EntFire("zombie_hp_timer","Enable","",10.0,null); //L3
	EntFire("barbossa_port_antilide","Enable","",0.0,null); //L4
	EntFire("kraken_zacatek","Enable","",0.0,null); //релей атак кракена
	EntFire("lvl_5_kraken_cesta","Enable","",0.0,null); //релей кракена у моста
	EntFire("once_5","Enable","",0.0,null); //триггер открывающий путь в сторону 5 лвл
	EntFire("level_5_win","Enable","",0.0,null); //релей вина и смены уровня
	
	EntFire("port_level5","Trigger","",0.0,null); //L4
	Action_Spawn_Medalion(); //L4
	EntFire("prekazka_most1","Lock","",0.0,null); //L1
	
	EntFire("template_spawn_5_5","ForceSpawn","",0.5,null); //спавнер уровня
	//plachta4 - корабль с кракеном
	//cannons - пушки на корабле с кракеном
	//fire5 - факела
	EntFire("jack_final_template","ForceSpawn","",0.5,null); //спавнер джека в конце 5 лвл
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(14);", 10.0, null, null);
	
	EntFire("ohen_4_5","Start","",5.0,null); //L4
	EntFire("fire5","Start","",5.0,null); //факела 5 лвл
	
	EntFire("consola","Command","zr_infect_mzombie_ratio 7",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_min 8",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_max 8",0.5,null);
	
	EntFireByHandle(self, "RunScriptCode", "ZM_AutoHeal();", 20.00, null, null);
	
	EntFire("lvl5_1","PlaySound","",1.0,null);
	EntFire("xmas_hud_stage","AddOutput","message Level 5 - True Santa",1.0,null);
}

function Level_Relay6()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname vertigoblue_hdr",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_44_55_2_sky","Toggle","",0.0,null);
	EntFire("sky_barak","Break","",0.0,null);
	
	//Color Correction
	Xmas_Color_Correction(0);
	
	//Убираем нпс джека
	EntFire("jack_track_train","Kill","",0.0,null);
	EntFire("jack_model","Kill","",0.0,null);
	EntFire("jack_track*","Kill","",0.0,null);
	//убираем первый триггер
	EntFire("trigger_first","Kill","",0.0,null);
	EntFire("trigger_first_2","Kill","",0.0,null);
	//триггер фикс антибага спавна во 2 зоне
	EntFire("anti_spawn_pf_2","Enable","",0.0,null);
	//ящики на мосте
	EntFire("zatarasa_predvesnici","Break","",0.0,null);
	//Триггер для запуска тележки
	EntFire("kone_start","Kill","",0.0,null);
	//Триггер 1 лвл активировать 4 пушки
	EntFire("trigger_predpevnosti","Kill","",0.0,null);
	//Триггер 2 лвл активатор каннона
	EntFire("trigger_spoust_boss_pevnost","Kill","",0.0,null);
	//Счётчик 4 пушек
	EntFire("dela:counter","Kill","",0.0,null);
	EntFire("delo_buttons1","Kill","",0.1,null);
	EntFire("delo_buttons2","Kill","",0.1,null);
	EntFire("delo_buttons3","Kill","",0.1,null);
	EntFire("delo_buttons4","Kill","",0.1,null);
	//Телепорт людей на 1 лвл в клетку
	EntFire("port_perla_ct","Kill","",0.0,null);
	//Триггер 35к хп у канона
	EntFire("health_35000","Kill","",0.0,null);
	//Партикль тп на остров
	EntFire("osvetleni","Kill","",0.0,null);
	//Триггер тп на остров
	EntFire("teleport_ostrov","Kill","",0.0,null);
	//Триггер ТП на центр где едет каннон
	EntFire("afk_mise_perla","Kill","",0.0,null);
	//Триггер для двери где 2 итема(3 лвл)
	EntFire("3_lvl_dverevesnice","Kill","",0.0,null);
	//Триггер в резеденцию
	EntFire("otevreni_barak","Kill","",0.0,null);
	//Триггер дверь в сад
	EntFire("dvere_zavesnici_barak","Kill","",0.0,null);
	//Триггер дверей в сад из шотката где 2 итема
	EntFire("xmas_lvl6_t_lvl3sad","Kill","",0.0,null);
	//Триггер в комнату в бараке
	EntFire("xmas_lvl6_t_lvl1barak","Kill","",0.0,null);
	//Килияем музыку на боссе 3 уровня
	EntFire("mapa2_boss_attack","Kill","",0.0,null);
	EntFire("mapa2_hudba2","Kill","",0.0,null);
	EntFire("konec3","Kill","",0.0,null);
	//Киляем музыку 4 лвл
	EntFire("lvl4_1","Kill","",0.0,null);
	EntFire("lvl4_2","Kill","",0.0,null);
	EntFire("lvl4_3","Kill","",0.0,null);
	EntFire("lvl4_4","Kill","",0.0,null);
	//Киляем музыку 5 лвл
	EntFire("lvl5_1","Kill","",0.0,null);
	EntFire("lvl5_2","Kill","",0.0,null);
	EntFire("lvl5_3_kraken","Kill","",0.0,null);
	EntFire("lvl5_4","Kill","",0.0,null);
	EntFire("lvl5_5","Kill","",0.0,null);
	//Киляем стенку виннеров со спавна
	EntFire("zatarasa_spawn","Kill","",19.0,null);
	//триггер тп анти барбосса за людей
	EntFire("barbossa_port_antilide","Enable","",0.0,null);
	//дверь к барбоссе итем
	EntFire("zombie_barbossa_vchod","Break","",20.0,null);
	EntFire("utok2_push_god","Kill","",5.0,null); //триггер пуша на год кракене
	
	//спавн начала(1-2 лвл)
	EntFire("xmas_lvl6_spawner","ForceSpawn","",3.0,null);
	
	EntFire("template_mapa_1-3","ForceSpawn","",0.0,null);
	EntFire("template_mapa_1-3_2","ForceSpawn","",0.0,null);
	EntFire("dlazka_finale","Kill","",1.0,null);
	EntFire("nastaveni_pevnost_trigger","Kill","",1.0,null);
	
	EntFire("mapacast1-2","ForceSpawn","",0.5,null);
	EntFire("vozik_kone","Kill","",1.0,null);
	EntFire("vozik_jedna","Kill","",1.5,null);
	EntFire("vozik_2","Kill","",1.5,null);
	EntFire("vezeni_bedny","Kill","",1.0,null);
	EntFire("zed","Kill","",1.0,null);	
	
	EntFire("template_level1_2","ForceSpawn","",1.0,null);
	EntFire("level2_multiple_score","Kill","",1.5,null);
	EntFire("hurt_antizm","Kill","",1.5,null);
	EntFire("level2_multiple","Kill","",1.5,null);
	EntFire("konec2_zombie_hp","Kill","",1.5,null);
	EntFire("vesnice","Kill","",1.5,null);
	
	//спавн итемов
	Action_Spawn_Medalion();
	EntFire("port1_plot","AddOutput","origin -4949 9940 -888",0.0,null);
	EntFire("port2_mec","AddOutput","origin -4949 10020 -888",0.0,null);
	EntFire("port3_sud","AddOutput","origin -4949 10080 -888",0.0,null);
	EntFire("port4_buble","AddOutput","origin -4949 10140 -888",0.0,null);
	EntFire("port5_heal","AddOutput","origin -4949 10200 -888",0.0,null);
	
	EntFire("port1_plot","ForceSpawn","",0.5,null);
	EntFire("port2_mec","ForceSpawn","",0.5,null);
	EntFire("port3_sud","ForceSpawn","",0.5,null);
	EntFire("port4_buble","ForceSpawn","",0.5,null);
	EntFire("port5_heal","ForceSpawn","",0.5,null);

	EntFire("port_ostrov_predkoncem_trigger","AddOutput","target xmas_aftercannon_afk",1.0,null);
	
	//Изменение дамага боссами
	EntFire("barbossa_hurt_boss","AddOutput","damage 320",2.0,null);
	EntFire("utok_boss_hurt","AddOutput","damage 200",2.0,null);
	
	//Факела
	EntFire("ohen_mapa_1-3","Start","",5.0,null);
	EntFire("ohen_level1_2","Start","",5.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(15);", 10.0, null, null);
	
	EntFire("consola","Command","zr_infect_mzombie_ratio 7",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_min 8",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_max 8",0.5,null);
	
	EntFireByHandle(self, "RunScriptCode", "ZM_AutoHeal();", 20.00, null, null);
	
	//Музыка
	EntFire("xmas_mm","RunScriptCode","SetMusic(0);",1.0,null);
	EntFire("xmas_mm","RunScriptCode","TickFunc();",1.5,null);
	
	EntFire("xmas_hud_stage","AddOutput","message Level 6 - Christmas Day",1.0,null);
	
	//снег
	EntFire("xmas_snow_spawner","ForceSpawn","",0.7,null);
}

function Level_Relay7()
{
	//Change Skybox
	EntFire("Change_Skybox_Texture","AddOutput","skyboxname ze_pirates_xmas_stripper_fix/tealspace",0.0,null);
	EntFire("Change_Skybox_Texture","Trigger","",0.01,null);
	EntFire("voda_44_55_2_sky","Toggle","",0.0,null);
	EntFire("sky_barak","Break","",0.0,null);
	
	//Fog
	EntFire("xmas_fog","SetColor","10 10 10",0.5,null);
	EntFire("xmas_fog","SetStartDist","300",0.5,null);
	EntFire("xmas_fog","SetEndDist","1500",0.5,null);
	
	//Color Correction
	Xmas_Color_Correction(1);
	
	//Убираем нпс джека
	EntFire("jack_track_train","Kill","",0.0,null);
	EntFire("jack_model","Kill","",0.0,null);
	EntFire("jack_track*","Kill","",0.0,null);
	//убираем первый триггер
	EntFire("trigger_first","Kill","",0.0,null);
	EntFire("trigger_first_2","Kill","",0.0,null);
	//триггер фикс антибага спавна во 2 зоне
	EntFire("anti_spawn_pf_2","Enable","",0.0,null);
	//ящики на мосте
	EntFire("zatarasa_predvesnici","Break","",0.0,null);
	//Триггер для запуска тележки
	EntFire("kone_start","Kill","",0.0,null);
	//Триггер 1 лвл активировать 4 пушки
	EntFire("trigger_predpevnosti","Kill","",0.0,null);
	//Триггер 2 лвл активатор каннона
	EntFire("trigger_spoust_boss_pevnost","Kill","",0.0,null);
	//Счётчик 4 пушек
	EntFire("dela:counter","Kill","",0.0,null);
	EntFire("delo_buttons1","Kill","",0.1,null);
	EntFire("delo_buttons2","Kill","",0.1,null);
	EntFire("delo_buttons3","Kill","",0.1,null);
	EntFire("delo_buttons4","Kill","",0.1,null);
	//Телепорт людей на 1 лвл в клетку
	EntFire("port_perla_ct","Kill","",0.0,null);
	//Триггер 35к хп у канона
	EntFire("health_35000","Kill","",0.0,null);
	//Партикль тп на остров
	EntFire("osvetleni","Kill","",0.0,null);
	//Триггер тп на остров
	EntFire("teleport_ostrov","Kill","",0.0,null);
	//Триггер ТП на центр где едет каннон
	EntFire("afk_mise_perla","Kill","",0.0,null);
	//Триггер для двери где 2 итема(3 лвл)
	EntFire("3_lvl_dverevesnice","Kill","",0.0,null);
	//Триггер в резеденцию
	EntFire("otevreni_barak","Kill","",0.0,null);
	//Триггер дверь в сад
	EntFire("dvere_zavesnici_barak","Kill","",0.0,null);
	//Триггер дверей в сад из шотката где 2 итема
	EntFire("xmas_lvl6_t_lvl3sad","Kill","",0.0,null);
	//Триггер в комнату в бараке
	EntFire("xmas_lvl6_t_lvl1barak","Kill","",0.0,null);
	//Килияем музыку на боссе 3 уровня
	EntFire("mapa2_boss_attack","Kill","",0.0,null);
	EntFire("mapa2_hudba2","Kill","",0.0,null);
	EntFire("konec3","Kill","",0.0,null);
	//Киляем музыку 4 лвл
	EntFire("lvl4_1","Kill","",0.0,null);
	EntFire("lvl4_2","Kill","",0.0,null);
	EntFire("lvl4_3","Kill","",0.0,null);
	EntFire("lvl4_4","Kill","",0.0,null);
	//Киляем музыку 5 лвл
	EntFire("lvl5_1","Kill","",0.0,null);
	EntFire("lvl5_2","Kill","",0.0,null);
	EntFire("lvl5_3_kraken","Kill","",0.0,null);
	EntFire("lvl5_4","Kill","",0.0,null);
	EntFire("lvl5_5","Kill","",0.0,null);
	//Киляем стенку виннеров со спавна
	EntFire("zatarasa_spawn","Kill","",19.0,null);
	//триггер тп анти барбосса за людей
	EntFire("barbossa_port_antilide","Enable","",0.0,null);
	//дверь к барбоссе итем
	EntFire("zombie_barbossa_vchod","Break","",20.0,null);
	EntFire("utok2_push_god","Kill","",5.0,null); //триггер пуша на год кракене
	
	//спавн начала(1-2 лвл)
	EntFire("xmas_lvl6_spawner","ForceSpawn","",3.0,null);
	
	EntFire("template_mapa_1-3","ForceSpawn","",0.0,null);
	EntFire("template_mapa_1-3_2","ForceSpawn","",0.0,null);
	EntFire("dlazka_finale","Kill","",1.0,null);
	EntFire("nastaveni_pevnost_trigger","Kill","",1.0,null);
	
	EntFire("mapacast1-2","ForceSpawn","",0.5,null);
	EntFire("vozik_kone","Kill","",1.0,null);
	EntFire("vozik_jedna","Kill","",1.5,null);
	EntFire("vozik_2","Kill","",1.5,null);
	EntFire("vezeni_bedny","Kill","",1.0,null);
	EntFire("zed","Kill","",1.0,null);	
	
	EntFire("template_level1_2","ForceSpawn","",1.0,null);
	EntFire("level2_multiple_score","Kill","",1.5,null);
	EntFire("hurt_antizm","Kill","",1.5,null);
	EntFire("level2_multiple","Kill","",1.5,null);
	EntFire("konec2_zombie_hp","Kill","",1.5,null);
	EntFire("vesnice","Kill","",1.5,null);
	
	//спавн итемов
	Action_Spawn_Medalion();
	EntFire("port1_plot","AddOutput","origin -4949 9940 -888",0.0,null);
	EntFire("port2_mec","AddOutput","origin -4949 10020 -888",0.0,null);
	EntFire("port3_sud","AddOutput","origin -4949 10080 -888",0.0,null);
	EntFire("port4_buble","AddOutput","origin -4949 10140 -888",0.0,null);
	EntFire("port5_heal","AddOutput","origin -4949 10200 -888",0.0,null);
	
	EntFire("port1_plot","ForceSpawn","",0.5,null);
	EntFire("port2_mec","ForceSpawn","",0.5,null);
	EntFire("port3_sud","ForceSpawn","",0.5,null);
	EntFire("port4_buble","ForceSpawn","",0.5,null);
	EntFire("port5_heal","ForceSpawn","",0.5,null);

	EntFire("port_ostrov_predkoncem_trigger","AddOutput","target xmas_aftercannon_afk",1.0,null);
	
	//Изменение дамага боссами
	EntFire("barbossa_hurt_boss","AddOutput","damage 220",2.0,null);
	EntFire("utok_boss_hurt","AddOutput","damage 200",2.0,null);
	
	//Факела
	EntFire("ohen_mapa_1-3","Start","",5.0,null);
	EntFire("ohen_level1_2","Start","",5.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "MesToChat(1);", 5.0, null, null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(16);", 10.0, null, null);
	
	EntFire("consola","Command","zr_infect_mzombie_ratio 7",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_min 8",0.5,null);
	EntFire("consola","Command","zr_infect_spawntime_max 8",0.5,null);
	
	EntFireByHandle(self, "RunScriptCode", "ZM_AutoHeal();", 20.00, null, null);
	
	//Музыка
	EntFire("xmas_mm","RunScriptCode","SetMusic(13);",1.0,null);
	EntFire("xmas_mm","RunScriptCode","TickFunc();",1.5,null);
	
	EntFire("xmas_hud_stage","AddOutput","message Level 7 - Christmas Night",1.0,null);
	
	//снег
	EntFire("xmas_snow_spawner","ForceSpawn","",0.7,null);
	
	//Инициализация экстрима
	EntFire("xmas_lvl7_spawner","ForceSpawn","",5.5,null);
	
	//Инициализация Кристаллов
	iNumCrystall = 0;
	hCrystallSpawner = Entities.FindByName(null, "xmas_crystall_spawner");
	EntFireByHandle(self, "RunScriptCode", "Make_Crystall_Human(8, 100);", 10.00, null, null);
	
	//Инициализация лазеров
	iNumLaser = 0;
	hLaserMaker = Entities.FindByName(null, "xmas_laser_maker");
	
	//Инициализация сфер
	iNumSphere = 0;
	hSphereMaker = Entities.FindByName(null, "xmas_sphere_maker");
	
	EntFireByHandle(self, "RunScriptCode", "FLaser1(1);", 30.00, null, null);
}

function Xmas_Color_Correction(iCCor)
{
	if(iCCor==0)
	{
		EntFire("xmas_colorcorrection_blue","Enable","",0.00,null);
		EntFire("xmas_colorcorrection_dark","Disable","",0.00,null);
		EntFire("xmas_colorcorrection_glitch","Disable","",0.00,null);
	}else if(iCCor==1)
	{
		EntFire("xmas_colorcorrection_blue","Disable","",0.00,null);
		EntFire("xmas_colorcorrection_dark","Enable","",0.00,null);
		EntFire("xmas_colorcorrection_glitch","Disable","",0.00,null);
	}else if(iCCor==2)
	{
		EntFire("xmas_colorcorrection_blue","Disable","",0.00,null);
		EntFire("xmas_colorcorrection_dark","Disable","",0.00,null);
		EntFire("xmas_colorcorrection_glitch","Enable","",0.00,null);
	}
}

function Laser_Disable()
{
	bLaser1 = false;
	bLaser2 = false;
	bLaser3 = false;
	bLaser4 = false;
}

function FLaser1(iState)
{
	if(iState == 1)
	{
		bLaser1 = true;
		Laser_Case1();
	} else bLaser1 = false
}

function Laser_Case1()
{
	if(bLaser1)
	{
		//Лазера
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,10560,-882), Vector(0,180,0));", 0.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,10560,-862), Vector(0,180,0));", 0.05, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,10560,-842), Vector(0,180,0));", 0.10, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,10560,-822), Vector(0,180,0));", 0.15, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,10560,-802), Vector(0,180,0));", 0.20, null, null);
		
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,9700,-882), Vector(0,180,0));", 0.25, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,9700,-862), Vector(0,180,0));", 0.30, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,9700,-842), Vector(0,180,0));", 0.35, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,9700,-822), Vector(0,180,0));", 0.40, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(1, Vector(-7450,9700,-802), Vector(0,180,0));", 0.45, null, null);
		//Звук
		EntFire("xmas_laser_sound","PlaySound","",0.0,null);
		//Повтор
		EntFireByHandle(self, "RunScriptCode", "Laser_Case1();", 2.00, null, null);
	}
}

function FLaser2(iState)
{
	if(iState == 1)
	{
		bLaser2 = true;
		Laser_Case2();
	} else bLaser2 = false
}

function Laser_Case2()
{
	if(bLaser2)
	{
		//Лазера
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(2, Vector(-5810,10090,-890), Vector(0,180,0));", 0.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(2, Vector(-5810,10090,-870), Vector(0,180,0));", 0.05, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(2, Vector(-5810,10090,-850), Vector(0,180,0));", 0.10, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(2, Vector(-5810,10090,-830), Vector(0,180,0));", 0.15, null, null);
		
		//Звук
		EntFire("xmas_laser_sound","PlaySound","",0.0,null);
		//Повтор
		EntFireByHandle(self, "RunScriptCode", "Laser_Case2();", 2.00, null, null);
	}
}

function FLaser3(iState)
{
	if(iState == 1)
	{
		bLaser3 = true;
		Laser_Case3();
	} else bLaser3 = false
}

function Laser_Case3()
{
	if(bLaser3)
	{
		//Лазера
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(4, Vector(-3632,2968,-78), Vector(0,90,0));", 0.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(4, Vector(-3632,2968,-114), Vector(0,90,0));", 0.05, null, null);
		
		//Звук
		EntFire("xmas_laser_sound","PlaySound","",0.0,null);
		//Повтор
		EntFireByHandle(self, "RunScriptCode", "Laser_Case3();", 0.50, null, null);
	}
}

function FLaser4(iState)
{
	if(iState == 1)
	{
		bLaser4 = true;
		Laser_Case4();
	} else bLaser4 = false
}

function Laser_Case4()
{
	if(bLaser4)
	{
		//Лазера
		local iRandLaser = RandomInt(0,1);
		if(iRandLaser == 1) EntFireByHandle(self, "RunScriptCode", "Make_Laser(6, Vector(5137,4672,-365), Vector(0,180,0));", 0.00, null, null);
		else EntFireByHandle(self, "RunScriptCode", "Make_Laser(6, Vector(5137,4672,-335), Vector(0,180,0));", 0.00, null, null);
		
		//Звук
		EntFire("xmas_laser_sound","PlaySound","",0.0,null);
		//Повтор
		EntFireByHandle(self, "RunScriptCode", "Laser_Case4();", 1.80, null, null);
	}
}

function Action_Trigger_Laser1()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(3, Vector(-4982,8296,-400), Vector(0,90,0));", 1.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(3, Vector(-4982,8296,-380), Vector(0,90,0));", 1.05, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(3, Vector(-4982,8296,-360), Vector(0,90,0));", 1.10, null, null);
	
	//Звук
	EntFire("xmas_laser_sound","PlaySound","",1.0,null);
}

function Action_Trigger_Laser2()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(3, Vector(-3654,3454,-114), Vector(0,90,0));", 2.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(3, Vector(-3654,3454,-84), Vector(0,90,0));", 2.05, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",2.0,null);
}

function Action_Trigger_Laser3()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(5, Vector(-7474,2019,-114), Vector(0,0,0));", 1.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(5, Vector(-7474,2019,-84), Vector(0,0,0));", 1.05, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",1.0,null);
	
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(5, Vector(-7474,2019,-114), Vector(0,0,0));", 5.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(5, Vector(-7474,2019,-84), Vector(0,0,0));", 5.05, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",5.0,null);
}

function Action_Trigger_Laser4()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(7, Vector(-3744,5952,-261), Vector(0,0,0));", 0.00, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",0.0,null);
}

function Action_Trigger_Laser5()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(8, Vector(-1224,14038,-795), Vector(0,270,0));", 0.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(8, Vector(-1224,14038,-775), Vector(0,270,0));", 0.05, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(8, Vector(-1224,14038,-755), Vector(0,270,0));", 0.10, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(8, Vector(-1224,14038,-735), Vector(0,270,0));", 0.15, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(8, Vector(-1224,14038,-715), Vector(0,270,0));", 0.20, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",0.0,null);
}

function Action_Trigger_Laser6()
{
	//Лазера
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(9, Vector(8372,14536,-899), Vector(0,180,0));", 0.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(9, Vector(8372,14536,-879), Vector(0,180,0));", 0.05, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(9, Vector(8372,14536,-859), Vector(0,180,0));", 0.10, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(9, Vector(8372,14536,-839), Vector(0,180,0));", 0.15, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Laser(9, Vector(8372,14536,-819), Vector(0,180,0));", 0.20, null, null);

	//Звук
	EntFire("xmas_laser_sound","PlaySound","",0.0,null);
}

function Make_Laser(iTL, vPos, vAng)
{
	//InitLaser
	iNumLaser++;
	if(iNumLaser > 25) iNumLaser = 0;
	if(iTL == 1)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -2600",0.01,null);
		EntFire("laser_door","AddOutput","speed 1300",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",2.03,null);
	}else if(iTL == 2)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -600",0.01,null);
		EntFire("laser_door","AddOutput","speed 600",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",1.03,null);
	}else if(iTL == 3)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -700",0.01,null);
		EntFire("laser_door","AddOutput","speed 1400",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",0.53,null);
	}else if(iTL == 4)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -300",0.01,null);
		EntFire("laser_door","AddOutput","speed 1200",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",0.28,null);
	}else if(iTL == 5)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -900",0.01,null);
		EntFire("laser_door","AddOutput","speed 900",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",1.03,null);
	}else if(iTL == 6)
	{
		EntFire("laser_hurt","AddOutput","damage 400",0.01,null);
		EntFire("laser_door","AddOutput","lip -1000",0.01,null);
		EntFire("laser_door","AddOutput","speed 1000",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",1.03,null);
	}else if(iTL == 7)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -2200",0.01,null);
		EntFire("laser_door","AddOutput","speed 1100",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",2.03,null);
	}else if(iTL == 8)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -500",0.01,null);
		EntFire("laser_door","AddOutput","speed 1000",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",0.53,null);
	}else if(iTL == 9)
	{
		EntFire("laser_hurt","AddOutput","damage 999999",0.01,null);
		EntFire("laser_door","AddOutput","lip -375",0.01,null);
		EntFire("laser_door","AddOutput","speed 750",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",0.53,null);
	}else if(iTL == 10)
	{
		EntFire("laser_hurt","AddOutput","damage 200",0.01,null);
		EntFire("laser_door","AddOutput","lip -2000",0.01,null);
		EntFire("laser_door","AddOutput","speed 1000",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",2.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",4.03,null);
	}else if(iTL == 11)
	{
		EntFire("laser_hurt","AddOutput","damage 100",0.01,null);
		EntFire("laser_door","AddOutput","lip -1000",0.01,null);
		EntFire("laser_door","AddOutput","speed 500",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.03,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",2.03,null);
	}else if(iTL == 12)
	{
		EntFire("laser_hurt","AddOutput","damage 120",0.01,null);
		EntFire("laser_door","AddOutput","lip -1500",0.01,null);
		EntFire("laser_door","AddOutput","speed 1000",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.53,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",2.03,null);
		EntFire("laser_prop","AddOutput","rendercolor 255 0 0",0.01,null);
	}else if(iTL == 13)
	{
		EntFire("laser_hurt","AddOutput","damage 120",0.01,null);
		EntFire("laser_door","AddOutput","lip -1500",0.01,null);
		EntFire("laser_door","AddOutput","speed 1000",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.53,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",2.03,null);
	}else if(iTL == 14)
	{
		EntFire("laser_hurt","AddOutput","damage 120",0.01,null);
		EntFire("laser_door","AddOutput","lip -400",0.01,null);
		EntFire("laser_door","AddOutput","speed 800",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.53,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",1.03,null);
	}else if(iTL == 15)
	{
		EntFire("laser_hurt","AddOutput","damage 120",0.01,null);
		EntFire("laser_door","AddOutput","lip -1500",0.01,null);
		EntFire("laser_door","AddOutput","speed 500",0.01,null);
		EntFire("laser_door"+iNumLaser.tostring(),"Open","",0.53,null);
		EntFire("laser_main"+iNumLaser.tostring(),"Kill","",3.53,null);
	}
	
	//CreateLaser
	EntFire("laser_hurt","AddOutput","targetname laser_hurt"+iNumLaser.tostring(),0.02,null);
	EntFire("laser_prop","AddOutput","targetname laser_prop"+iNumLaser.tostring(),0.02,null);
	EntFire("laser_door","AddOutput","targetname laser_door"+iNumLaser.tostring(),0.02,null);
	EntFire("laser_main","AddOutput","targetname laser_main"+iNumLaser.tostring(),0.02,null);

	if(vAng.x == 0 || vAng.x == 180)
	{
		if(vAng.y == 0 || vAng.y == 180)
		{
			if(vAng.z == 0 || vAng.z == 180)
			{
				EntFire("laser_hurt","AddOutput","mins -24 -256 -4",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 24 256 4",0.01,null);
			}else
			{
				EntFire("laser_hurt","AddOutput","mins -24 -4 -256",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 24 4 256",0.01,null);
			}
		}else
		{
			if(vAng.z == 0 || vAng.z == 180)
			{
				EntFire("laser_hurt","AddOutput","mins -256 -24 -4",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 256 24 4",0.01,null);
			}else
			{
				EntFire("laser_hurt","AddOutput","mins -4 -24 -256",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 4 24 256",0.01,null);
			}
		}
	}else
	{
		if(vAng.y == 0 || vAng.y == 180)
		{
			if(vAng.z == 0 || vAng.z == 180)
			{
				EntFire("laser_hurt","AddOutput","mins -4 -256 -24",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 4 256 24",0.01,null);
			}else
			{
				EntFire("laser_hurt","AddOutput","mins -256 -4 -24",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 256 4 24",0.01,null);
			}
		}else
		{
			if(vAng.z == 0 || vAng.z == 180)
			{
				EntFire("laser_hurt","AddOutput","mins -256 -4 -24",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 256 4 24",0.01,null);
			}else
			{
				EntFire("laser_hurt","AddOutput","mins -4 -256 -24",0.01,null);
				EntFire("laser_hurt","AddOutput","maxs 4 256 24",0.01,null);
			}
		}
	}
	
	EntFireByHandle(self, "RunScriptCode", "hLaserMaker.SpawnEntityAtLocation(Vector("+vPos.x.tostring()+","+vPos.y.tostring()+","+vPos.z.tostring()+"),Vector("+vAng.x.tostring()+","+vAng.y.tostring()+","+vAng.z.tostring()+"));", 0.00, null, null);
}

function Make_Crystall(vOrigin, iDamage, fWait)
{
	iNumCrystall++;
	if(iNumCrystall > 35) iNumCrystall = 0;
	hCrystallSpawner.SetOrigin(vOrigin);
	EntFire("xmas_crystall_spawner","ForceSpawn","",0.01,null);
	
	EntFire("crystall_hurt","AddOutput","damage "+iDamage.tostring(),0.02,null);
	
	EntFire("crystall_hurt","AddOutput","targetname crystall_hurt"+iNumCrystall.tostring(),0.03,null);
	EntFire("crystall_door","AddOutput","targetname crystall_door"+iNumCrystall.tostring(),0.03,null);
	
	EntFire("crystall_door"+iNumCrystall.tostring(),"Open","",fWait+0.04,null);
	EntFire("crystall_door"+iNumCrystall.tostring(),"Kill","",fWait+2.04,null);	
}

function Make_Crystall_Human(iCount,iDam)
{
	local iHumans = 0;
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetTeam() == 3) && (p.GetHealth() > 0)) iHumans++;
	}
	if(iHumans>0)
	{
		local iCountSet = 0;
		if(iCount > 0) iCountSet = iCount;
		else iCountSet = iHumans/3;
		local iCurCount = 0;
		while(iCurCount < iCountSet)
		{
			iCurCount++;
			local iCurHuman = 1;
			local iRandHuman = RandomInt(1,iHumans);
			while(null != (p = Entities.FindByClassname(p,"player")))
			{
				if((p.IsValid()) && (p.GetTeam() == 3) && (p.GetHealth() > 0))
				{
					if(iCurHuman == iRandHuman)
					{
						local vGetOrigin = p.GetOrigin();
						EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector("+vGetOrigin.x.tostring()+","+vGetOrigin.y.tostring()+","+(vGetOrigin.z+400).tostring()+"), "+iDam.tostring()+", 2.0);", iCurCount/2, null, null);
						EntFire("xmas_crystall_sound","PlaySound","",iCurCount/2+2.0,null);
						break;
					}
					iCurHuman++;
				}
			}
		}
	}
}

function Make_Sphere(iAl)
{
	local iFi = iAl-180;
	local fX = 1656 + 1000*cos(3.14159/180*iFi);
	local fY = -12184 + 1000*sin(3.14159/180*iFi);
	iNumSphere++;
	if(iNumSphere > 50) iNumSphere = 0;
	hSphereMaker.SpawnEntityAtLocation(Vector(fX,fY,-992),Vector(0,iAl,0));
	EntFire("sphere_main","AddOutput","targetname sphere_main"+iNumSphere.tostring(),0.01,null);
	EntFire("sphere_door","AddOutput","targetname sphere_door"+iNumSphere.tostring(),0.01,null);
	EntFire("sphere_door"+iNumSphere.tostring(),"Open","",0.02,null);
	EntFire("sphere_main"+iNumSphere.tostring(),"Kill","",4.02,null);
}

function Sphere_Spam()
{
	if(bSphere)
	{
		local iRSphere = RandomInt(90,270);
		Make_Sphere(iRSphere);
		EntFireByHandle(self, "RunScriptCode", "Sphere_Spam();", 0.25, null, null);
	}
}

function Sphere_Init(iSI)
{
	if(iSI == 0)
	{
		bSphere = false;
	}else
	{
		bSphere = true;
		EntFireByHandle(self, "RunScriptCode", "Sphere_Spam();", 0.1, null, null);
	}
}

function Action_Boss_Attack()
{
	if(iBossStady == 0) //Cannon
	{
		local iRandAttack = RandomInt(0,2);
		if(iRandAttack == 0)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Crystalls");
			Make_Crystall_Human(10,180);
		}else if(iRandAttack == 1)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Lasers");
			local iLaserRand = RandomInt(0,2);
			if(iLaserRand == 0)
			{
				Make_Laser(10, Vector(-10424,1525,125), Vector(0,270,0));
			}else if(iLaserRand == 1)
			{
				Make_Laser(10, Vector(-9912,1525,125), Vector(0,270,0));
			}else if(iLaserRand == 2)
			{
				Make_Laser(10, Vector(-9400,1525,125), Vector(0,270,0));
			}
			iLaserRand = RandomInt(0,2);
			if(iLaserRand == 0)
			{
				Make_Laser(10, Vector(-10424,1525,160), Vector(0,270,0));
			}else if(iLaserRand == 1)
			{
				Make_Laser(10, Vector(-9912,1525,160), Vector(0,270,0));
			}else if(iLaserRand == 2)
			{
				Make_Laser(10, Vector(-9400,1525,160), Vector(0,270,0));
			}
			EntFire("xmas_laser_sound","PlaySound","",2.0,null);
		}else if(iRandAttack == 2)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Bad Overlay");
			EntFire("xmas_lvl7_attack_overlay","StartOverlays","",0.0,null);
			EntFire("xmas_lvl7_attack_overlay","StopOverlays","",5.0,null);
		}
	}else if(iBossStady == 1) //SnowMaiden
	{
		local iRandAttack = RandomInt(0,1);
		if(iRandAttack == 0)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Crystalls");
			Make_Crystall_Human(0,280);
		}else if(iRandAttack == 1)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Bad Overlay");
			EntFire("xmas_lvl7_attack_overlay","StartOverlays","",0.0,null);
			EntFire("xmas_lvl7_attack_overlay","StopOverlays","",12.0,null);
		}
	}else if(iBossStady == 2) //Bad Santa
	{
		local iRandAttack = RandomInt(0,2);
		if(iRandAttack == 0)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Crystalls");
			Make_Crystall_Human(8,100);
		}else if(iRandAttack == 1)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Bad Overlay");
			EntFire("xmas_lvl7_attack_overlay","StartOverlays","",0.0,null);
			EntFire("xmas_lvl7_attack_overlay","StopOverlays","",3.0,null);
		}else if(iRandAttack == 2)
		{
			ScriptPrintMessageChatAll(" \x0B[\x04Hurt\x0B]\x01 Boss used\x03 Lasers From Fireplace");
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(11, Vector(-1272,14624,-790), Vector(0,180,0));", 2.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(11, Vector(-1272,14110,-790), Vector(0,180,0));", 2.00, null, null);
			EntFire("xmas_laser_sound","PlaySound","",2.0,null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(11, Vector(-1272,14624,-750), Vector(0,180,0));", 4.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(11, Vector(-1272,14110,-750), Vector(0,180,0));", 4.00, null, null);
			EntFire("xmas_laser_sound","PlaySound","",4.0,null);
		}
	}
}

function Action_Trigger_First()
{
	EntFire("consola","Command","say >>> GATE OPENS IN 30 SEC <<<",0.0,null);
	EntFire("prvni_dvere","Open","",30.0,null);
	EntFire("consola","Command","say >>> GATE OPENING <<<",30.0,null);
	EntFire("prekazka_most1","Open","",40.0,null);
	
	EntFire("anti_medailon_hurt","Enable","",45.0,null);
	EntFire("teleport_afk_trigger","Enable","",48.0,null);
	
	//Убираем лишний снег
	EntFire("xmas_snow1","Kill","",48.0,null);
	EntFire("xmas_snow2","Kill","",48.0,null);
	EntFire("xmas_snow3","Kill","",48.0,null);
	EntFire("xmas_snow4","Kill","",48.0,null);
	EntFire("xmas_snow5","Kill","",48.0,null);
	
	EntFire("fire_start_1","Start","",0.0,null);
	
	//Бомбы-подарочки
	EntFire("hradba_template","ForceSpawn","",0.0,null);
	EntFire("hradba_template","ForceSpawn","",2.0,null);
	EntFire("hradba_template","ForceSpawn","",4.0,null);
	EntFire("hradba_template","ForceSpawn","",6.0,null);
	EntFire("hradba_template","ForceSpawn","",8.0,null);
	EntFire("hradba_template","ForceSpawn","",10.0,null);
	EntFire("hradba_template","ForceSpawn","",12.0,null);
	EntFire("hradba_template","ForceSpawn","",14.0,null);
	EntFire("hradba_template","ForceSpawn","",16.0,null);
	EntFire("hradba_template","ForceSpawn","",18.0,null);
	EntFire("hradba_template","ForceSpawn","",20.0,null);
	EntFire("hradba_template","ForceSpawn","",22.0,null);
	EntFire("hradba_template","ForceSpawn","",24.0,null);
	EntFire("hradba_template","ForceSpawn","",26.0,null);
	EntFire("hradba_template","ForceSpawn","",28.0,null);
	EntFire("hradba_template","ForceSpawn","",30.0,null);
	
	if(iLevel == 7)
	{
		FLaser1(0);
		FLaser2(1);
		EntFireByHandle(self, "RunScriptCode", "FLaser2(0);", 16.50, null, null);
	}
}

function Action_Trigger_Two_Items()
{
	EntFire("consola","Command","say >>> DOOR OPENS IN 15 SEC <<<",0.0,null);
	EntFire("dvere1","Open","",15.0,null);
	EntFire("consola","Command","say >>> DOOR CLOSES IN 20 SEC <<<",15.0,null);
	EntFire("consola","Command","say >>> DOOR CLOSES IN 10 SEC <<<",25.0,null);
	EntFire("dvere1","Close","",35.0,null);
	EntFire("dvere1","Open","",44.0,null);
}

function Action_Trigger_From_Two_Items()
{
	EntFire("consola","Command","say >>> DEFEND THE VILLAGE FOR 40 SEC! <<<",10.0,null);
	EntFire("consola","Command","say >>> 10 SECONDS REMAINING <<<",40.0,null);
	EntFire("prekazka","Open","",50.0,null);
	EntFire("consola","Command","say >>> RUN! <<<",50.0,null);
	EntFire("consola","Command","say >>> RUN! <<<",50.1,null);
	if(iLevel == 6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(1);",50.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(14);",50.0,null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-5040,5592,204), 999999, 15.0);", 37.50, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4976,5592,204), 999999, 14.0);", 38.50, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4912,5592,204), 999999, 13.0);", 39.50, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4848,5592,204), 999999, 12.0);", 40.50, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4784,5592,204), 999999, 11.0);", 41.50, null, null);
		EntFire("xmas_crystall_sound","PlaySound","",52.5,null);
		
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-5040,5240,220), 999999, 15.0);", 41.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4976,5240,220), 999999, 14.0);", 42.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4912,5240,220), 999999, 13.0);", 43.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4848,5240,220), 999999, 12.0);", 44.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "Make_Crystall(Vector(-4784,5240,220), 999999, 11.0);", 45.00, null, null);
		EntFire("xmas_crystall_sound","PlaySound","",56.0,null);
	}
}

function Action_Trigger_To_Cannon()
{
	EntFire("consola","Command","say >>> DOOR OPENS IN 15 SEC <<<",0.0,null);
	EntFire("dira_pevnost_brush","Enable","",0.0,null);
	EntFire("zataras_kone","Disable","",0.0,null);
	EntFire("doors2","Open","",15.0,null);
	
	if(iLevel == 7)
	{
		EntFireByHandle(self, "RunScriptCode", "Action_Trigger_Laser2();", 17.00, null, null);
		EntFireByHandle(self, "RunScriptCode", "FLaser3(1);", 21.00, null, null);
	}
}

function Action_Trigger_Gate_Cannon()
{
	EntFire("consola","Command","say >>> GATE IS CLOSING IN 30 SEC <<<",0.0,null);
	EntFire("consola","Command","say >>> GATE IS CLOSING IN 5 SEC <<<",25.0,null);
	EntFire("vrata1","Close","",30.0,null);
	EntFire("consola","Command","say >>> GATE IS CLOSING! <<<",30.0,null);
	
	EntFire("template_boss_lvl2","ForceSpawn","",31.0,null);
	
	EntFire("trigger_jennuz","Enable","",32.0,null);
	EntFire("zataras_ubosse","Toggle","",33.0,null);
	EntFire("port_lamy","Enable","",33.0,null);
	EntFire("port_lamy","Disable","",33.2,null);
	
	EntFire("dverekdelu","Break","",35.0,null);
	EntFire("kolo1","Start","",35.0,null);
	EntFire("Delo_bosss","StartForward","",35.0,null);
	
	EntFire("port_lamy","Kill","",36.0,null);
	
	EntFire("teleport_afk_2","Enable","",32.0,null);
	
	//Убираем лишний снег
	EntFire("xmas_snow6","Kill","",32.0,null);
	EntFire("xmas_snow8","Kill","",32.0,null);
	EntFire("xmas_snow9","Kill","",32.0,null);
	
	if(iLevel == 7)
	{
		iBossStady = 0;
		EntFire("xmas_lvl7_attack_timer","RefireTime","7.0",30.0,null);
		EntFire("xmas_lvl7_attack_timer","ResetTimer","",30.5,null);
		EntFire("xmas_lvl7_attack_timer","Enable","",31.0,null);
	}
}

function Action_Trigger_After_Cannon()
{
	EntFire("consola","Command","say >>> CANNON HAS BEEN DESTROYED <<<",0.0,null);
	EntFire("Delo_strelba","Kill","",0.0,null);
	EntFire("Delo_spousteni","Kill","",0.0,null);
	EntFire("Delo_bosss","Stop","",0.0,null);
	EntFire("kolo1","Stop","",0.0,null);
	EntFire("viko_delo_boss","Break","",0.0,null);
	EntFire("delo_cast_2","Break","",0.0,null);
	EntFire("particle_boss_dead","Start","",0.0,null);
	EntFire("ct_jail_lamy","Kill","",5.0,null);
	
	EntFire("vrata1","Open","",7.0,null);
	if(iLevel == 6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(2);",0.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(15);",0.0,null);
		EntFire("xmas_lvl7_attack_timer","Disable","",0.0,null);
	}
	if(iLevel==6 || iLevel==7)
	{
		EntFire("trigger_jennuz","Kill","",0.0,null);
		EntFire("xmas_lvl6_t_tpfcannon","Enable","",1.0,null);
		EntFireByHandle(self, "RunScriptCode", "TPFix_Cannon_ZM();", 1.10, null, null);
		EntFire("xmas_lvl6_t_tpfcannon","Disable","",6.0,null);
		EntFire("xmas_lvl6_t_acannon","Enable","",6.2,null);
		EntFire("consola","Command","say >>> GATE OPENS IN 5 SEC <<<",2.0,null);
		EntFire("consola","Command","say >>> GATE OPENING <<<",7.0,null);
		EntFire("dira_pevnost_brush","Disable","",7.0,null);
		EntFire("pevnost_zatarasa","Toggle","",12.0,null);
		
		EntFire("teleport_afk_trigger","AddOutput","target xmas_cannon_zm",0.0,null);
		EntFire("teleport_afk_2","Disable","",0.5,null);
	} else
	{
		EntFire("boss_sound_shoot","Volume","0",0.0,null);
		EntFire("boss_sound_dead","PlaySound","",0.0,null);
		EntFire("cesta2","Kill","",0.0,null);
		EntFire("osvetleni","LightOn","",0.0,null);
		EntFire("teleport_ostrov","Enable","",0.0,null);
		EntFire("pevnost_zatarasa","Toggle","",0.0,null);

		EntFire("consola","Command","say >>> RUN TO THE ISLAND <<<",1.0,null);
		EntFire("consola","Command","say >>> RUN TO THE ISLAND <<<",1.0,null);
		
		EntFire("jack_model","SetAnimation","run",1.5,null);
		EntFire("jack_track_train","StartForward","",1.5,null);
	}
}

function Action_Trigger_Once_After_Cannon()
{
	EntFire("doors2","Close","",1.0,null);
	EntFire("prekazka","Close","",2.0,null);
	EntFire("dvere1","Close","",3.0,null);
	
	EntFire("dvere_barak_3","Open","",4.0,null);
	
	EntFire("consola","Command","say >>> GRILLE OPENS IN 15 SEC <<<",0.0,null);
	EntFire("zataras_ubosse","Kill","",15.0,null);
}

function Action_Trigger_Barak()
{
	EntFire("consola","Command","say >>> DOOR OPENS IN 30 SEC <<<",0.0,null);
	EntFire("consola","Command","say >>> DOOR OPENS IN 10 SEC <<<",20.0,null);
	EntFire("consola","Command","say >>> AFK TELEPORT IN 20 SEC <<<",1.0,null);
	EntFire("mapa3_hold","Enable","",5.0,null);
	EntFire("dvere_barak_2","Open","",30.0,null);
	EntFire("door_barak","Open","",30.0,null);
	
	//спавним 3 уровень
	EntFire("mapa2_template1","ForceSpawn","",10.0,null);
	EntFire("level34_multiple_score","Kill","",15.0,null);
	EntFire("hurt34_antizm","Kill","",15.0,null);
	EntFire("level34_multiple","Kill","",15.0,null);
	
	EntFire("port_ostrov_predkoncem_trigger","Enable","",21.0,null);
	
	//Факела
	EntFire("mapa2_ohen","Start","",15.0,null);
	
	//Убираем лишний снег
	EntFire("xmas_snow10","Kill","",21.0,null);
	EntFire("xmas_snow11","Kill","",21.0,null);
	
	//Оптимизация
	EntFire("Delo_bosss","Kill","",22.0,null);
	EntFire("cesta2","Kill","",22.0,null);
	EntFire("kusss","Kill","",22.0,null);
	EntFire("delo_boss_hity","Kill","",22.0,null);
	EntFire("track_boss_1","Kill","",25.0,null);
	EntFire("track_boss_2","Kill","",25.0,null);
	EntFire("track_boss_3","Kill","",25.0,null);
	EntFire("track_boss_4","Kill","",25.0,null);
	EntFire("track_boss_5","Kill","",25.0,null);
	EntFire("track_boss_6","Kill","",25.0,null);
	
	if(iLevel == 7)
	{
		EntFire("mapa3_hold","AddOutput","OnStartTouch xmas_mapscript:RunScriptCode:FLaser4(1);:30.0:1",7.0,null);
	}
}

function Action_Trigger_Most()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(3);",30.0,null);
	}
	if(iLevel==7)
	{
		FLaser4(0);
		EntFire("xmas_mm","RunScriptCode","SetMusic(16);",30.0,null);
	}
	if(iLevel==6 || iLevel==7)
	{
		EntFire("teleport_afk_2","AddOutput","target teleport2_mapa2_port",0.0,null);
		EntFire("teleport_afk_2","Enable","",5.0,null);
		
		//Убираем лишний снег
		EntFire("xmas_snow12","Kill","",5.0,null);
		
		//Оптимизация
		EntFire("kone_temp","Kill","",7.0,null);
		EntFire("doors2","Kill","",7.0,null);
		EntFire("ohen_level1_2","Kill","",7.0,null);
	}
}

function Action_SnowMainden_Music()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(4);",0.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(4);",0.0,null);
		iBossStady = 1;
		EntFire("xmas_lvl7_attack_timer","RefireTime","14.0",10.0,null);
		EntFire("xmas_lvl7_attack_timer","ResetTimer","",10.5,null);
		EntFire("xmas_lvl7_attack_timer","Enable","",11.0,null);
	}
}

function Action_SnowMaiden_Dead()
{
	EntFire("pirate_grenade_multi","Kill","",0.5,null);
	if(iLevel == 7)
	{
		EntFire("xmas_lvl7_attack_timer","Disable","",0.0,null);
	}
}

function Action_Trigger_Back3()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(5);",0.0,null);
	}
	if(iLevel==7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(17);",0.0,null);
	}
	if(iLevel==6 || iLevel==7)
	{
		EntFire("teleport_afk_trigger","AddOutput","target pirate_jail",0.0,null);
		EntFire("consola","Command","say >>> TELEPORT IN 5 SEC <<<",1.0,null);
		EntFire("lod1_dvere2","Open","",2.0,null);
		EntFire("door_barak","Close","",2.0,null);
		EntFire("brana_padaci","Close","",2.0,null);
		EntFire("xmas_lvl6_PT_3lvlback","ForceSpawn","",3.0,null);
		EntFire("mapa2_cast1","Disable","",5.0,null);
		EntFire("mapa2_cast2","Disable","",5.0,null);
		EntFire("pirates_port_3level","Disable","",5.0,null);
		EntFire("teleport_afk_2","Disable","",5.0,null);
		EntFire("teleport2_mapa2","Disable","",5.0,null);
		EntFire("xmas_lvl3_tpzm_water","AddOutput","target xmas_snowmaiden",5.0,null);
		EntFire("xmas_lvl6_t_tpsnowmaiden_human","Enable","",6.0,null);
		EntFireByHandle(self, "RunScriptCode", "TPFix_SnowMaiden_HM();", 6.10, null, null);
		EntFire("consola","Command","say >>> AFK TELEPORT IN 10 SEC <<<",6.0,null);
		EntFire("xmas_lvl6_t_most","Enable","",7.0,null);
		EntFire("xmas_lvl6_t_door1","Enable","",7.0,null);
		EntFire("xmas_lvl6_t_door2","Enable","",7.0,null);
		EntFire("xmas_lvl6_t_tpsnowmaiden_zombie","Enable","",16.0,null);
		EntFireByHandle(self, "RunScriptCode", "TPFix_SnowMaiden_ZM();", 16.10, null, null);
	}
}

function Action_Trigger_MostBack()
{
	EntFire("consola","Command","say >>> GATE OPENS IN 50 SEC <<<",0.0,null);
	EntFire("brana_padaci","Open","",50.0,null);
	EntFire("consola","Command","say >>> AFK TELEPORT IN 10 SEC <<<",20.0,null);
	EntFire("xmas_lvl6_t_tp3lvl_top","Enable","",30.0,null);
	EntFire("consola","Command","say >>> GATE OPENS IN 20 SEC <<<",30.0,null);
	EntFire("consola","Command","say >>> AFK TELEPORT IN 10 SEC <<<",60.0,null);
	EntFire("mapa2_cast2","AddOutput","target xmas_aftersnowmaiden_afk",60.0,null);
	EntFire("mapa2_cast2","Enable","",70.0,null);
}

function Action_Trigger_Door1()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(6);",25.0,null);
	}
	if(iLevel==7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(18);",25.0,null);
		EntFireByHandle(self, "RunScriptCode", "Action_Trigger_Laser4();", 48.00, null, null);
	}
	EntFire("consola","Command","say >>> DOOR OPENS IN 40 SEC <<<",0.0,null);
	EntFire("consola","Command","say >>> DOOR OPENS IN 15 SEC <<<",25.0,null);
	EntFire("mapa2_door2","AddOutput","distance -90",1.0,null);
	EntFire("mapa2_door2","Open","",40.0,null);
	
	EntFire("mapa2_cast1","AddOutput","target xmas_after3lvl_afk",35.0,null);
	EntFire("mapa2_cast1","Enable","",40.0,null);
	
	//Убираем лишний снег
	EntFire("xmas_snow14","Kill","",40.0,null);
	EntFire("xmas_snow15","Kill","",40.0,null);
	EntFire("xmas_snow16","Kill","",40.0,null);
	
	//Оптимизация
	EntFire("lod1_dvere1","Kill","",50.0,null);
	EntFire("lod1_dvere2","Kill","",50.0,null);
	EntFire("pirates_port_3level","Kill","",50.0,null);
	EntFire("pirate_stred_stredu","Kill","",52.0,null);
	EntFire("jeskyne_door","Kill","",50.0,null);
	EntFire("mapa2_ohen","Kill","",50.0,null);
}

function Action_Trigger_Door2()
{
	EntFire("consola","Command","say >>> DOOR OPENS IN 10 SEC <<<",0.0,null);
	EntFire("zaslep_2lvl","Kill","",1.0,null);
	EntFire("mapa2_door1","Open","",10.0,null);
}

function Action_Trigger_To_4LVL()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(7);",35.0,null);
	}
	if(iLevel==7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(19);",35.0,null);
		EntFire("once_2","AddOutput","OnStartTouch xmas_mapscript:RunScriptCode:Action_Trigger_Laser5();:25.0:1",43.0,null);
	}
	EntFire("consola","Command","say >>> DOOR OPENS IN 35 SEC <<<",0.0,null);
	EntFire("zed_mapa3","Break","",35.0,null);
	EntFire("dvere_mapa3","Break","",35.0,null);
	EntFire("mapa4_template","ForceSpawn","",40.0,null);
	EntFire("teleport2_mapa2","AddOutput","target port_mapa3",30.0,null);
	
	//Факела
	EntFire("ohen_4_4","Start","",45.0,null);
	EntFire("ohen_4_5","Start","",45.0,null);
}

function Action_Trigger_Cellar()
{
	if(iLevel==6 || iLevel==7)
	{
		EntFire("teleport2_mapa2","Enable","",0.0,null);
		EntFire("teleport_afk_trigger","AddOutput","target port_mapa3",1.0,null);
		
		//Убираем лишний снег
		EntFire("xmas_snow7","Kill","",1.0,null);
		EntFire("xmas_snow13","Kill","",1.0,null);
		//Спавним снег далее
		EntFire("xmas_snow_spawner2","ForceSpawn","",2.0,null);
		
		//Оптимизация
		EntFire("dvere1","Kill","",5.0,null);
		EntFire("dvere_mapa333","Kill","",5.0,null);
		EntFire("prekazka","Kill","",5.0,null);
		EntFire("mapa2_door1","Kill","",5.0,null);
		EntFire("mapa2_door2","Kill","",5.0,null);
		EntFire("doors1","Kill","",5.0,null);
		EntFire("doors2","Kill","",5.0,null);
		EntFire("dvere_barak_3","Kill","",5.0,null);
		EntFire("white_house_door","Kill","",5.0,null);
		EntFire("dvere_barak_2","Kill","",5.0,null);
		EntFire("vchod_2mapa","Kill","",5.0,null);
		EntFire("3lvl_kolo","Kill","",5.0,null);
		EntFire("brana_padaci","Kill","",5.0,null);
		EntFire("padaci_most_pada","Kill","",5.0,null);
		EntFire("door_barak","Kill","",5.0,null);
		EntFire("ohen_mapa_1-3","Kill","",5.0,null);
	}
}

function Action_Trigger_4LVL_First()
{
	if(iLevel == 7)
	{
		Make_Crystall_Human(12,140);
	}
}

function Action_BadSanta_Item_Kill4()
{
	if(iLevel == 4)
	{
		EntFire("zombie_barbossa_kill","Enable","0.0",0.0,null);
	}
}

function Action_Bad_Santa_Music()
{
	if(iLevel == 6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(8);",0.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(8);",0.0,null);
		iBossStady = 2;
		EntFire("xmas_lvl7_attack_timer","RefireTime","15.0",0.0,null);
		EntFire("xmas_lvl7_attack_timer","ResetTimer","",0.5,null);
		EntFire("xmas_lvl7_attack_timer","Enable","",1.0,null);
	}
}

function Action_Trigger_Barbossa_Dead()
{
	if(iLevel==6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(9);",0.0,null);
	}
	if(iLevel==7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(20);",0.0,null);
		EntFire("xmas_lvl7_attack_timer","Disable","",0.0,null);
		EntFire("level5_most_rotate","AddOutput","OnFullyOpen xmas_mapscript:RunScriptCode:Action_Trigger_Laser6();:3.0:1",43.0,null);
	}
	if(iLevel==6 || iLevel==7)
	{
		EntFire("once_5","Enable","",0.0,null);
		EntFire("mapa3_dverebb","Close","",0.0,null);
		EntFire("mapa3_dvere2","Open","",0.0,null);
		EntFire("teleport_mapa33","Disable","",4.0,null);
		EntFire("consola","Command","say >>> WAY OPENS IN 5 SEC <<<",1.0,null);
		EntFire("xmas_lvl6_PT_4lvlback","ForceSpawn","",6.0,null);
		EntFire("jail_mapa_zm","Break","",16.0,null);
		EntFire("template_spawn_5_5","ForceSpawn","",18.0,null);
		EntFire("jack_final_template","ForceSpawn","",20.0,null);
		EntFire("kraken_zacatek","Enable","",21.0,null);
		EntFire("lvl_5_kraken_cesta","Enable","",21.0,null);
		
		EntFire("teleport_afk_trigger","AddOutput","target port_mapa33",1.0,null);
		EntFire("mapa5_pred_teleport","Enable","",10.0,null);
		
		//Факела
		EntFire("fire5","Start","",23.0,null);	
	}else
	{
		EntFire("mapa3_dira","Break","",0.8,null);
		EntFire("Delo2_sound","PlaySound","",0.0,null);
		EntFire("jail_mapa_zm","Break","",10.0,null);
		EntFire("level_4_jailzm_dira","Break","",13.0,null);
		EntFire("lvl4_3","Volume","0",0.0,null);
		EntFire("lvl4_4","PlaySound","",0.0,null);
		EntFire("barbossa_dira_template","ForceSpawn","",0.8,null);
	}
}

function Action_Trigger_To_5LVL_AFK()
{
	if(iLevel==6 || iLevel==7)
	{
		EntFire("xmas_lvl6_t_tpafter_barbossa","Enable","",30.0,null);
		
		//Убираем лишний снег
		EntFire("xmas_snow17","Kill","",31.0,null);
		EntFire("xmas_snow18","Kill","",31.0,null);
		
		//Оптимизация
		EntFire("mapa3_dverebb","Kill","",35.0,null);
		EntFire("mapa3_dvere2","Kill","",35.0,null);
		EntFire("xmas_lvl6_t_gravity3","Kill","",35.0,null);
		EntFire("xmas_lvl6_t_gr3_part","Kill","",35.0,null);
		EntFire("ohen_4_4","Kill","",35.0,null);
		EntFire("ohen_4_5","Kill","",35.0,null);
	}
}

function Action_PreTrueSanta_Music()
{
	if(iLevel == 6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(10);",0.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(21);",0.0,null);
	}
	if(iLevel==6 || iLevel==7)
	{
		//Убираем лишний снег
		EntFire("xmas_snow19","Kill","",0.0,null);
		EntFire("xmas_snow20","Kill","",0.0,null);
	}
}

function Action_TrueSanta_Music()
{
	if(iLevel == 7)
	{
		EntFire("xmas_fog","SetStartDist","600",0.5,null);
		EntFire("xmas_fog","SetEndDist","2500",0.5,null);
	}
	if(iLevel == 6 || iLevel==7)
	{
		//Убираем лишний снег
		EntFire("xmas_snow21","Kill","",0.0,null);
		
		EntFire("xmas_mm","RunScriptCode","SetMusic(11);",0.0,null);
	}
}

function Action_AfterTrueSanta_Music()
{
	EntFire("kraken_grenade_multi","Kill","",0.0,null);
	if(iLevel == 6)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(12);",0.0,null);
	}
	if(iLevel == 7)
	{
		EntFire("xmas_mm","RunScriptCode","SetMusic(22);",0.0,null);
	}
}

function Action_Trigger_HP_Cannon()
{
	local iCurrentAddHP = 42;
	if(iLevel == 6)
	{
		iCurrentAddHP = 38;
	}else if(iLevel == 7)
	{
		iCurrentAddHP = 35;
	}
	EntFire("boss_hp_backup","Add",iCurrentAddHP.tostring(),0.0,null);
	EntFire("delo_counter","Add",iCurrentAddHP.tostring(),0.0,null);
}

function Action_Trigger_HP_SnowMaiden()
{
	local iCurrentAddHP = 50;
	if(iLevel == 6)
	{
		iCurrentAddHP = 50;
	}else if(iLevel == 7)
	{
		iCurrentAddHP = 45;
	}
	EntFire("pirate_hp_backup","Add",iCurrentAddHP.tostring(),0.0,null);
	EntFire("pirate_counter","Add",iCurrentAddHP.tostring(),0.0,null);
}

function Action_Trigger_HP_Santa()
{
	local iCurrentAddHP = 58;
	if(iLevel == 6)
	{
		iCurrentAddHP = 58;
	}else if(iLevel == 7)
	{
		iCurrentAddHP = 55;
	}
	EntFire("barbossa_hp_backup","Add",iCurrentAddHP.tostring(),0.0,null);
	EntFire("barbossa_counter","Add",iCurrentAddHP.tostring(),0.0,null);
}

function Action_Trigger_HP_TrueSanta()
{
	local iCurrentAddHP = 83;
	if(iLevel == 6)
	{
		iCurrentAddHP = 76;
	}else if(iLevel == 7)
	{
		iCurrentAddHP = 70;
	}
	EntFire("kraken_hp_backup","Add",iCurrentAddHP.tostring(),0.0,null);
	EntFire("kraken_counter","Add",iCurrentAddHP.tostring(),0.0,null);
}

function Action_Zombie_Detected()
{
	bZMDetect = true;
}

function Action_Zombie_Clear()
{
	bZMDetect = false;
	Action_No_ZM5_7();
}

function Action_No_ZM5_7()
{
	if(bZMDetect == false)
	{
		if(iLevel == 5)
		{
			Action_Trigger_Winner5();
		}else if(iLevel == 6)
		{
			Action_Trigger_Winner6();
		}else if(iLevel == 7)
		{
			Action_Trigger_Night();
		}
	}
}

function Action_Trigger_Winner5()
{
	EntFire("consola","Command","say >>> YOU HAVE WON THE MAP. BUT ONLY EASY KRAKEN <<<",0.0,null);
	EntFire("consola","Command","Map made by Puklica",5.0,null);
	
	EntFire("lvl5_4","Volume","0",0.0,null);
	EntFire("sound_win_pirates","PlaySound","",0.0,null);
	
	EntFire("level5_multiple_score","Enable","",0.0,null);
	EntFire("level5_multiple_score","Disable","",0.1,null);
	
	EntFire("hurt5_antizm","Kill","",0.0,null);
	EntFire("timer_antizm_konce","Kill","",0.0,null);
	EntFire("konec_hurt_final","Enable","",8.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 13.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 13.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 14.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 14.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 15.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 15.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 16.00, null, null);
	
	SetLevel(6);
}

function Action_Trigger_Winner6()
{
	EntFire("consola","Command","say >>> YOU HAVE WON THE MAP. BUT ONLY CHRISTMAS DAY <<<",0.0,null);
	EntFire("consola","Command","Map made by Puklica",5.0,null);
	
	EntFire("sound_win_pirates","PlaySound","",0.0,null);
	
	EntFire("level5_multiple_score","Enable","",0.0,null);
	EntFire("level5_multiple_score","Disable","",0.1,null);
	
	EntFire("hurt5_antizm","Kill","",0.0,null);
	EntFire("timer_antizm_konce","Kill","",0.0,null);
	EntFire("konec_hurt_final","Enable","",8.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 13.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 13.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 14.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 14.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 15.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 15.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 16.00, null, null);
	
	SetLevel(7);
}

function Action_Trigger_Night()
{
	EntFire("consola","Command","say >>> YOU HAVE COME TO THIS POINT <<<",0.0,null);
	EntFire("consola","Command","say >>> BUT THIS IS NOT THE END OF THE MAP... <<<",1.0,null);
	EntFire("hurt5_antizm","Kill","",0.0,null);
	EntFire("timer_antizm_konce","Kill","",0.0,null);
	
	EntFire("consola","Command","say >>> LET THE CHRISTMAS NIGHT BEGIN <<<",5.0,null);
	EntFire("consola","Command","say >>> TELEPORT IN 3 SEC <<<",6.0,null);
	EntFire("consola","Command","say >>> TELEPORT IN 2 SEC <<<",7.0,null);
	EntFire("consola","Command","say >>> TELEPORT IN 1 SEC <<<",8.0,null);
	
	EntFire("kraken_posledni port","Disable","",7.0,null);
	EntFire("xmas_krakenkus_spawner","ForceSpawn","",8.0,null);
	EntFire("anti_zem_kraken","Toggle","",8.5,null);
	EntFire("xmas_lvl7_t_lastnight","Enable","",9.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "Action_Polniy_Pizdec();", 10.00, null, null);
}

function Action_Polniy_Pizdec()
{
	//Музыка
	EntFire("xmas_mm","RunScriptCode","SetMusic(23);",0.0,null);
	
	EntFire("consola","Command","say >>> DODGE THIS <<<",12.0,null);
	EntFire("xmas_lvl7_attack_overlay","StartOverlays","",13.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 16.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 18.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 20.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 22.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 24.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser(0);", 26.00, null, null);
	
	EntFire("xmas_lvl7_attack_overlay","StopOverlays","",27.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(1);", 27.00, null, null);
	
	local iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 39.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 41.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 43.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 45.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 47.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(0);", 49.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 51.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 51.40, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 51.80, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 52.20, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 52.60, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 53.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 53.40, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 53.80, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 54.20, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 54.60, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 55.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 55.40, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 55.80, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 56.20, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 56.60, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 57.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 57.40, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 57.80, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 58.20, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 58.60, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 59.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 59.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 60.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 61.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 62.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(1);", 62.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 64.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 66.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 68.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_LastTop_Laser();", 70.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Make_Crystall_Human(16,120);", 74.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(0);", 84.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(2);", 84.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 85.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 87.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 89.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 91.00, null, null);
	iRLaser = RandomInt(0,2);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 93.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(1);", 95.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Make_Lasers_Wall();", 96.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Lasers_Wall();", 101.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Lasers_Wall();", 106.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(2);", 109.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Lasers_Wall();", 111.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Lasers_Wall();", 116.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(1);", 120.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(1);", 121.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Crystall_Human(16,120);", 135.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(2);", 146.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 158.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 162.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Make_Last_Laser("+iRLaser.tostring()+");", 166.00, null, null);
	
	EntFireByHandle(self, "RunScriptCode", "Xmas_Color_Correction(1);", 170.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "Sphere_Init(0);", 170.00, null, null);
	
	EntFire("xmas_mm","RunScriptCode","SetMusic(22);",170.0,null);
	
	EntFire("xmas_lvl7_t_lastnight","Disable","",165.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "Night_FinalTP_CT();", 175.0, null, null);
	
	EntFire("consola","Command","say >>> CONGRATULATIONS. YOU HAVE WON THE MAP <<<",175.0,null);
	EntFire("consola","Command","Map made by Puklica",178.0,null);
	EntFireByHandle(self, "RunScriptCode", "MesToChat(0);", 181.0, null, null);
	
	EntFire("level5_multiple_score","Enable","",180.0,null);
	EntFire("level5_multiple_score","Disable","",180.1,null);
	
	EntFire("konec_hurt_final","Enable","",183.0,null);
	
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 188.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 188.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 189.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 189.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 190.00, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 190.50, null, null);
	EntFireByHandle(self, "RunScriptCode", "KillZM_XMAS();", 191.00, null, null);
}

function Night_FinalTP_CT()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0) && (p.GetTeam() == 3))
		{
			p.SetOrigin(Vector(9752,-12920,-1172));
		}	
	}
}

function Make_Lasers_Wall()
{
	local iDRandom = RandomInt(1,13);
	local iNow = 0;
	while(iNow<=14)
	{
		if(iNow!=iDRandom)
		{
			local iYCurrent = -11700-iNow*75;
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(15, Vector(2956,"+iYCurrent+",-900), Vector(0,180,90));", 0.00, null, null);
		}
		iNow++;
	}
	EntFire("xmas_laser_sound","PlaySound","",0.5,null);
}

function Make_Last_Laser(iSt)
{
	local iRand = RandomInt(0,1);
	if(iSt==0)
	{
		if(iRand == 0)
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(2956,-11932,-964), Vector(0,180,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(2956,-12444,-964), Vector(0,180,0));", 0.00, null, null);
		}else
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(2956,-11932,-994), Vector(0,180,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(2956,-12444,-994), Vector(0,180,0));", 0.00, null, null);
		}
	}else if(iSt==1)
	{
		if(iRand == 0)
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(1792,-11426,-964), Vector(0,270,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(2304,-11426,-964), Vector(0,270,0));", 0.00, null, null);
		}else
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(1792,-11426,-994), Vector(0,270,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(2304,-11426,-994), Vector(0,270,0));", 0.00, null, null);
		}
	}else if(iSt==2)
	{
		if(iRand == 0)
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(1792,-12926,-964), Vector(0,90,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(12, Vector(2304,-12926,-964), Vector(0,90,0));", 0.00, null, null);
		}else
		{
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(1792,-12926,-994), Vector(0,90,0));", 0.00, null, null);
			EntFireByHandle(self, "RunScriptCode", "Make_Laser(13, Vector(2304,-12926,-994), Vector(0,90,0));", 0.00, null, null);
		}
	}
	EntFire("xmas_laser_sound","PlaySound","",0.5,null);
}

function Make_LastTop_Laser()
{
	local iRand = RandomInt(0,1);
	
	if(iRand == 0)
	{
		local iXRand0 = RandomInt(1910,2270);
		local iYRand0 = RandomInt(-12665,-11700);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(14, Vector("+iXRand0.tostring()+","+iYRand0.tostring()+",-680), Vector(90,90,0));", 0.00, null, null);
	}else if(iRand == 1)
	{
		local iXRand1 = RandomInt(1670,2466);
		local iYRand1 = RandomInt(-12452,-11892);
		EntFireByHandle(self, "RunScriptCode", "Make_Laser(14, Vector("+iXRand1.tostring()+","+iYRand1.tostring()+",-680), Vector(90,0,0));", 0.00, null, null);
	}
	
	//EntFire("xmas_laser_sound","PlaySound","",0.5,null);
}

function Action_Spawn_Medalion()
{
	local iRMedalion = RandomInt(0,2);
	if(iRMedalion == 0)
	{
		EntFire("port_medailon","AddOutput","origin -10829 10552.4 -444",0.0,null);
		EntFire("port_medailon","ForceSpawn","",0.1,null);
	}else if(iRMedalion == 1)
	{
		EntFire("port_medailon","AddOutput","origin -10776 9577.4 -444",0.0,null);
		EntFire("port_medailon","ForceSpawn","",0.1,null);
	}else if(iRMedalion == 2)
	{
		EntFire("port_medailon","AddOutput","origin -5575 10854.4 -748",0.0,null);
		EntFire("port_medailon","ForceSpawn","",0.1,null);
	}
}

function SpawnPoints1()
{
	EntFire("spawn1","AddOutput","origin -14263 14537 -1054",0.0,null);
	EntFire("spawn2","AddOutput","origin -14199 14537 -1054",0.0,null);
	EntFire("spawn3","AddOutput","origin -14135 14537 -1054",0.0,null);
	EntFire("spawn4","AddOutput","origin -14071 14537 -1054",0.0,null);
	EntFire("spawn5","AddOutput","origin -14007 14537 -1054",0.0,null);
	EntFire("spawn6","AddOutput","origin -13943 14537 -1054",0.0,null);
	EntFire("spawn7","AddOutput","origin -13879 14537 -1054",0.0,null);
	EntFire("spawn8","AddOutput","origin -13815 14537 -1054",0.0,null);
	EntFire("spawn9","AddOutput","origin -14263 14601 -1054",0.0,null);
	EntFire("spawn10","AddOutput","origin -14199 14601 -1054",0.0,null);
	EntFire("spawn11","AddOutput","origin -14135 14601 -1054",0.0,null);
	EntFire("spawn12","AddOutput","origin -14071 14601 -1054",0.0,null);
	EntFire("spawn13","AddOutput","origin -14007 14601 -1054",0.0,null);
	EntFire("spawn14","AddOutput","origin -13943 14601 -1054",0.0,null);
	EntFire("spawn15","AddOutput","origin -13879 14601 -1054",0.0,null);
	EntFire("spawn16","AddOutput","origin -13815 14601 -1054",0.0,null);
	EntFire("spawn17","AddOutput","origin -14263 14665 -1054",0.0,null);
	EntFire("spawn18","AddOutput","origin -14199 14665 -1054",0.0,null);
	EntFire("spawn19","AddOutput","origin -14135 14665 -1054",0.0,null);
	EntFire("spawn20","AddOutput","origin -14071 14665 -1054",0.0,null);
	EntFire("spawn21","AddOutput","origin -14007 14665 -1054",0.0,null);
	EntFire("spawn22","AddOutput","origin -13943 14665 -1054",0.0,null);
	EntFire("spawn23","AddOutput","origin -13879 14665 -1054",0.0,null);
	EntFire("spawn24","AddOutput","origin -13815 14665 -1054",0.0,null);
	EntFire("spawn25","AddOutput","origin -14263 14729 -1054",0.0,null);
	EntFire("spawn26","AddOutput","origin -14199 14729 -1054",0.0,null);
	EntFire("spawn27","AddOutput","origin -14135 14729 -1054",0.0,null);
	EntFire("spawn28","AddOutput","origin -14071 14729 -1054",0.0,null);
	EntFire("spawn29","AddOutput","origin -14007 14729 -1054",0.0,null);
	EntFire("spawn30","AddOutput","origin -13943 14729 -1054",0.0,null);
	EntFire("spawn31","AddOutput","origin -13879 14729 -1054",0.0,null);
	EntFire("spawn32","AddOutput","origin -13815 14729 -1054",0.0,null);
	EntFire("spawn33","AddOutput","origin -14263 14793 -1054",0.0,null);
	EntFire("spawn34","AddOutput","origin -14199 14793 -1054",0.0,null);
	EntFire("spawn35","AddOutput","origin -14135 14793 -1054",0.0,null);
	EntFire("spawn36","AddOutput","origin -14071 14793 -1054",0.0,null);
	EntFire("spawn37","AddOutput","origin -14007 14793 -1054",0.0,null);
	EntFire("spawn38","AddOutput","origin -13943 14793 -1054",0.0,null);
	EntFire("spawn39","AddOutput","origin -13879 14793 -1054",0.0,null);
	EntFire("spawn40","AddOutput","origin -13815 14793 -1054",0.0,null);
	EntFire("spawn41","AddOutput","origin -14263 14857 -1054",0.0,null);
	EntFire("spawn42","AddOutput","origin -14199 14857 -1054",0.0,null);
	EntFire("spawn43","AddOutput","origin -14135 14857 -1054",0.0,null);
	EntFire("spawn44","AddOutput","origin -14071 14857 -1054",0.0,null);
	EntFire("spawn45","AddOutput","origin -14007 14857 -1054",0.0,null);
	EntFire("spawn46","AddOutput","origin -13943 14857 -1054",0.0,null);
	EntFire("spawn47","AddOutput","origin -13879 14857 -1054",0.0,null);
	EntFire("spawn48","AddOutput","origin -13815 14857 -1054",0.0,null);
	EntFire("spawn49","AddOutput","origin -14263 14921 -1054",0.0,null);
	EntFire("spawn50","AddOutput","origin -14199 14921 -1054",0.0,null);
	EntFire("spawn51","AddOutput","origin -14135 14921 -1054",0.0,null);
	EntFire("spawn52","AddOutput","origin -14071 14921 -1054",0.0,null);
	EntFire("spawn53","AddOutput","origin -14007 14921 -1054",0.0,null);
	EntFire("spawn54","AddOutput","origin -13943 14921 -1054",0.0,null);
	EntFire("spawn55","AddOutput","origin -13879 14921 -1054",0.0,null);
	EntFire("spawn56","AddOutput","origin -13815 14921 -1054",0.0,null);
	EntFire("spawn57","AddOutput","origin -14263 14985 -1054",0.0,null);
	EntFire("spawn58","AddOutput","origin -14199 14985 -1054",0.0,null);
	EntFire("spawn59","AddOutput","origin -14135 14985 -1054",0.0,null);
	EntFire("spawn60","AddOutput","origin -14071 14985 -1054",0.0,null);
	EntFire("spawn61","AddOutput","origin -14007 14985 -1054",0.0,null);
	EntFire("spawn62","AddOutput","origin -13943 14985 -1054",0.0,null);
	EntFire("spawn63","AddOutput","origin -13879 14985 -1054",0.0,null);
	EntFire("spawn64","AddOutput","origin -13815 14985 -1054",0.0,null);
}

function SpawnPoints2()
{
	EntFire("spawn1","AddOutput","origin -1280 11520 -1184",0.0,null);
	EntFire("spawn2","AddOutput","origin -1216 11520 -1184",0.0,null);
	EntFire("spawn3","AddOutput","origin -1152 11520 -1184",0.0,null);
	EntFire("spawn4","AddOutput","origin -1088 11520 -1184",0.0,null);
	EntFire("spawn5","AddOutput","origin -1024 11520 -1184",0.0,null);
	EntFire("spawn6","AddOutput","origin -960 11520 -1184",0.0,null);
	EntFire("spawn7","AddOutput","origin -896 11520 -1184",0.0,null);
	EntFire("spawn8","AddOutput","origin -832 11520 -1184",0.0,null);
	EntFire("spawn9","AddOutput","origin -1280 11584 -1184",0.0,null);
	EntFire("spawn10","AddOutput","origin -1216 11584 -1184",0.0,null);
	EntFire("spawn11","AddOutput","origin -1152 11584 -1184",0.0,null);
	EntFire("spawn12","AddOutput","origin -1088 11584 -1184",0.0,null);
	EntFire("spawn13","AddOutput","origin -1024 11584 -1184",0.0,null);
	EntFire("spawn14","AddOutput","origin -960 11584 -1184",0.0,null);
	EntFire("spawn15","AddOutput","origin -896 11584 -1184",0.0,null);
	EntFire("spawn16","AddOutput","origin -832 11584 -1184",0.0,null);
	EntFire("spawn17","AddOutput","origin -1280 11648 -1184",0.0,null);
	EntFire("spawn18","AddOutput","origin -1216 11648 -1184",0.0,null);
	EntFire("spawn19","AddOutput","origin -1152 11648 -1184",0.0,null);
	EntFire("spawn20","AddOutput","origin -1088 11648 -1184",0.0,null);
	EntFire("spawn21","AddOutput","origin -1024 11648 -1184",0.0,null);
	EntFire("spawn22","AddOutput","origin -960 11648 -1184",0.0,null);
	EntFire("spawn23","AddOutput","origin -896 11648 -1184",0.0,null);
	EntFire("spawn24","AddOutput","origin -832 11648 -1184",0.0,null);
	EntFire("spawn25","AddOutput","origin -1280 11712 -1184",0.0,null);
	EntFire("spawn26","AddOutput","origin -1216 11712 -1184",0.0,null);
	EntFire("spawn27","AddOutput","origin -1152 11712 -1184",0.0,null);
	EntFire("spawn28","AddOutput","origin -1088 11712 -1184",0.0,null);
	EntFire("spawn29","AddOutput","origin -1024 11712 -1184",0.0,null);
	EntFire("spawn30","AddOutput","origin -960 11712 -1184",0.0,null);
	EntFire("spawn31","AddOutput","origin -896 11712 -1184",0.0,null);
	EntFire("spawn32","AddOutput","origin -832 11712 -1184",0.0,null);
	EntFire("spawn33","AddOutput","origin -1280 11776 -1184",0.0,null);
	EntFire("spawn34","AddOutput","origin -1216 11776 -1184",0.0,null);
	EntFire("spawn35","AddOutput","origin -1152 11776 -1184",0.0,null);
	EntFire("spawn36","AddOutput","origin -1088 11776 -1184",0.0,null);
	EntFire("spawn37","AddOutput","origin -1024 11776 -1184",0.0,null);
	EntFire("spawn38","AddOutput","origin -960 11776 -1184",0.0,null);
	EntFire("spawn39","AddOutput","origin -896 11776 -1184",0.0,null);
	EntFire("spawn40","AddOutput","origin -832 11776 -1184",0.0,null);
	EntFire("spawn41","AddOutput","origin -1280 11840 -1184",0.0,null);
	EntFire("spawn42","AddOutput","origin -1216 11840 -1184",0.0,null);
	EntFire("spawn43","AddOutput","origin -1152 11840 -1184",0.0,null);
	EntFire("spawn44","AddOutput","origin -1088 11840 -1184",0.0,null);
	EntFire("spawn45","AddOutput","origin -1024 11840 -1184",0.0,null);
	EntFire("spawn46","AddOutput","origin -960 11840 -1184",0.0,null);
	EntFire("spawn47","AddOutput","origin -896 11840 -1184",0.0,null);
	EntFire("spawn48","AddOutput","origin -832 11840 -1184",0.0,null);
	EntFire("spawn49","AddOutput","origin -1280 11904 -1184",0.0,null);
	EntFire("spawn50","AddOutput","origin -1216 11904 -1184",0.0,null);
	EntFire("spawn51","AddOutput","origin -1152 11904 -1184",0.0,null);
	EntFire("spawn52","AddOutput","origin -1088 11904 -1184",0.0,null);
	EntFire("spawn53","AddOutput","origin -1024 11904 -1184",0.0,null);
	EntFire("spawn54","AddOutput","origin -960 11904 -1184",0.0,null);
	EntFire("spawn55","AddOutput","origin -896 11904 -1184",0.0,null);
	EntFire("spawn56","AddOutput","origin -832 11904 -1184",0.0,null);
	EntFire("spawn57","AddOutput","origin -1280 11968 -1184",0.0,null);
	EntFire("spawn58","AddOutput","origin -1216 11968 -1184",0.0,null);
	EntFire("spawn59","AddOutput","origin -1152 11968 -1184",0.0,null);
	EntFire("spawn60","AddOutput","origin -1088 11968 -1184",0.0,null);
	EntFire("spawn61","AddOutput","origin -1024 11968 -1184",0.0,null);
	EntFire("spawn62","AddOutput","origin -960 11968 -1184",0.0,null);
	EntFire("spawn63","AddOutput","origin -896 11968 -1184",0.0,null);
	EntFire("spawn64","AddOutput","origin -832 11968 -1184",0.0,null);
}

function KillAll()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0))
		{
			EntFireByHandle(p, "SetHealth", "-677", 0.00, null, null);
		}	
	}
}

function KillZM_XMAS()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0) && (p.GetTeam() == 2))
		{
			EntFireByHandle(p, "SetHealth", "-677", 0.00, null, null);
		}	
	}
}

function ZM_AutoHeal()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && p.GetTeam() == 2 && p.GetHealth() > 0)
		{
			EntFireByHandle(p, "SetHealth", "50000", 0.00, null, null);
		}	
	}
	EntFireByHandle(self, "RunScriptCode", "ZM_AutoHeal();", 10.00, null, null);
}

function TPFix_Cannon_ZM()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0) && (p.GetTeam() == 2))
		{
			EntFireByHandle(p, "AddOutput", "origin -9792 -900 -50", 0.00, null, null);
		}	
	}
}

function TPFix_SnowMaiden_HM()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0) && (p.GetTeam() == 3))
		{
			EntFireByHandle(p, "AddOutput", "origin 14628 4130 -1116", 0.00, null, null);
		}	
	}
}

function TPFix_SnowMaiden_ZM()
{
	local p = null;
	while(null != (p = Entities.FindByClassname(p,"player")))
	{
		if((p.IsValid()) && (p.GetHealth() > 0) && (p.GetTeam() == 2))
		{
			EntFireByHandle(p, "AddOutput", "origin 14628 4130 -1116", 0.00, null, null);
		}	
	}
}

function MesToChat(iMC)
{
	if(iMC == 0)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Info\x0B]\x01 XMAS Stripper v.1.5 by\x03 DarkerZ[RUS]");
	}else if(iMC == 1)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Info\x0B]\x01 Map made by\x03 Puklica");
	}else if(iMC == 2)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** ADMIN SLAYING EVERYONE ***");
	}else if(iMC == 3)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 1\x07 ***");
	}else if(iMC == 4)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 2\x07 ***");
	}else if(iMC == 5)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 3\x07 ***");
	}else if(iMC == 6)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 4\x07 ***");
	}else if(iMC == 7)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 5\x07 ***");
	}else if(iMC == 8)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 6\x07 ***");
	}else if(iMC == 9)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04 Admin Room\x0B ]\x07 *** Admin has changed difficulty to\x04 LEVEL 7\x07 ***");
	}else if(iMC == 10)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 1\x06 -\x03 Black Pearl\x04 <<<");
	}else if(iMC == 11)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 2\x06 -\x03 Cannon\x04 <<<");
	}else if(iMC == 12)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 3\x06 -\x03 SnowMaiden\x04 <<<");
	}else if(iMC == 13)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 4\x06 -\x03 Bad Santa\x04 <<<");
	}else if(iMC == 14)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 5\x06 -\x03 True Santa\x04 <<<");
	}else if(iMC == 15)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 6\x06 -\x03 Christmas Day\x04 <<<");
	}else if(iMC == 16)
	{
		ScriptPrintMessageChatAll(" \x0B[\x04Level\x0B]\x04 >>>\x01 LEVEL 7\x06 -\x03 Christmas Night\x04 <<<");
	}
}

sKnifeGroup <- ["flip","gut","karambit","m9_bayonet","tactical","butterfly","falchion","push","survival_bowie","ursus","gypsy_jackknife","stiletto","widowmaker"];

function ReplaceKnife()
{
	local oldKnife = null;
	local Equip = Entities.CreateByClassname("game_player_equip");
	Equip.__KeyValueFromString("weapon_knife_"+sKnifeGroup[RandomInt(0,sKnifeGroup.len() - 1)],"1");
	while((oldKnife = Entities.FindByClassname(oldKnife,"weapon_knife")) != null)
	{
		if(oldKnife.GetName() != "zombie_barbossat_knife")
		{
			local playeroldKnife=oldKnife.GetOwner();
			oldKnife.Destroy();
			EntFireByHandle(Equip,"Use","",0.00,playeroldKnife,playeroldKnife);
		}
	}
	EntFireByHandle(self,"RunScriptCode","MoveKnife();",0.05,null,null);
	EntFireByHandle(Equip,"Kill","",0.10,null,null);
}

function MoveKnife()
{
	local oldKnife = null;
	while((oldKnife = Entities.FindByClassname(oldKnife,"weapon_knife")) != null)
	{
		if(oldKnife.GetName() != "zombie_barbossat_knife" && oldKnife.GetOwner() == null)
		{
			oldKnife.__KeyValueFromString("classname","weapon_knifegg");	
		}
	}
}