function InputUse(){
	if(self.GetRootMoveParent()==null)return true;
	if(self.GetRootMoveParent().GetClassname()=="player"){
		return activator==self.GetRootMoveParent();
	}
	if(self.GetRootMoveParent().GetClassname().slice(0,7)=="weapon_"){
		return false;
	}
	return true;
}
