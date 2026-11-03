function onCheckEvent(ev) {
    if(ev[0]=="Play Sound"){
        FlxG.sound.play(Paths.sound(ev[1]), Std.parseFloat(ev[2]));
        //addOutText(ev[2],false,true);
    }
}