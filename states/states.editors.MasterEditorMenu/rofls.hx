//package states.states.editors.ChartingState;
import backend.Controls;

import flixel.FlxG;
var cursor ;
var cursor2 ;
function onCreate() {
    //trace(Paths.getPath("images/"+"combo"+".png"));
    //FlxG.sound.play(Paths.sound('snd_ominous'), 0.6);
}
function onCreatePost() {
    cursor = new FlxSprite();
    cursor.loadGraphic(Paths.getPath("images/"+"num4"+".png"));
    cursor.x = 3/4*FlxG.width;
    cursor.y = 10;
    cursor2 = new FlxSprite();
    cursor2.loadGraphic(Paths.getPath("images/"+"num2"+".png"));
    cursor2.x = 3/4*FlxG.width+70;
    cursor2.y = 10;
    cursor.scale.set(0.5,0.5);
    cursor2.scale.set(0.5,0.5);
    cursor.scrollFactor.set(1,1);
    cursor2.scrollFactor.set(-1,-1);
   add(cursor); 
   add(cursor2); 
}
function onDestroy() {
    trace("hi");
    cursor.destroy();
    cursor2.destroy();
    //FlxG.sound.play(Paths.sound('snd_ominous_cancel'), 0.6);
}
var Control = Controls.instance;
function onUpdate(e) {
    //if (subState == )
    //if (SuperControls.justPressed("Q")||SuperControls.justPressed("E")){
    //    scaleS *= SuperControls.justPressed("E")?1.25:0.8;
    //    trace(scaleS);
    //    cameraEverything.zoom = scaleS;
    //}
	if (Control.justPressed('debug_2')){
		//playSnd("splat");
		//MusicBeatState.resetState();
        //MusicBeatState.switchState(new ResultPreviewMenu());
        StateHelper.switchCustomState("test.state",['testing']);
    }
}