// LSL script generated: Mon Feb  1 21:55:10 PST 2016
integer PIN = 1341134;
default {
    state_entry() {
        llOwnerSay((((llGetObjectName() + " : ") + ((string)llGetKey())) + " is ready to accept a describer script using the agreed upon PIN."));
        llSetRemoteScriptAccessPin(PIN);
    }
}
