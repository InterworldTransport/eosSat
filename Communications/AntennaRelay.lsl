// LSL script generated: Mon Feb  1 21:55:05 PST 2016
integer channel = 137138;
string UnitIdentity;
string LastMessage;
vector startAttitude = <0.0,PI_BY_TWO,0.0>;
att_roll(vector pstart,vector proll){
    llSetLocalRot(llEuler2Rot((pstart + proll)));
}
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
tlk_SayAttitude(string pmessage){
    llOwnerSay(((llGetObjectName() + " says the current global Qrotation is: ") + ((string)llGetRootRotation())));
    llOwnerSay(((llGetObjectName() + " says the current local Qrotation is: ") + ((string)llGetLocalRot())));
    llOwnerSay(((llGetObjectName() + " says the global Evector is: ") + ((string)llRot2Euler(llGetRootRotation()))));
    llOwnerSay(((llGetObjectName() + " says the local Evector is: ") + ((string)llRot2Euler(llGetLocalRot()))));
    llOwnerSay(("Last command to the unit was: " + pmessage));
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        llListen(channel,"",llGetObjectName(),"");
        llSetRot(llEuler2Rot(startAttitude));
        llMessageLinked(LINK_SET,0,"pitch 0.0","");
        llParticleSystem([]);
    }
    listen(integer channel,string name,key id,string message) {
        if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,UnitIdentity));
            if ((llSubStringIndex(message,"roll") >= 0)) {
                att_roll(startAttitude,<0.0,((((float)str_right(message,"roll")) * PI) / 180.0),0.0>);
            }
            else  if ((llSubStringIndex(message,"reset") >= 0)) {
                llMessageLinked(LINK_SET,0,"pitch 0.0","");
                att_roll(startAttitude,<0.0,0.0,0.0>);
            }
            llMessageLinked(LINK_SET,0,message,"");
        }
        if ((message == "talk")) {
            tlk_SayAttitude(message);
            llMessageLinked(LINK_SET,0,message,"");
        }
        (LastMessage = message);
    }
}
