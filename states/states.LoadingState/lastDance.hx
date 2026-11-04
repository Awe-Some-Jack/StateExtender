package states.states.LoadingState;

import openfl.display.BitmapData;
var previousLoadingScreen;
//var take = false;
function onCreatePost() {
    //takeScreen();
}
function onUpdatePost() {
    if (!FlxG.camera.visible){
        add(new FlxText(FlxG.width-100,FlxG.height-30,80,"one moment"));
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