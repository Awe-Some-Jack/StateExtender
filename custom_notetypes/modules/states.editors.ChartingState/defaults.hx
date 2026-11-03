function onDance(CustomData) {
    var some = "";
    for (someName in ["-loop","-hold"]){
        if (CustomData.animName.indexOf(someName)>0)
            some = someName;
    }
    CustomData.animName = CustomData.animName.split(some).join("");
    CustomData.animName += (CustomData.noteType=="Alt Animation"||CustomData.curSec.altAnim)?"-alt":"";
    if (CustomData.noteType=="Hurt Note"){
        if (CustomData.indexChar==0){
            CustomData.canDance = false;
            CustomData.canHitSounds = false;
        }
    }
    if (CustomData.noteType=="No Animation") CustomData.canDance = false;//
    if (CustomData.noteType=="GF Sing") CustomData.character = getVarH("previewCharaters").members[2];//
    if (CustomData.noteType=="Hey!") CustomData.animName = 'hey';//
    CustomData.animName += some;
    
}