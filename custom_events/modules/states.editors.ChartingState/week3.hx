var state ;
function onCreate() {
    state = FlxG.state;
}
var phillyLightsColors = [0xFF31A2FD, 0xFF31FD8C, 0xFFFB33F5, 0xFFFD4531, 0xFFFBA633];
var curLightEvent = -1;
function onCheckEvent(ev) {
    if (ev[0]!="Philly Glow") return;
    try{
        switch(ev[1]){
            case "0":
                state.changeTheme(state.theme);
                FlxG.camera.flash(state.bg.color, 0.5, null, true);
            case "1":
                curLightEvent = FlxG.random.int(0, phillyLightsColors.length-1, [curLightEvent]);
                state.bg.color = phillyLightsColors[curLightEvent];
                FlxG.camera.flash(phillyLightsColors[curLightEvent], 0.5, null, true);
            case "2":
                //var colorButLower = phillyLightsColors[curLightEvent];
                ////colorButLower.alpha = 64;
                ////pass
        }
    }catch(e:Dynamic){addOutText(e,true,true);}
}