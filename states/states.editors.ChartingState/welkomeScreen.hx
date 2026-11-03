//package states.states.editors.ChartingState;
return;
import states.editors.content.BasePrompt;
import backend.ui.PsychUIButton;


    var clickStyle:UIStyleData = {
    bgColor: FlxColor.BLACK,
    textColor: FlxColor.WHITE,
    bgAlpha: 1
};
    var hoverStyle:UIStyleData = {
    bgColor: FlxColor.WHITE,
    textColor: FlxColor.BLACK,
    bgAlpha: 1
};
    var normalStyle:UIStyleData = {
    bgColor: 0xFFAAAAAA,
    textColor: FlxColor.BLACK,
    bgAlpha: 1
};
    var dangerStyle:UIStyleData = {
	bgColor: FlxColor.RED,
	textColor: FlxColor.WHITE,
    bgAlpha: 1
};
    var disabledStyle:UIStyleData = {
	bgColor: 0xFF3B3B3B,
	textColor: FlxColor.WHITE,
    bgAlpha: 1
};

function onCreatePost() {
    //if (PlayState.SONG == null){
    if (notes.length<1){
        trace("hi");
        aWelcome();
    }
    var tab = upperBox.getTab('View').menu;
    var btn:PsychUIButton = new PsychUIButton(tab.members[tab.length-1].x, tab.members[tab.length-1].y+20+1, '  welkone', function()
    {
        upperBox.isMinimized = true;
        upperBox.forceCheckNext = true;
        upperBox.update(0);
		upperBox.bg.visible = false;
        aWelcome();
        //mainBox.setPosition(mainBoxPosition.x, mainBoxPosition.y);
        //infoBox.setPosition(infoBoxPosition.x, infoBoxPosition.y);
        //UIEvent(PsychUIBox.DROP_EVENT, btn); //to force a save
    }, tab.members[tab.length-1].width);
    //btn.text.alignment = LEFT;
    tab.add(btn);
}
function aWelcome() {
    openSubState(new BasePrompt(420,160,'hello.',(state)->{
        var btnY = 390;
        var btn0:PsychUIButton = new PsychUIButton(0, btnY+30, 'cancel', ()->{
            //if (selected==null)return;
            //saveAs(pack, metadata);
            state.close();
        });
        btn0.screenCenter(0x01);
        btn0.x += 125;
        btn0.cameras = state.cameras;
        btn0.normalStyle = dangerStyle;
        state.add(btn0);
    }));
}