function onCheckEvent(ev) {
    if(ev[0]=="Hey!"){
        var intC = ["BF",null,"GF"].indexOf(ev[1].toUpperCase());
        var previewCharaters = getVarH("previewCharaters");
        var chars = [previewCharaters.members[intC]];
        if (intC==-1)
            chars = [previewCharaters.members[0],previewCharaters.members[2]];//времмено
        for (char in chars){
            CharterHelper.leDance(char,hasC(char));
            char.heyTimer=Std.parseFloat(ev[2])??0.6;
        }
    }
}
function hasC(char) {
    for (anim in ["hey","cheer"])
        if (char.hasAnimation(anim))
            return anim;
}