package substates.backend.CustomFadeTransition;

function onSubstateCreate(ss) {
    if (previousLoadingScreen!=null&&Type.getClassName(Type.getClass(FlxG.state))!="states.LoadingState"){
        ss.add(previousLoadingScreen);
        FlxTween.tween(previousLoadingScreen,{alpha:0},duration);
        transGradient.visible = false;
        transBlack.visible = false;
        //FlxG.sound.play(Paths.sound('snd_ominous'), 1);
    }
    
}
function onSubstateDestroy(ss) {
    if (previousLoadingScreen!=null&&Type.getClassName(Type.getClass(FlxG.state))!="states.LoadingState"){
        previousLoadingScreen.destroy();
        previousLoadingScreen = null;
        setGlobalVar('previousLoadingScreen',null);
        //FlxG.sound.play(Paths.sound('snd_ominoushell'), 1);
    }
}
function onDestroy() {
    onSubstateDestroy(null);
}