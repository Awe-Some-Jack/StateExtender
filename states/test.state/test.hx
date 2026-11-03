//package states.test.state;
import backend.Controls;
import backend.MusicBeatState;
import states.editors.ResultPreviewMenu;

function onCreate(?t) {
    add(new FlxSprite(100,100));
    add(new FlxText(100,200,0,t ?? "null?"));
    trace(StateHelper.this.interp.resolve("HXmodules"));
}
var Control = Controls.instance;
function onUpdate(e) {
	if (Control.justPressed('debug_1')){
		//playSnd("splat");
		//MusicBeatState.resetState();
        MusicBeatState.switchState(new ResultPreviewMenu());
    }
	if (Control.justPressed('debug_2')){
		//playSnd("splat");
		MusicBeatState.resetState();}
}