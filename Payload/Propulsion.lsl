// LSL script generated: Mon Feb  1 21:55:34 PST 2016
vector accel = <0.0,0.0,11.0>;
vector angaccel = <0.0,0.0,9.999999776482582e-3>;
float gap = 5.0;
float clock = 0.0;
fly(vector paccel,vector ptorq){
    float mass = llGetMass();
    llSetForceAndTorque((paccel * mass),(((ptorq * 0.5) * mass) * llPow(llVecMag(llGetScale()),2)),TRUE);
}
default {
    state_entry() {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,FALSE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),FALSE);
        llSetForceAndTorque(ZERO_VECTOR,ZERO_VECTOR,TRUE);
        llSetTimerEvent(0);
        llMessageLinked(LINK_ALL_OTHERS,0,"coolit",NULL_KEY);
    }
    touch_start(integer c) {
        if ((llDetectedKey(0) == llGetOwner())) {
            llMessageLinked(LINK_ALL_OTHERS,0,"ignition",NULL_KEY);
            fly(accel,angaccel);
            state thrust;
        }
    }
    on_rez(integer foo) {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,FALSE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),FALSE);
        llSetForceAndTorque(ZERO_VECTOR,ZERO_VECTOR,TRUE);
        llSetPos((llGetPos() + <0.0,0.0,0.10000000149011612>));
    }
}
state thrust {
    state_entry() {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,TRUE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),TRUE);
        llSetTimerEvent(gap);
    }
    timer() {
        (clock = (clock + gap));
        llWhisper(0,(("T+" + ((string)clock)) + " seconds"));
        if ((clock >= 60.0)) state coast;
    }
    on_rez(integer foo) {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,FALSE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),FALSE);
        llSetForceAndTorque(ZERO_VECTOR,ZERO_VECTOR,TRUE);
        state default;
    }
}
state coast {
    state_entry() {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,TRUE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),TRUE);
        llWhisper(0,"Engine Off");
        llMessageLinked(LINK_ALL_OTHERS,0,"coolit",NULL_KEY);
    }
    timer() {
        (clock = (clock + gap));
        llWhisper(0,(("TC+" + ((string)clock)) + " seconds"));
        vector vel = llGetVel();
        vector daccel = (((-0.125) * llVecNorm(vel)) * llPow(llVecMag(vel),2));
        vector dtorq = (angaccel * (-1.0));
        fly(ZERO_VECTOR,ZERO_VECTOR);
    }
    touch_start(integer c) {
        if ((llDetectedKey(0) == llGetOwner())) state default;
    }
    on_rez(integer foo) {
        llSetPrimitiveParams([PRIM_TEMP_ON_REZ,FALSE]);
        llSetStatus((STATUS_PHYSICS | STATUS_DIE_AT_EDGE),FALSE);
        llSetForceAndTorque(ZERO_VECTOR,ZERO_VECTOR,TRUE);
        state default;
    }
}
