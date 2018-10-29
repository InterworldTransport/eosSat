// LSL script generated: Mon Feb  1 21:55:10 PST 2016
integer channel;
integer PIN = 1341134;
linkSetCommand(){
    integer linkcount = llGetNumberOfPrims();
    llMessageLinked(1,1,"describe","");
    integer loop = 1;
    integer startparam = 0;
    while ((loop <= linkcount)) {
        if ((loop > 1)) {
            llRemoteLoadScriptPin(llGetLinkKey(loop),"PrimChildDescriber",PIN,TRUE,startparam);
        }
        llMessageLinked(loop,loop,"describe","");
        loop++;
    }
}
default {
    state_entry() {
        llOwnerSay((((llGetObjectName() + " : ") + ((string)llGetKey())) + " is ready to push a describer script to all linked prims using the agreed upon PIN."));
    }
    listen(integer chan,string name,key id,string mes) {
        if ((id == llGetOwnerKey(id))) if ((llSubStringIndex(mes,"Descriptions") >= 0)) {
            llSay(0,"Starting Description Work");
            linkSetCommand();
        }
    }
    touch_start(integer total_number) {
        (channel = ((integer)(llFrand((-1.0e9)) - 1.0e9)));
        llListen(channel,"","","");
        llDialog(llDetectedKey(0),"Please choose the function to run.",["Test Idea","Descriptions"],channel);
        llListenRemove(channel);
    }
}
