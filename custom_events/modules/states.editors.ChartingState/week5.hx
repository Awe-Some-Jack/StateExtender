//package custom_events.modules.states.editors.ChartingState;

function onCheckEvent(ev) {
    if (ev[0]!="Trigger BG Ghouls") return;
    try{
        //addOutText("hi");
        //FlxTween.cancelTweensOf(bg);
        changeTheme(theme);
        FlxTween.color(bg,0.8,0xFF9403A7,bg.color);
        //switch(ev[1]){
        //    case "0":
        //        state.changeTheme(state.theme);
        //        FlxG.camera.flash(state.bg.color, 0.5, null, true);
        //    case "1":
        //        curLightEvent = FlxG.random.int(0, phillyLightsColors.length-1, [curLightEvent]);
        //        state.bg.color = phillyLightsColors[curLightEvent];
        //        FlxG.camera.flash(phillyLightsColors[curLightEvent], 0.5, null, true);
        //    case "2":
        //        //var colorButLower = phillyLightsColors[curLightEvent];
        //        ////colorButLower.alpha = 64;
        //        ////pass
        //}
    }catch(e:Dynamic){addOutText(e,true,true);}
}