//package states.mikolka.vslice.components.crash.CrashState;

import flixel.FlxG;
import backend.Controls;
var Control = Controls.instance;
var scrool = 0;

function onCreatePost() {
    for (s in FlxG.sound.list){
        if (!s.playing)continue;
        s.fadeOut();
    }
    if (FlxG.sound.music!=null){
        FlxG.sound.music.fadeOut(5);//try stop next crash
    }
}
var nowY = -3;
var scrollDY = 35/4;
function onUpdate(e) {
    if (subState == null )return;
    if (nowY < 1) nowY += 1;
    if (nowY == 1){
        var sliceY = 0;
        for (l in 2...(subState.members.length)){
            var text = subState.members[l-1];
            var text2 = subState.members[l];
            if (Type.getClassName(Type.getClass(text))!="flixel.text.FlxText") continue;//not used
            if (Type.getClassName(Type.getClass(text2))!="flixel.text.FlxText") continue;//not used
            text2.y += sliceY;
            if (text2.y<text.y+text.height){
                sliceY += text.y+text.height-text2.y;
                text2.y += text.y+text.height-text2.y;
            }
            //text.y = Math.max(text.y,nowY);
            nowY = text2.y+text2.height;
            //trace(nowY);
        }
    }
    //if (SuperControls.justPressed("Q")||SuperControls.justPressed("E")){
    //    scaleS *= SuperControls.justPressed("E")?1.25:0.8;
    //    trace(scaleS);
    //    cameraEverything.zoom = scaleS;
    //}
	if (Control.pressed('ui_down')){
        scrool = Math.min(nowY-FlxG.height,scrool+scrollDY);
        subState.camOverlay.scroll.y = scrool;
    }
	if (Control.pressed('ui_up')){
        scrool = Math.max(0,scrool-scrollDY);
        subState.camOverlay.scroll.y = scrool;
    }
}