//package states.mikolka.vslice.results.ResultState;

import flixel.FlxG;
import backend.Controls;
import backend.MusicBeatState;
import states.editors.ResultPreviewMenu;
import Reflect;

function onCreate() {
    
    //FlxG.sound.play(Paths.sound('snd_ominous'), 0.6);
    //Control 
}
var scaleS = 1;
var Control = Controls.instance;
var visiblolo = true;
var visibles = [0=>0];
var reverse = false;
function onUpdate(e) {
    reverse = !reverse;
    if (reverse) return;
    //if (subState == )
    if (SuperControls.justPressed("Q")||SuperControls.justPressed("E")){
        scaleS *= SuperControls.justPressed("E")?1.25:0.8;
        trace(scaleS);
        cameraEverything.zoom = scaleS;
    }
    if (SuperControls.justPressed("V")){
        visiblolo = !visiblolo;
        for (m in members){
            //if (Reflect.hasField(m,"alpha"))
            try{
                if (!visibles.exists(m.ID))visibles.set(m.ID,m.alpha);
                m.alpha = visibles.get(m.ID)*(visiblolo?1:0.5);
            }catch(e:Dynamic){}
        }
    }
	if (Control.justPressed('debug_1')){
		//playSnd("splat");
		//MusicBeatState.resetState();
        MusicBeatState.switchState(new ResultPreviewMenu());
    }
}