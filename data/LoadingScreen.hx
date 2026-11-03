
import psychlua.HScript;
import crowplexus.iris.Iris;

import backend.Mods;
import backend.CacheSystem;
import backend.ui.PsychUIBox;
import backend.ui.PsychUIButton;
import backend.ui.PsychUICheckBox;
import backend.ui.PsychUINumericStepper;
import mikolka.funkin.custom.NativeFileSystem as NativeFileSystem;
import mikolka.stages.cutscenes.dialogueBox.DialogueBoxPsych; // import haxe.Json;
import states.editors.ChartingState;
var fakeLib = false;
try{
    if (NativeFileSystem==null){}
}catch(e:Dynamic){
    import sys.FileSystem as FileSystem;
    import cutscenes.DialogueBoxPsych;
    
    function getPathLike(path:String)
	{
		if (FileSystem.exists(path))
			return path;
		return null;
	}
    var fakeNativeFileSystem = {
        "exists":(p)->{return getPathLike(p)!=null;},
        "readDirectory":(p)->{
            if (getPathLike(p)!=null)
                return FileSystem.readDirectory(p);
            return [];
        }
    };
    this.set("NativeFileSystem",fakeNativeFileSystem);
    var fakeCacheSystem = {
        "loadSound":(p,b,t)->{
            p = p.split(".ogg")[0];
            var a = p.split("/");
            var k = [];
            k.push(a[0]);
            k.push(a[1]);
            var mp = [];
            for (i in 2...a.length){
                mp.push(a[i]);
            }
            //addOutText(mp);
            return Paths.returnSound(mp.join("/"));
        }
    };
    this.set("CacheSystem",fakeCacheSystem);
    fakeLib = true;
}

function onCreate() {
    //trace(this.config.name); 
    var scriptToLoad = this.config.name.split("/data/")[0]+"/scripts/stateHelper.hx";
    //var scriptToLoad = Paths.modFolders(this.config.name.split("/data/")[0]+"/scripts/charterHelper.hx");
    //trace("try "+module);
    
	if (NativeFileSystem.exists(scriptToLoad)) {
		if (Iris.instances.exists(scriptToLoad)) {
            trace("huh!");
            //return;
            Iris.instances.get(scriptToLoad).destroy();
            Iris.instances.remove(scriptToLoad);
        }
        try {
            DeltaRuneCode = new HScript(null, scriptToLoad);
            //DeltaRuneCode.set("animations",[ "singLEFT","singDOWN","singUP","singRIGHT"]);
            //DeltaRuneCode.set("game",{"singAnimations":[ "singLEFT","singDOWN","singUP","singRIGHT"]});
            //try {
			//	var ret:Dynamic = DeltaRuneCode.execute();
			//	//returnValue = ret;
			//} catch(e:IrisError) {
			//	//returnValue = null;
			//	DeltaRuneCode.destroy();
			//	throw e;
			//}
            //DeltaRuneCode.call("onUpdate",[1]);
            //DeltaRuneCode.call("onUpdate",[0]);
            DeltaRuneCode.call("onCreatePost");
            ////DeltaRuneCode.interp.showPosOnLog = true;
            //DeltaRuneCode.set("addOutText",addOutText);
            //DeltaRuneCode.set("CharterHelper",objThis);
            //DeltaRuneCode.set("setVarH",setLV);
            //DeltaRuneCode.set("getVarH",getLV);
            //
            //DeltaRuneCode.set("PsychUIBox",PsychUIBox);
            //DeltaRuneCode.set("PsychUIButton",PsychUIButton);
            //DeltaRuneCode.set("PsychUICheckBox",PsychUICheckBox);
            //DeltaRuneCode.set("PsychUINumericStepper",PsychUINumericStepper);
            ////DeltaRuneCode.set("Mods",Mods);
            //DeltaRuneCode.set("CacheSystem",CacheSystem);//with fake
            //DeltaRuneCode.set("NativeFileSystem",NativeFileSystem);//with fake
            //HXmodules.push(DeltaRuneCode);
            ////this.set("new_"+module,DeltaRuneCode.get("realNew"));
            ////trace("loaded "+module);
        } catch (e:Dynamic) {
            trace(e);
            var newScript:HScript = cast(Iris.instances.get(this.config.name.split("/data/")[0]+"/scripts/charterHelper.hx"), HScript);
            if (newScript != null)
                newScript.destroy();
            return;
        }
    }
}