//==================================\\
// By Luffaren (STEAM_1:1:22521282) \\
//==================================\\
//	Quizmo Boner
//		This stage is about doing individual quizzes with A/B/C/D answers, both teams have their own side/area to play
//		Answer wrong as human > get TP'd to z-cage (death by infection, you then join the zombie-side to keep quizzing)
//		Answer wrong as zombie > get TP'd to h-cage with 1hp (shame+easy kill by human, but you can keep quizzing after respawning)
//		After X questions (managed by .nut variable) > final bridge defense for ~40s or so > then it ends
//		The quizzes are pulled from 'QUIZ_LIST' below, quizzes can be added/edited/removed, and there's also auto-generated math-quizzes added 
//	
//	TP-IN HUMAN:							stage_lqq_tp_in_h
//	TP-IN ZOMBIE:							stage_lqq_tp_in_z
//	START-RELAY-TRIGGER:					stage_lqq_manager
//	Map("Quizmo Boner","Luffaren","stage_lqq_tp_in_h","stage_lqq_tp_in_z",0.0,"stage_lqq_manager"),
//	Finished in 1 day (2021-06-30)
//	~2mb in total (.bsp + assets combined)
//=========================================================================================================================================\\
quiz_amount <- 4;					//amount quizzes to ask before triggering the finale
intermission_time <- 14.00;			//seconds to wait between quizzes (music playing + players killing caged people, etc) MIN:4.00, MAX:14.00
quiz_time <- 10.00;					//seconds you have to answer by stepping on the right platform
finale_bridge_delay <- 0.00;		//how many seconds to delay the finale-bridges rising up (making the defense shorter) MIN:0.00, MAX:25.00
gen_amount <- 100;							//how many automatic math-quizzes to generate/add to the quiz-pool
gen_n1_range_min <- 1;						//generator number 1 MIN-value
gen_n1_range_max <- 40;						//generator number 1 MAX-value
gen_n2_range_min <- 1;						//generator number 2 MIN-value
gen_n2_range_max <- 40;						//generator number 2 MAX-value
gen_n3_range_min <- 1;						//generator number 3 MIN-value
gen_n3_range_max <- 20;						//generator number 3 MAX-value
gen_div_range_min <- 1;						//generator number 1 MIN-value (if 'divide' gets chosen by RNG, this will also force n2 to '2')
gen_div_range_max <- 200;					//generator number 1 MAX-value (if 'divide' gets chosen by RNG, this will also force n2 to '2')
gen_chance_n3 <- 20.00;						//chance for number 3 to be used on top of number 1&2
gen_chance_subtract <- 30.00;				//chance for subtract to be dealt instead of addition (0.00-100.00 chance)
gen_chance_divide <- 15.00;					//chance for 'divide number 1 by 2' to be dealt (0.00-100.00 chance)
//=========================================================================================================================================\\
//		YOU CAN ADD/EDIT/REMOVE CUSTOM QUIZZES IN THE LIST BELOW.
//		THESE QUIZZES WILL BE ASKED INDIVIDUALLY WITH RANDOM A/B/C/D ANSWER DISTRIBUTION.
//		FORMAT GOES LIKE THIS (IN ORDER):
//			"question",
//			"correct_answer",
//			"wrong_answer_1",
//			"wrong_answer_2",
//			"wrong_answer_3",
//=============================================================\\	
QUIZ_LIST <- [
				"48/4=?",
				"12",
				"24",
				"8",
				"44",

				"接下来是什么?:\n128 > 256 > 512 > 1024 > ?????",
				"2048",
				"2096",
				"4098",
				"3168",

				"接下来是什么?:\n4 > 8 > 12 > 16 > ?????",
				"20",
				"18",
				"22",
				"24",

				"The quick brown fox jumps over... (提示:这句话包含了所有26个英文字母)",
				"the lazy dog",
				"the playful cat",
				"the rushing river",
				"the sleeping mouse",

				"字母表中 'K' 后面的是什么?",
				"L",
				"J",
				"M",
				"H",

				"18+(2*4)=?",
				"26",
				"20",
				"24",
				"22",

				"CS:GO 是哪一年出的?",
				"2012",
				"2011",
				"2010",
				"2013",

				"哪个数 *不能* 被3整除?",
				"26",
				"9",
				"18",
				"36",

				"100000-10000=?",
				"90000",
				"9000",
				"900000",
				"99000",

				"512/2=?",
				"256",
				"251",
				"254",
				"258",

				"'ZE' 代表什么?",
				"Zombie Escape",
				"Zombie Entrails",
				"Zombie Entry",
				"Zombie Epic",

				"32+32+64=?",
				"128",
				"92",
				"112",
				"142",

				"11+11=?",
				"22",
				"11",
				"1111",
				"24",

				"500*(1+2)=?",
				"1500",
				"3000",
				"1000",
				"503",

				"1234+5=?",
				"1239",
				"12345",
				"1254",
				"123450",

				"2-6=?",
				"-4",
				"-8",
				"-2",
				"-3",

				"(20/10)*2=?",
				"4",
				"10",
				"2",
				"20",

				"在英语字母表中那个数字代表的是 'G' ?",
				"7",
				"6",
				"8",
				"9",

				"如果John有两个苹果...\n那么一周有几天?",
				"7",
				"2",
				"9",
				"5",

				"PP-bizon 的弹夹容量是多少?",
				"64",
				"32",
				"48",
				"50",

				"(100+200+300)*0=?",
				"0",
				"600",
				"300",
				"-600",

				"800/100=?",
				"8",
				"80",
				"88",
				"0",

				"红色 + 绿色  = ?????",
				"黑色",
				"蓝色",
				"青色",
				"平红色",

				"一年有多少周?",
				"52",
				"48",
				"365",
				"12",

				"11+22+33=",
				"66",
				"59",
				"70",
				"48",

				"'E=mc^2' 指的是什么?",
				"质能方程",
				"放射性物质",
				"声音的速度",
				"无限",

				"牛顿第二定律公式是什么?",
				"F=ma",
				"p=mv",
				"PV=nRT",
				"E=mc^2",

				"什么杀死了猫?",
				"好奇心",
				"过度自信",
				"无知",
				"暴饮暴食",
	
				"美国总统奥巴马前一任是谁?",
				"小布什",
				"克林顿",
				"特朗普",
				"里根",

				"重庆属于",
				"直辖市",
				"省",
				"自治区",
				"特别行政区",

				"1 > 4\n2 > 5\n3 > ?????",
				"6",
				"3",
				"4",
				"7",
	
				"你是怎样来到这世界上的",
				"你最爱的父母",
				"白鹳",
				"一次实验中诞生的",
				"魔光炉",
				
				"π=?",
				"3.1415.",
				"3.1427.",
				"3.1439.",
				"3.1443.",

				"512+250-2=?",
				"760",
				"748",
				"764",
				"510",
	
				"土豆是...?",
				"一种蔬菜",
				"一种水果",
				"一种肉",
				"一种蘑菇",

				"中国有几个特别行政区?",
				"两个",
				"三个",
				"四个",
				"一个",

				"666+333=?",
				"999",
				"966",
				"1111",
				"933",

				"如果你向北看，西方在你的...",
				"左边",
				"右边",
				"前面",
				"后面",

				"2048+2048-1=?",
				"4095",
				"4052",
				"4116",
				"4112",

				"哪种颜色*不是*彩虹的一部分?",
				"粉色",
				"靛蓝色",
				"橘黄色",
				"蓝色",

				"出生点有什么彩蛋?",
				"sabe Hichatu",
				"什么也没有",
				"一个能让你回复到300血的按钮",
				"一个彩虹屁神器",

				"一米是?",
				"100 厘米",
				"10 厘米",
				"100 毫米",
				"10000 毫米",

				"10000 毫米是?",
				"10 米",
				"100 厘米",
				"100 米",
				"1 厘米",

				"'X'=?:\n8 > 16 > X > 64 > 128",
				"32",
				"24",
				"48",
				"38",
	
				"180厘米等于多少英尺?(提示:1 英尺=30.48 厘米)",
				"5.90",
				"5.80",
				"5.70",
				"5.60",

				"这张地图有多少幅画?",
				"24",
				"18",
				"16",
				"22",

				"有多少位 mappers 共同制作该张地图?",
				"16",
				"11",
				"20",
				"8",

				"用什么软件制作 CS:GO 地图?",
				"Hammer Editor",
				"Source Mapper Tool",
				"Source World Editor",
				"GoldSource Editor",

				"英语字母表中 'M' 之前是什么?",
				"L",
				"N",
				"K",
				"H",

				"这是个问题吗?",
				"肯定是",
				"不确定",
				"绝对不是",
				"不，不是",

				"月球的引力是多少?\n(地球引力百分比)",
				"16.6%",
				"8.4%",
				"23.1%",
				"39.3%",

				"谁制作了该关卡?",
				"Luffaren",
				"Enviolinador",
				"Mojonero",
				"Hichatu",

				"谁制作了 'Dystopia' 关卡?",
				"Hichatu",
				"Spaick",
				"Mavis",
				"Soft Serve",

				"谁制作了 'Action Sack' 关卡?",
				"The Ordiaxer",
				"Mojonero",
				"Luffaren",
				"Telo",

				"谁制作了 'Clusterfuck' 关卡?",
				"Chinny",
				"T3RM1N4T0R :D",
				"Ihcra",
				"Pompje",

				"谁制作了 'Colorful Mess' 关卡?",
				"T3RM1N4T0R :D",
				"Enviolinador",
				"ZpLit",
				"Qazlll456",

				"谁制作了 'Hallwaython Depot' 关卡?",
				"Enviolinador",
				"The Ordiaxer",
				"Chinny",
				"Telo",

				"该关卡叫什么名字?",
				"Quizmo Boner",
				"Question Boner",
				"Quizmo questionare",
				"Boner Questioning",

				"ze_ffvii_mako_reactor_v5 作者是谁?",
				"Hannibal",
				"Kaemon",
				"Enviolinador",
				"Malgo",

				"ze_ffvii_mako_reactor_v6 作者是谁?",
				"Kaemon",
				"Hannibal",
				"Enviolinador",
				"Malgo",
	
				"在Pirates Port Royal boss战中, 什么技能要按住s...",
				"Vortex 旋涡",
				"Waves 海浪",
				"Barrels 炸药桶",
				"Bubbles 泡泡",

				"2010年现任美国总统是?",
				"奥巴马",
				"小布什",
				"特朗普",
				"克林顿",

				"什么是长臂猿?",
				"灵长类动物",
				"血块",
				"一个水果",
				"一种时尚风格",

				"什么是脾?",
				"器官",
				"机械工具",
				"乐器",
				"饮料",

				"考拉主要吃什么?",
				"桉树",
				"昆虫",
				"树皮",
				"鸸鹋屎",

				"细胞的动力是?",
				"线粒体",
				"细胞核",
				"液泡",
				"细胞质",

				"超人的弱点是什么?",
				"氪铁矿",
				"女人",
				"酒",
				"不公平",

				"在真空中什么东西会先降落\nA 钢球还是羽毛?",
				"他们将同时降落",
				"钢球",
				"羽毛",
				"他们不会因为在真空中而坠落",

				"第二次世界大战是哪一年结束的?",
				"1945",
				"1946",
				"1947",
				"1944",

				"汤姆努克是什么动物?\n(在动物之森里)",
				"狸猫",
				"长颈鹿",
				"大象",
				"熊",

				"人体最重的器官是什么?",
				"皮肤",
				"肝",
				"脑",
				"肺",

				"眼睛的有色部分称为?",
				"虹膜",
				"视网膜",
				"角膜",
				"瞳孔",

				"蜘蛛恐惧症是害怕什么生物?",
				"蜘蛛",
				"蛇",
				"蠕虫",
				"老鼠",

				"什么是 '绝对零度'?",
				"热力学的最低温度",
				"一个连亲吻女孩都不会的书呆子",
				"当车辆完全停止时",
				"ATM 余额数量",

				"最快的速度是多少?",
				"光速",
				"音速",
				"地球的速度",
				"你的速度",

				"CS:GO 切刀移动速度是多少?",
				"250 units/s",
				"200 units/s",
				"150 units/s",
				"100 units/s",

				"超级马里奥兄弟是哪一年出的?",
				"1985",
				"1983",
				"1986",
				"1982",

				"水的化学式是什么?",
				"H2O",
				"H2O2",
				"H2",
				"O2",

				"冰处于什么状态?",
				"固体",
				"液体",
				"气体",
				"等离子体",
	
				"下午2点 用24小时制表示?",
				"14:00",
				"2:00",
				"12:00",
				"20:00",

				"珠穆朗玛峰位于哪里?",
				"喜马拉雅山",
				"阿尔卑斯山",
				"安第斯山脉",
				"落基山脉",

				"刹车时什么会使汽车减速?",
				"摩擦",
				"空气阻力",
				"引擎",
				"重力",

				"Zazu 是哪里的角色...",
				"狮子王",
				"风中奇缘",
				"丛林之书",
				"斑比",

				"电脑中一字节(byte)等于多少位(bit)?",
				"8",
				"1",
				"10",
				"32",

				"一吨有多重?",
				"1000 公斤",
				"1000 克",
				"100 公斤",
				"10000 克",

				"哪些是第1代入门宝可梦?",
				"妙蛙种子, 小火龙 和 杰尼龟",
				"菊草叶, 火球鼠 和 小锯鳄",
				"木守宫, 火稚鸡 和 水跃鱼",
				"草苗龟, 小火焰猴 和 波加曼",

				"韩国的首都是什么?",
				"首尔",
				"平壤",
				"釜山",
				"仁川",
	
				"CSGO中控制投掷物投掷力度有（）种方法",
				"4种",
				"1种",
				"3种",
				"2种",

				"CSGO中关于投掷物中拔栓是否有声音，正确的是",
				"只有T的燃烧瓶有声音",
				"全都没有声音",
				"全都有声音",
				"都不对",

				"CSGO休闲模式开挂，会被VAC吗? 会上监管吗?",
				"会 不会",
				"不会 不会",
				"会 会",
				"不会 会",

				"这张地图的英文名是?",
				"ze_mapeadores_museum",
				"ze_madeadores_museum",
				"ze_mapeadores_muceum",
				"ze_madeadores_muceum",

				"下列哪张僵尸逃跑地图中没有跳刀元素?",
				"ze_santassination_v3 狮子王",
				"ze_S_A_M_v1_7 剑与魔法",
				"ze_FFXIV_Wanderers_Palace_v5_2 最终幻想14：放浪古神殿v5",
				"ze_FFVII_Mako_Reactor_v5_3_v5 最终幻想7：魔光炉",

				"下列哪张僵尸逃跑地图中没有弹幕或方块元素?",
				"ze_yueyingchuanshuo 月影传说",
				"ze_visualizer 监视者",
				"ze_minimal_csgo 极病",
				"ze_luciddreams 清醒的梦",

				"下列哪张僵尸逃跑地图不是卤粉图?",
				"ze_halo_p3 光环",
				"ze_interception_p2 窃听计划",
				"ze_infiltration_final_r1 潜入行动",
				"ze_halo_poa_p4 光环行动",

				"X社区中人类最多能同时携带几颗地雷?",
				"1",
				"2",
				"3",
				"没有限制",

				"X社区中高爆手雷/燃烧瓶的原价是?",
				"3000/5000",
				"300/600",
				"3000/6000",
				"2400/4000",

				"X社区地图最多能延长几次?",
				"6",
				"8",
				"4",
				"5",

				"下列判断有误的一项是",
				"我们学过的鲁迅的《故乡》、《藤野先生》都出自他的散文集《朝花夕拾》",
				"《木兰诗》是我国南北朝时期北方的一首乐府民歌，它叙述了木兰女扮男装、代父从军、建功立业、辞官还乡的故事",
				"在中国文学史上的“唐宋八大家”中，有苏氏三父子，他们是父亲苏洵，儿子苏轼和苏辙",
				"莎士比亚是英国杰出的戏剧家和诗人。《威尼斯商人》是莎士比亚的著名喜剧",

				"下列函数中，y是x的一次函数的是 1.y=x-6; 2.y=-3x–1; 3.y=-0.6x; 4.y=7-x;",
				"1,2,3,4",
				"1,2,3",
				"1,3,4",
				"2,3,4",

				"划分地球南北半球和东西半球的界线分别是",
				"0度纬线，西经20度和东经160度",
				"赤道，0度和180度经线",
				"赤道，西经160度和东经20度",
				"北纬30度纬线，西经20度和东经160度",

				//"question",
				//"correct_answer",
				//"wrong_answer_1",
				//"wrong_answer_2",
				//"wrong_answer_3",

];
//=========================================================================================================================================\\
ticking <- true;
ending <- false;
function RoundStartInit()
{
	//EntFireByHandle(self,"Trigger","",0.00,null,null);					//TODO - remove
}
function Start()
{
	EntFire("stage_lqq_template","ForceSpawn","",0.00,null);
	EntFireByHandle(self,"RunScriptCode"," Start2(); ",0.05,null,null);
	EntFireByHandle(self,"RunScriptCode"," Start3(); ",intermission_time+0.50,null,null);
	EntFireByHandle(self,"RunScriptCode"," Tick(); ",0.10,null,null);
	EntFire("Console","Command","sv_disable_radar 1",0.00,null);
	EntFire("Console","Command","say ***欢迎来到 BONER QUIZ***",0.00,null);
	EntFire("Console","Command","say ***欢迎来到 BONER QUIZ***",0.01,null);
	EntFire("Console","Command","say ***欢迎来到 BONER QUIZ***",0.02,null);
	EntFire("Console","Command","say ***将屏幕分辨率设置为/低于1080p***",0.03,null);
	EntFireByHandle(self,"RunScriptCode"," RunIntermission(); ",1.00,null,null);
	EntFire("lqq_finalebridge_text","DisableDraw","",0.05,null);
	EntFire("Console","Command","sm_rcon sm_store_credit_amount_kill 0",0.00,null);
}
function Start2()
{
	EntFire("lqq_finalebridge_h","Open","",0.00,null);
	EntFire("lqq_finalebridge_z","Open","",0.00,null);
	EntFire("lqq_finalebridge_h","Open","",0.20,null);
	EntFire("lqq_finalebridge_z","Open","",0.20,null);
	tpfail_h = Entities.FindByName(null,"stage_lqq_tpdest_cage_h").GetOrigin();
	tpfail_z = Entities.FindByName(null,"stage_lqq_tpdest_cage_z").GetOrigin();
	self.PrecacheScriptSound("*luffaren_quizmo/correct.mp3");
	self.PrecacheScriptSound("*luffaren_quizmo/incorrect.mp3");
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player"))){ValidateQuizScope(h,true);}
	for(local i=0;i<gen_amount;i++)
	{
		local question = "What is:\n";
		local n = RandomInt(gen_n1_range_min,gen_n1_range_max);
		local n2 = RandomInt(gen_n2_range_min,gen_n2_range_max);
		if(RandomFloat(0.00,100.00)<=gen_chance_divide)
		{
			n=RandomInt(gen_div_range_min,gen_div_range_max);if((n % 2)!=0)n++;
			n2=2;
			question = question+n.tostring()+"/"+n2.tostring();
			n = (n/2);
		}
		else
		{
			if(RandomFloat(0.00,100.00)<=gen_chance_subtract)
			{question=question+n.tostring()+"-"+n2.tostring();n-=n2;}
			else{question=question+n.tostring()+"+"+n2.tostring();n+=n2;}
		}
		if(RandomFloat(0.00,100.00)<=gen_chance_n3)
		{
			local n3 = RandomInt(gen_n3_range_min,gen_n3_range_max);
			if(RandomFloat(0.00,100.00)<=gen_chance_subtract)
			{question=question+"-"+n3.tostring();n-=n3;}
			else{question=question+"+"+n3.tostring();n+=n3;}
		}
		question = question+"?";
		local nw1 = -99999;
		local nw2 = -99999;
		local nw3 = -99999;
		while(nw1 == -99999){nw1=0+n+RandomInt(-8,8);if(nw1==n||nw1==nw2||nw1==nw3)nw1 = -99999;}
		while(nw2 == -99999){nw2=0+n+RandomInt(-8,8);if(nw2==n||nw2==nw1||nw2==nw3)nw2 = -99999;}
		while(nw3 == -99999){nw3=0+n+RandomInt(-8,8);if(nw3==n||nw3==nw1||nw3==nw2)nw3 = -99999;}	
		local answer = n.tostring();
		local wanswer1 = nw1.tostring();
		local wanswer2 = nw2.tostring();
		local wanswer3 = nw3.tostring();
		QUIZ_LIST.push(question);
		QUIZ_LIST.push(answer);
		QUIZ_LIST.push(wanswer1);
		QUIZ_LIST.push(wanswer2);
		QUIZ_LIST.push(wanswer3);
	}
}
function Start3()
{
	local humanTP = Entities.FindByName(null,"stage_lqq_tp_in_h");
	local humancageTP = Entities.FindByName(null,"stage_lqq_tpdest_cage_z");
	humanTP.SetOrigin(humancageTP.GetOrigin());
	humanTP.SetAngles(0,0,0);
}
ptextlist <- [];
ptexindex <- 0;
function Tick()
{
	if(!ticking)return;
	EntFireByHandle(self,"RunScriptCode"," Tick(); ",0.05,null,null);
	EntFire("lqq_cage_h_trigger","Toggle","",0.00,null);
	//EntFire("lqq_cage_h_trigger_antiedge","Toggle","",0.00,null);			//TP triggers are fine, i think? pushes are not
	if(ptextlist.len()<=0)
	{
		local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
		{
			if(h.GetHealth()<=0)continue;
			ptextlist.push(h);
		}
	}
	for(local i=1;i<5;i++)
	{
		if(ptextlist.len()<=0)break;
		local h = ptextlist[0];
		ptextlist.remove(0);
		if(h==null||!h.IsValid()||h.GetHealth()<=0){i--;continue;}
		local vp=ValidateQuizScope(h);if(!vp){i--;continue;}
		ptexindex++;if(ptexindex>5)ptexindex=1;
		local txt = Entities.FindByName(null,"lqq_text"+ptexindex.tostring());
		txt.__KeyValueFromString("message",h.GetScriptScope().lqq_text);
		EntFireByHandle(txt,"Display","",0.01,h,null);
	}
}
function RunIntermission()
{
	if(ending)return;
	quiz_amount--;
	if(quiz_amount<0)
	{
		ending = true;
		EntFire("lqq_cage_z_trigger","Enable","",6.00,null);
		EntFire("lqq_cage_z_trigger","Enable","",7.00,null);
		EntFire("lqq_cage_z_trigger","Enable","",10.00,null);
		//EntFire("lqq_zside_humanhurt","Disable","",finale_bridge_delay+6.00,null);	//keep enabled, prevent boosters !ztele-ing
		EntFire("Console","Command","sv_disable_radar 0",0.00,null);
		EntFire("lqq_cage_h_trigger_antiedge","Kill","",14.00,null);
		EntFire("lqq_blockbullet","Kill","",0.00,null);
		EntFire("lqq_music_finale","PlaySound","",0.00,null);
		EntFire("lqq_music_finale","Volume","10",0.00,null);
		EntFire("lqq_music_finale","Pitch","100",0.00,null);
		EntFire("lqq_music_finale","Volume","10",0.01,null);
		EntFire("lqq_music_finale","Pitch","100",0.01,null);
		EntFire("lqq_music_finale","Volume","10",0.02,null);
		EntFire("lqq_music_finale","Pitch","100",0.02,null);
		EntFire("lqq_music_finale","Volume","10",0.03,null);
		EntFire("lqq_music_finale","Pitch","100",0.03,null);
		EntFire("lqq_music_finale","Volume","10",0.04,null);
		EntFire("lqq_music_finale","Pitch","100",0.04,null);
		EntFire("lqq_music_finale","Volume","10",0.05,null);
		EntFire("lqq_music_finale","Pitch","100",0.05,null);
		EntFire("lqq_finalebridge_text","EnableDraw","",finale_bridge_delay+5.15,null);
		EntFire("lqq_finalebridge_h","Close","",finale_bridge_delay,null);
		EntFire("lqq_finalebridge_z","Close","",finale_bridge_delay,null);
		EntFire("lqq_finalebridge_z","Open","",35.70,null);
		EntFire("lqq_finalebridge_h","Open","",38.90,null);
		EntFire("lqq_finalebridge_text","DisableDraw","",38.90,null);
		EntFire("Console","Command","say ***所有的考题都答对了***",0.00,null);
		EntFire("Console","Command","say ***幸存者现在必须防守阵地***",1.00,null);
		EntFire("Console","Command","say ***祝你好运***",2.00,null);
		EntFire("Console","Command","say ***LEAVING IN 40 SECONDS***",3.90,null);
		EntFire("Console","Command","say ***LEAVING IN 30 SECONDS***",13.90,null);
		EntFire("Console","Command","say ***LEAVING IN 20 SECONDS***",23.90,null);
		EntFire("Console","Command","say ***LEAVING IN 10 SECONDS***",33.90,null);
		EntFire("Console","Command","say ***LEAVING IN 5***",38.90,null);
		EntFire("Console","Command","say ***LEAVING IN 4***",39.90,null);
		EntFire("Console","Command","say ***LEAVING IN 3***",40.90,null);
		EntFire("Console","Command","say ***LEAVING IN 2***",41.90,null);
		EntFire("Console","Command","say ***LEAVING IN 1***",42.90,null);
		EntFire("Console","Command","say ***SAY ADIEU TO BONER QUIZ***",43.90,null);
		EntFire("Console","Command","say ***SAY ADIEU TO BONER QUIZ***",43.91,null);
		EntFire("Console","Command","say ***SAY ADIEU TO BONER QUIZ***",43.92,null);
		EntFire("MuseumPrepareVotingRoom","Trigger","",43.40,null);
		EntFire("stage_lqq_tp_out_humanwin","Enable","",43.90,null);
		EntFire("stage_lqq_tp_out_all","Enable","",44.20,null);
		EntFire("lqq_*","Kill","",45.00,null);
		EntFireByHandle(self,"RunScriptCode"," ticking = false; ",43.00,null,null);
		EntFire("Console","Command","sm_rcon sm_store_credit_amount_kill 4",43.00,null);
		return;
	}
	EntFire("lqq_music_intermission","Volume","0",0.00,null);
	EntFire("lqq_music_intermission","Volume","10",0.02,null);
	EntFire("lqq_music_intermission","PlaySound","",0.00,null);
	EntFire("lqq_music_intermission","Pitch","100",0.1,null);
	EntFire("lqq_music_intermission","Volume","10",0.1,null);
	EntFire("lqq_music_intermission","Volume","10",0.00,null);
	EntFire("lqq_music_intermission","Pitch","100",0.00,null);
	EntFire("lqq_music_intermission","Volume","10",0.01,null);
	EntFire("lqq_music_intermission","Pitch","100",0.01,null);
	EntFire("lqq_music_intermission","Volume","10",0.02,null);
	EntFire("lqq_music_intermission","Pitch","100",0.02,null);
	EntFire("lqq_music_intermission","Volume","10",0.03,null);
	EntFire("lqq_music_intermission","Pitch","100",0.03,null);
	EntFire("lqq_music_intermission","Volume","10",0.04,null);
	EntFire("lqq_music_intermission","Pitch","100",0.04,null);
	EntFire("lqq_music_intermission","Volume","10",0.05,null);
	EntFire("lqq_music_intermission","Pitch","100",0.05,null);
	EntFire("Console","Command","say ***正在生成新考题...***",0.00,null);
	EntFire("Console","Command","say ***考试将在3秒后开始***",intermission_time-3.00,null);
	EntFire("Console","Command","say ***考试将在2秒后开始***",intermission_time-2.00,null);
	EntFire("Console","Command","say ***考试将在1秒后开始***",intermission_time-1.00,null);
	EntFire("Console","Command","say ***你有 "+quiz_time.tostring()+" 秒来回答该测验***",intermission_time,null);
	EntFire("lqq_cage_z_trigger","Enable","",0.00+intermission_time-1.50,null);
	EntFire("lqq_cage_z_trigger","Disable","",0.00+intermission_time+(0.00+quiz_time-0.50),null);
	EntFireByHandle(self,"RunScriptCode"," GenerateQuestions(); ",intermission_time,null,null);
	EntFireByHandle(self,"RunScriptCode"," CheckAnswers(); ",0.00+intermission_time+quiz_time,null,null);
	EntFireByHandle(self,"RunScriptCode"," RunIntermission(); ",0.00+intermission_time+quiz_time+2.00,null,null);
	EntFire("lqq_music_intermission","Volume","0",intermission_time,null);
	for(local i=(0.00+intermission_time);i<(0.00+intermission_time+(quiz_time-1.10));i+=1.00)
	{EntFire("lqq_sound_heartbeat","PlaySound","",i,null);}
	self.PrecacheScriptSound("*luffaren_quizmo/correct.mp3");
	self.PrecacheScriptSound("*luffaren_quizmo/incorrect.mp3");
}
function TouchAnswer()
{
	local trigname = split(caller.GetName(),"lqq_votetrigger_")[0];
	local vp=ValidateQuizScope(activator);if(!vp)return;
	activator.GetScriptScope().lqq_answer <- trigname;
}
function UnTouchAnswer()
{
	local vp=ValidateQuizScope(activator);if(!vp)return;
	activator.GetScriptScope().lqq_answer <- "";
}
function ValidateQuizScope(handle,start=false)
{
	if(handle==null||!handle.IsValid())return false;
	handle.ValidateScriptScope();
	local sc = handle.GetScriptScope();
	if(!("lqq_answer" in sc) || start)
	{
		sc.lqq_answer <- "";
		sc.lqq_correct <- "X";
		sc.lqq_text <- "--------------------------------\n欢迎来到 Quizmo Boner\n--------------------------------\n"+
		"你必须回答 "+quiz_amount.tostring()+" 个个人考试.\n"+
		"如果你不回答，你就会死.\n祝你好运!";
	}
	return true;
}
function GenerateQuestions()
{
	local quizzlen = (QUIZ_LIST.len()/5);
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		local vp=ValidateQuizScope(h);if(!vp)continue;
		local sc = h.GetScriptScope();
		local qidx = (RandomInt(0,(0+quizzlen)-1)*5);
		local question = ""+QUIZ_LIST[qidx+0];
		local correct = ""+QUIZ_LIST[qidx+1];
		local wrong1 = ""+QUIZ_LIST[qidx+2];
		local wrong2 = ""+QUIZ_LIST[qidx+3];
		local wrong3 = ""+QUIZ_LIST[qidx+4];
		local choices = ["a","b","c","d"];
		local cr=RandomInt(0,choices.len()-1);local c=choices[cr];choices.remove(cr);sc.lqq_correct=(""+c);correct=""+(c.toupper())+")   "+correct;
		cr=RandomInt(0,choices.len()-1);c=choices[cr];choices.remove(cr);wrong1=""+(c.toupper())+")   "+wrong1;
		cr=RandomInt(0,choices.len()-1);c=choices[cr];choices.remove(cr);wrong2=""+(c.toupper())+")   "+wrong2;
		cr=RandomInt(0,choices.len()-1);c=choices[cr];choices.remove(cr);wrong3=""+(c.toupper())+")   "+wrong3;
		local order = [correct,wrong1,wrong2,wrong3];
		local msg = ""+question+"\n";
		for(local i=0;i<4;i++)
		{
			local desire="A)";
			if(i==1)desire="B)";
			else if(i==2)desire="C)";
			else if(i==3)desire="D)";
			for(local j=0;j<order.len();j++)
			{
				if(order[j].find(desire,0)==0)
				{
					local c=order[j];
					order.remove(j);
					msg = msg+"\n"+c;
				}
			}
		}
		sc.lqq_text = msg;
	}
}
tpfail_h <- null;
tpfail_z <- null;
function CheckAnswers()
{
	local h=null;while(null!=(h=Entities.FindByClassname(h,"player")))
	{
		local vp=ValidateQuizScope(h);if(!vp)continue;
		if(h.GetHealth()<=0.00)continue;
		local sc = h.GetScriptScope();
		sc.lqq_text = "";
		if(sc.lqq_answer == sc.lqq_correct)
		{
			EntFire("lqq_fade_correct","Fade","",0.00,h);
			EntFire("Client","Command","play *luffaren_quizmo/correct.mp3",0.00,h);
		}
		else
		{
			if(h.GetTeam()==2){h.SetOrigin(tpfail_h);h.SetAngles(0,180,0);h.SetVelocity(Vector(0,RandomInt(-250,250),0));}
			else{h.SetOrigin(tpfail_z);h.SetAngles(0,0,0);h.SetVelocity(Vector(0,RandomInt(-250,250),0));
			EntFire("Client","Command","drop",0.00,h);EntFire("Client","Command","drop",1.00,h);
			EntFire("Client","Command","drop",2.00,h);EntFire("Client","Command","drop",3.00,h);
			EntFire("Client","Command","drop",4.00,h);EntFire("Client","Command","drop",5.00,h);
			EntFire("Client","Command","drop",6.00,h);EntFire("Client","Command","drop",7.00,h);}	//added +drop for test3
			EntFire("lqq_fade_incorrect","Fade","",0.00,h);
			EntFire("Client","Command","play *luffaren_quizmo/incorrect.mp3",0.00,h);
		}
	}
}
