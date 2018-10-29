// LSL script generated: Mon Feb  1 21:55:05 PST 2016
vector startAttitude;
string LastMessage;
att_pitch(vector pstart,vector ppitch){
    llSetLocalRot(llEuler2Rot((pstart + ppitch)));
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
        (startAttitude = <PI_BY_TWO,0.0,((3 * PI) / 4)>);
        llSetLocalRot(llEuler2Rot(startAttitude));
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message,"pitch") >= 0)) {
            att_pitch(startAttitude,<0.0,((((float)str_right(message,"pitch")) * PI) / 180.0),0.0>);
        }
        else  if ((message == "reset")) {
            att_pitch(startAttitude,<0.0,0.0,0.0>);
        }
        else  if ((message == "talk")) {
            tlk_SayAttitude(message);
        }
        (LastMessage = message);
    }
}
