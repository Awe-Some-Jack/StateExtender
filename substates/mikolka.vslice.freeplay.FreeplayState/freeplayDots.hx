//package states.mikolka.vslice.ui.MainMenuState;
import mikolka.vslice.freeplay.FreeplayDJ;
var created:Bool = false;
var dots:Array = [];
final DEFAULT_DOTS_GROUP_POS:Array<Int> = [260, 175];
final groupOffset:Float = 14.7*2;
final maxDotsPerRow:Int = 8;
var lastcursong ;
var lastcurdiff ;
var timerCon;var black ;

function onUpdatePost(e) {
    //if (subState==null){destroy();return;}
    //if (Type.getClassName(Type.getClass(subState))!="mikolka.vslice.freeplay.FreeplayState")return;
    if (diffIdsTotal.length != dots.length){
        destroy();
        var maxDotsPerRowC = Math.floor(diffIdsTotal.length/(Math.floor(diffIdsTotal.length/maxDotsPerRow)+1));
        trace(maxDotsPerRowC);
        for (d in diffIdsTotal){
            var dot = new FlxSprite();
            dot.loadGraphic(Paths.image('freeplay/seperator'));
            dot.x = DEFAULT_DOTS_GROUP_POS[0] + groupOffset * (dots.length%maxDotsPerRowC);
            dot.x -= groupOffset * (Math.min(diffIdsTotal.length,maxDotsPerRowC)); 
            dot.y = DEFAULT_DOTS_GROUP_POS[1] + groupOffset * Math.floor(dots.length/maxDotsPerRowC);
            dot.camera = funnyCam;
            dot.scrollFactor.set(3,1);
            //trace(dot.x+" "+dot.y);
            super.add(dot);
            dots.push(dot);
        }
        //trace();
        created = true;
    }
    if (lastcursong != curSelected||lastcurdiff !=currentDifficulty){
        lastcursong = curSelected;
        var chee = lastcursong!=0?(d)->{return super.curCapsule.songData.songDifficulties.contains(d);}:(_)->{return true;};
        for (d in diffIdsTotal){
            dots[diffIdsTotal.indexOf(d)].alpha = chee(d)?1:0.4;
            dots[diffIdsTotal.indexOf(d)].color = currentDifficulty==d?0xFFFFFFFF:0xFF666666;
        }
        
    }
    if (dj!=null){
        //trace(dj.currentState);
        if (dj.currentState == "Confirm"&&timerCon==null){
            timerCon = styleData?.getStartDelay() ?? 0.2;
            black = new FlxSprite(0,0);
            black.makeGraphic(FlxG.width,FlxG.height,0xFF000000);
            black.alpha = 0;
            black.camera = FlxG.cameras.list[FlxG.cameras.list.length-1];
            //black.cameras = [rankCamera];
            FlxG.state.subState.add(black);
            FlxTween.tween(black,{'alpha': 1},timerCon/4,{startDelay: timerCon*3/4});
            trace("alarm "+timerCon);
        }
    }
}
function destroy() {
    if(!created)return;
    //trace("destroy");
    created = false;
    for (d in dots){
        d.destroy();
    }
    dots = [];
    black?.destroy();
}
function onDestroy() {
    destroy();
}