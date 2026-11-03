function onCheckEvent(ev) {
    if(ev[0]=="Alt Idle Animation"){
        var previewCharaters = getVarH("previewCharaters");
        var intC = ["BF","DAD","GF"].indexOf(ev[1].toUpperCase());
        if (intC==-1)
            intC = ["BOYFRIEND",null,"GIRLFRIEND"].indexOf(ev[1].toUpperCase());//i dont know 2
        if (intC==-1)
            //intC = [PlayState.SONG.player1,PlayState.SONG.player2,PlayState.SONG.gfVersion].indexOf(ev[2]);//времмено
            intC = [getN(0),getN(1),getN(2)].indexOf(ev[1]);//времмено
        previewCharaters.members[intC].idleSuffix = ev[2];
    }
}
function getN(i) {
    
    var realN = getVarH("previewCharaters").members[i].curCharacter.split("/");realN.reverse();
    return realN[0];
}