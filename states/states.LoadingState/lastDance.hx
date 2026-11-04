package states.states.LoadingState;

import openfl.display.BitmapData;
var previousLoadingScreen;
//var take = false;
function onCreatePost() {
    //takeScreen();
}
function onUpdatePost() {
    if (!FlxG.camera.visible){
        var Ftext = new FlxText(FlxG.width-100,FlxG.height-30,80,"one moment");
        Ftext.cameras = [FlxG.cameras.list[FlxG.cameras.list.length-1]]; 
        Ftext.camera = FlxG.cameras.list[FlxG.cameras.list.length-1]; 
        add(Ftext);
        if (subState!=null)subState.add(Ftext);
        takeScreen();
        //take = true;
        FlxG.camera.visible = true;
    }
}
function takeScreen() {
    previousLoadingScreen = new FlxSprite(0, 0, BitmapData.fromImage(FlxG.stage.window.readPixels()));
    previousLoadingScreen.setGraphicSize(FlxG.width,FlxG.height);
    previousLoadingScreen.updateHitbox();
    setGlobalVar('previousLoadingScreen',previousLoadingScreen);
}