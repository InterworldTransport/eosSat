// LSL script generated: Mon Feb  1 21:55:34 PST 2016
float thrust = 1.2000000476837158;
launch(){
    llMessageLinked(LINK_ALL_OTHERS,0,"flameon",NULL_KEY);
    llSetForce((<0.0,0.0,(9.800000190734863 + thrust)> * llGetMass()),TRUE);
    llSetStatus(STATUS_PHYSICS,TRUE);
}
default {
    state_entry() {
        llMessageLinked(LINK_ALL_OTHERS,0,"off",NULL_KEY);
    }
    touch_start(integer c) {
        if ((llDetectedKey(0) == llGetOwner())) {
            launch();
            state done;
        }
    }
    link_message(integer sender,integer recint,string recstr,key reckey) {
        if ((recstr == "triggerlaunch")) {
            launch();
            state done;
        }
    }
}
state done {
    state_entry() {
    }
    on_rez(integer foo) {
        llSetPrimitiveParams([PRIM_PHYSICS,FALSE,PRIM_TEMP_ON_REZ,FALSE]);
        llSetForce(<0.0,0.0,0.0>,TRUE);
        state default;
    }
}
