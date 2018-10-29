// LSL script generated: Mon Feb  1 21:55:31 PST 2016
integer channel = 137139;
string UnitIdentity;
vector startAttitude;
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
att_yaw(vector pstart,vector pyaw){
    llSetLocalRot(llEuler2Rot((pstart + pyaw)));
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        (startAttitude = llRot2Euler(llGetRot()));
        llListen(channel,"",llGetObjectName(),"");
        llParticleSystem([]);
        llSetLocalRot(llEuler2Rot(startAttitude));
        llMessageLinked(LINK_SET,0,"spin stop","");
        llMessageLinked(LINK_SET,0,"pitch 0.0","");
    }
    listen(integer channel,string name,key id,string message) {
        if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,UnitIdentity));
            if ((llSubStringIndex(message,"yaw") >= 0)) {
                att_yaw(startAttitude,<0.0,0.0,((((float)str_right(message,"yaw")) * PI) / 180.0)>);
            }
            else  if ((llSubStringIndex(message,"reset") >= 0)) {
                llMessageLinked(LINK_SET,0,"reset","");
                att_yaw(startAttitude,<0.0,0.0,0.0>);
            }
            else  {
                llMessageLinked(LINK_SET,0,message,"");
            }
        }
        if ((message == "talk")) {
            tlk_SayAttitude(message);
            llMessageLinked(LINK_SET,0,message,"");
        }
    }
}
