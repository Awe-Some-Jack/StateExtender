package scripts.modules.states.editors.ChartingState;

function onCreatePost() {
    for (b in upperBox.getTab('View').menu){
        if (b.label == "  Reset UI Boxes"){
            //for (i in ["fileDialog","upperBox","fileDialog","overwriteCheck","overwriteSavedSomething","openSubState","selectedNotes","PsychUIButton","createEvent","events","undoActions","softReloadNotes","Difficulty","loadChart","reloadNotesDropdowns","prepareReload"])
            //    this.set(i,Reflect.field(FlxG.state,i));
            b.normalStyle.bgColor = 0xFFADA0B1;
            b.onClick = ()->{
                for (m in 0...getVarH("TBoxs").length){
                    var T = getVarH("TBoxs")[m];
                    T.x = mainBox.x+(m * 120 - getVarH("TBoxs").length*120);
                    T.y = mainBox.y;
                }
                mainBox.setPosition(mainBoxPosition.x-75, mainBoxPosition.y);
                infoBox.setPosition(infoBoxPosition.x, infoBoxPosition.y);
                UIEvent(PsychUIBox.DROP_EVENT, b); //to force a save
            };
        }
    }
}