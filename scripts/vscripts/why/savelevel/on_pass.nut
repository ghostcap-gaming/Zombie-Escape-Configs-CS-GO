function onPass(){
	EntFire("why_map_data", "RunScriptCode", "LevelUp();", 0, activator);
}
self.ConnectOutput("OnPass", "onPass");
