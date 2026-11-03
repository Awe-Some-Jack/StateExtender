//package states.states.editors.ChartingState;

import flixel.FlxG;
var cursor ;
var cursor2 ;
function onSubstateCreate() {
    //trace(Paths.getPath("images/"+"combo"+".png"));
    FlxG.sound.play(Paths.sound('snd_ominous'), 0.1);
}
function onSubstateCreates() {
    cursor = new FlxSprite();
    cursor.loadGraphic(Paths.getPath("images/"+"num4"+".png"));
    cursor.x = 3/4*FlxG.width;
    cursor.y = 10;
    cursor2 = new FlxSprite();
    cursor2.loadGraphic(Paths.getPath("images/"+"num2"+".png"));
    cursor2.x = 3/4*FlxG.width+70;
    cursor2.y = 700;
    cursor.scale.set(0.5,0.5);
    cursor2.scale.set(0.5,0.5);
    cursor.scrollFactor.set(1,1);
    cursor2.scrollFactor.set(-1,-1);
   super.add(cursor); 
   super.add(cursor2); 
}
function onDestroy() {
    trace("hi");
    cursor.destroy();
    cursor2.destroy();
    //FlxG.sound.play(Paths.sound('snd_ominous_cancel'), 0.6);
}