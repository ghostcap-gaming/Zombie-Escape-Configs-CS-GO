function OnPostSpawn() {
	local Text = null;
	if(self.GetName().find("rashomon_HudHint") == 0){Text = "名称: 五重罗生门 \n效果: 生成五座罗生门 \n持续时间: 8-12 秒 \n冷却时间: 只能使用一次";}
	if(self.GetName().find("kajukai_korin_HudHint") == 0){Text = "名称: 木遁-花树界降临 \n效果: 生成一片巨大森林对僵尸造成伤害 \n持续时间: 9秒 \n冷却时间：只能使用一次";}
	if(self.GetName().find("zamateratsu_HudHint") == 0){Text = "名称: 爆风乱舞 \n效果: 对周围生成一团火焰对人类造成伤害 \n持续时间: 4 秒 \n冷却时间: 60 秒";}
	if(self.GetName().find("zgenjutsu_hud_hint") == 0){Text = "名称: 黑暗行之术 \n效果: 制造扰乱人类视野的粒子特效 \n持续时间: 8 秒 \n冷却时间: 50 秒";}
	if(self.GetName().find("zheal_hud_hint") == 0){Text = "名称: 轮回天生 \n效果: 治疗周围僵尸并加速 \n持续时间: 5 秒 \n冷却时间: 50 秒";}
	if(self.GetName().find("zkaleidoscope_hud_hint") == 0){Text = "名称: 加具土命 \n描述 : 阻止人类移动 \n效果: 扔出一团粒子特效人类接触它就会被冰冻 \n持续时间: 5 秒 \n冷却时间: 70 秒";}
	if(self.GetName().find("zmadara_hud_hint") == 0){Text = "名称: 宇智波斑 \n效果: 召唤宇智波斑他会在周围召唤火焰. 对人类造成巨大伤害 \n持续时间: 3 秒 \n冷却时间: 160 秒";}
	if(self.GetName().find("zsharingan_HudHint") == 0){Text = "名称: 万象天引 \n效果: 将周围人类吸附到你身旁 \n持续时间: 2 秒 \n冷却时间: 90 秒";}
	if(self.GetName().find("zitachi_hud_hint") == 0){Text = "Name: Itachi clone \nEffect: Spawn Itachi clone that explose after few seconds \nDuration: Unknown \nCooldown: 60 Secs";}
	if(Text != null)self.__KeyValueFromString("message",Text);
}
