//package states.states.ModsMenuState;
//return;
import backend.ui.PsychUIButton;
import states.ModsMenuState;
import crowplexus.iris.Iris;
import flixel.FlxG;
import haxe.io.Path;

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

var state;
var button;
function onCreatePost() {
    state = FlxG.state;
    button = new PsychUIButton(state.modDesc.x+state.modDesc.width-70,state.modDesc.y,"diactivate",()->{diss();},70,20);
    //button.color = 0xFFDA1919;
    button.normalStyle = dangerStyle;
    button.visible = false;
    state.add(button);
}
var lCSM = -1;
// in p-slice curSelectedMod and modsGroup are static but in psychEngine no;
function onUpdatePost(e) {
    if (state == null) return;
    if ((state.curSelectedMod ?? ModsMenuState.curSelectedMod)!=lCSM){
        lCSM = (state.curSelectedMod ?? ModsMenuState.curSelectedMod);
        //trace(button);
        button.visible = Path.normalize((state.modsGroup ?? ModsMenuState.modsGroup).members[lCSM].folder)==Path.normalize(this.config.name).split("/")[1];
    }
}
function diss() {
    try{
    FlxG.signals.postUpdate.remove(res("signalOnUpdatePost"));
    FlxG.signals.preUpdate.remove(res("signalOnUpdate"));
    FlxG.signals.preStateCreate.remove(res("signalOnCreate"));
    FlxG.signals.preStateSwitch.remove(res("signalOnSwitch"));
    FlxG.signals.postStateSwitch.remove(res("signalOnSwitchPost"));
    FlxG.signals.postDraw.remove(res("signalOnDrawPost"));
    FlxG.signals.preDraw.remove(res("signalOnDraw"));
    FlxG.signals.focusGained.remove(res("signalOnFocus"));
    FlxG.signals.focusLost.remove(res("signalOnFocusLost"));
    FlxG.signals.gameResized.remove(res("signalOnGameResized"));
    Iris.instances.remove(StateHelper.this.config.name+"_cloned"); 
    Iris.instances.remove(StateHelper.this.config.name); 
    button.destroy();
    //trace(StateHelper.this.get("signalOnSwitchPost"));
    res("signalOnSwitchPost")();
    //StateHelper.getLV("this").destroy();
    }catch(e:Dynamic){
        trace(e);
        //for (i in [button]){
        //    i.normalStyle = disabledStyle;
        //    i.hoverStyle = disabledStyle;
        //    i.clickStyle = disabledStyle;
        //}
        button.text.text = "no(";
    }
}
function res(_var) {
    return StateHelper.this.interp.resolve(_var);// only in P-Slice ((
    //return StateHelper.getLV(_var);
}