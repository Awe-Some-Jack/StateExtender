import Type;
import backend.Controls;
var Control = Controls.instance;
var lastTime = 0;
var bootPlay = false;
var addedP = false;
    var na = [];
    var subEditor;
function onUpdate(e) {
    //var subEditor = Type.getClassName(Type.getClass(subState))=="states.editors.content.EditorPlayState";
    //if (!subEditor)return;
    //if (addedP&&!subEditor){
    //    for (p in getVarH("TBoxs")){
    //        subState.remove(p);
    //    }
    //    addedP = false;
    //    addOutText("hi");
    //}
    
}
function onDraw() {
    if (!subEditor||mainBox.selectedName != "Charting")return;
        for (p in getVarH("TBoxs")){
            subState.insert(2,p);
        }
    
}
function onDrawPost() {
    if (!subEditor||mainBox.selectedName != "Charting")return;
        for (p in getVarH("TBoxs")){
            subState.remove(p);
        }
    
}
function onUpdatePost(e) {
    subEditor = Type.getClassName(Type.getClass(subState))=="states.editors.content.EditorPlayState";
    if (!subEditor){
        //addedP = false;
        return;
    }
    if (Control.justPressed('debug_1')) bootPlay = !bootPlay;
    var txt = subState.dataTxt.text.split("\n");
    txt.insert(1,"botplay: "+Std.string(bootPlay));
    subState.dataTxt.text = txt.join("\n");
    subState.dataTxt.y = 540;
    //if (!addedP){
    //    for (p in getVarH("TBoxs")){
    //        subState.insert(2,p);
    //    }
        //FlxG.mouse.visible = true;
        //addedP = true;
    //}
    if (!bootPlay) return;
    for (note in subState.notes)
        {
            if(note == null) continue;
            if(Conductor.songPosition > note.strumTime && lastTime <= note.strumTime){
                if (!note.isEvent&&note.mustPress){
                    //addOutText(note.songData[1]);
                    na.push(note);
                }
            }
        }
        while (na.length>0 ){
            //subState.keyPressed(note.noteData);
            subState.goodNoteHit(na.pop());
            }

    lastTime = Conductor.songPosition;
}