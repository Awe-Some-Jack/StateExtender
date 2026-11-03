
var boyfriendGroup ;
var dadGroup;
function onCreateTrue() {
    //addOutText("hii",false,true);
    //boyfriend = getVarH("previewCharaters").members[0];
    //dad = getVarH("previewCharaters").members[1];
	boyfriendGroup = getVarH("TBoxs")[0];
	dadGroup = getVarH("TBoxs")[1];
}
//var tempanim = "";
//var curchar = 0;
function onDance(data) {
	if (data.noteType==null)return;
    if (data.noteType.indexOf("weekend-1-")==0){
        //tempanim = data.noteType.split("weekend-1-")[1];
		tempanim = "";
		try{
			noteHit(data);
		}catch(e:Dynamic){addOutText(e,true,false);}

		//else
		//if (tempanim!="")
		//	data.character.specialAnim = false;
        //data.canDance=tempanim=="";
        //data.canDance=false;
        //addOutText("hii " +tempanim,false,true);
        //data.animName = tempanim;
        
        //data.character = getVarH("previewCharaters").members[curchar];
    }
}
//from states/stages/objects/PicoBlazinHandler.hx
var cantUppercut = false;
var dad = {"playAnim":function(A,?B,?C){CharterHelper.leDance(getVarH("previewCharaters").members[1],A);tempanim = A;},"getAnimationName":()->{return getVarH("previewCharaters").members[1].getAnimationName();}};
var boyfriend = {"playAnim":(A,B)->{CharterHelper.leDance(getVarH("previewCharaters").members[0],A);tempanim = A;},"getAnimationName":()->{return getVarH("previewCharaters").members[0].getAnimationName();}};
	function noteHit(note:Note)
	{
		// SPECIAL CASE: If Pico hits a poor note at low health (at 30% chance),
		// Darnell may duck below Pico's punch to attempt an uppercut.
		// TODO: Maybe add a cooldown to this?
		//if (wasNoteHitPoorly(note.rating) && isPlayerLowHealth() && FlxG.random.bool(30))
		//{
		//	playUppercutPrepAnim();
		//	return;
		//}
//
		//if (cantUppercut)
		//{
		//	playPunchHighAnim();
		//	return;
		//}

		// Override the hit note animation.
		switch (note.noteType)
		{
			case "weekend-1-punchlow":
				playHitLowAnim();
			case "weekend-1-punchlowblocked":
				playBlockAnim();
			case "weekend-1-punchlowdodged":
				playDodgeAnim();
			case "weekend-1-punchlowspin":
				playSpinAnim();

			case "weekend-1-punchhigh":
				playHitHighAnim();
			case "weekend-1-punchhighblocked":
				playBlockAnim();
			case "weekend-1-punchhighdodged":
				playDodgeAnim();
			case "weekend-1-punchhighspin":
				playSpinAnim();

			// Attempt to punch, Pico dodges or gets hit.
			case "weekend-1-blockhigh":
				playPunchHighAnim();
			case "weekend-1-blocklow":
				playPunchLowAnim();
			case "weekend-1-blockspin":
				playPunchHighAnim();

			// Attempt to punch, Pico dodges or gets hit.
			case "weekend-1-dodgehigh":
				playPunchHighAnim();
			case "weekend-1-dodgelow":
				playPunchLowAnim();
			case "weekend-1-dodgespin":
				playPunchHighAnim();

			// Attempt to punch, Pico ALWAYS gets hit.
			case "weekend-1-hithigh":
				playPunchHighAnim();
			case "weekend-1-hitlow":
				playPunchLowAnim();
			case "weekend-1-hitspin":
				playPunchHighAnim();

			// Fail to dodge the uppercut.
			case "weekend-1-picouppercutprep":
				// Continue whatever animation was playing before
				// playIdleAnim();
			case "weekend-1-picouppercut":
				playUppercutHitAnim();

			// Attempt to punch, Pico dodges or gets hit.
			case "weekend-1-darnelluppercutprep":
				playUppercutPrepAnim();
			case "weekend-1-darnelluppercut":
				playUppercutAnim();

			case "weekend-1-idle":
				playIdleAnim();
			case "weekend-1-fakeout":
				playCringeAnim();
			case "weekend-1-taunt":
				playPissedConditionalAnim();
			case "weekend-1-tauntforce":
				playPissedAnim();
			case "weekend-1-reversefakeout":
				playFakeoutAnim();
		}

		cantUppercut = false;
	}
	
	var alternate:Bool = false;
	function doAlternate():String
	{
		alternate = !alternate;
		return alternate ? '1' : '2';
	}

	function playBlockAnim()
	{
		dad.playAnim('block', true);
		//PlayState.instance.camGame.shake(0.002, 0.1);
		moveToBack();
	}

	function playCringeAnim()
	{
		dad.playAnim('cringe', true);
		moveToBack();
	}

	function playDodgeAnim()
	{
		dad.playAnim('dodge', true, false);
		moveToBack();
	}

	function playIdleAnim()
	{
		dad.playAnim('idle', false);
		moveToBack();
	}

	function playFakeoutAnim()
	{
		dad.playAnim('fakeout', true);
		moveToBack();
	}

	function playPissedConditionalAnim()
	{
		//if (dad.getAnimationName() == "cringe")
			playPissedAnim();
		//else
		//	playIdleAnim();
	}

	function playPissedAnim()
	{
		dad.playAnim('pissed', true);
		moveToBack();
	}

	function playUppercutPrepAnim()
	{
		dad.playAnim('uppercutPrep', true);
		moveToFront();
	}

	function playUppercutAnim()
	{
		dad.playAnim('uppercut', true);
		moveToFront();
	}

	function playUppercutHitAnim()
	{
		dad.playAnim('uppercutHit', true);
		moveToBack();
	}

	function playHitHighAnim()
	{
		dad.playAnim('hitHigh', true);
		//PlayState.instance.camGame.shake(0.0025, 0.15);
		moveToBack();
	}

	function playHitLowAnim()
	{
		dad.playAnim('hitLow', true);
		//PlayState.instance.camGame.shake(0.0025, 0.15);
		moveToBack();
	}

	function playPunchHighAnim()
	{
		dad.playAnim('punchHigh' + doAlternate(), true);
		moveToFront();
	}

	function playPunchLowAnim()
	{
		dad.playAnim('punchLow' + doAlternate(), true);
		moveToFront();
	}

	function playSpinAnim()
	{
		dad.playAnim('hitSpin', true);
		//PlayState.instance.camGame.shake(0.0025, 0.15);
		moveToBack();
	}
	

	//function willMissBeLethal()
	//{
	//	return PlayState.instance.health <= 0.0 && !PlayState.instance.practiceMode;
	//}
	
	function isDarnellPreppingUppercut()
	{
		return dad.getAnimationName() == 'uppercutPrep';
	}

	function isDarnellInUppercut()
	{
		return dad.getAnimationName() == 'uppercut' || dad.getAnimationName() == 'uppercut-hold';
	}

	function wasNoteHitPoorly(rating:String)
	{
        return false;
		//return (rating == "bad" || rating == "shit");
	}

	function isPlayerLowHealth()
	{
        return false;
		//return PlayState.instance.health <= 0.3 * 2;
	}
	
	function moveToBack()
	{
		var bfPos:Int = members.indexOf(boyfriendGroup);
		var dadPos:Int = members.indexOf(dadGroup);
		if(bfPos < dadPos) return;
//
		members[dadPos] = boyfriendGroup;
		members[bfPos] = dadGroup;
	}

	function moveToFront()
	{
		var bfPos:Int = mainBox.getTab('Charting').menu.members.indexOf(boyfriendGroup);
		var dadPos:Int = mainBox.getTab('Charting').menu.members.indexOf(dadGroup);
		//addOutText("hii " +dadGroup,false,true);
		if(bfPos > dadPos) return;
//
		mainBox.getTab('Charting').menu.members[dadPos] = boyfriendGroup;
		mainBox.getTab('Charting').menu.members[bfPos] = dadGroup;
	}
	function onUpdate(e) {
		
	}