// LSL script generated: Mon Feb  1 21:55:08 PST 2016
integer rate = 3;
default {
    state_entry() {
        llSetTimerEvent(rate);
    }
    timer() {
        llSetPrimitiveParams([PRIM_FULLBRIGHT,ALL_SIDES,TRUE]);
        llSetPrimitiveParams([PRIM_FULLBRIGHT,ALL_SIDES,FALSE]);
    }
}
