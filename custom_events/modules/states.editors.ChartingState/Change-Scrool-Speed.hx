import backend.ClientPrefs;
var songSpeedType = ClientPrefs.getGameplaySetting('scrolltype');
var songSpeedTween;
function onCheckEvent(ev) {
    if (subState==null)return;
    if(ev[0]=="Change Scroll Speed"){
        //addOutText(ev);

        var flValue1:Null<Float> = Std.parseFloat(ev[1]);
        var flValue2:Null<Float> = Std.parseFloat(ev[2]);
        if (songSpeedType != "constant")
			{
				if (flValue1 == null)
					flValue1 = 1;
				if (flValue2 == null)
					flValue2 = 0;

				var newValue:Float = PlayState.SONG.speed * ClientPrefs.getGameplaySetting('scrollspeed') * flValue1;
				if (flValue2 <= 0)
					subState.songSpeed = newValue;
				else
					songSpeedTween = FlxTween.tween(subState, {songSpeed: newValue}, flValue2 / subState.playbackRate, {
						ease: FlxEase.linear,
						onComplete: function(twn:FlxTween)
						{
							songSpeedTween = null;
						}
					});
			}
    }
                
}