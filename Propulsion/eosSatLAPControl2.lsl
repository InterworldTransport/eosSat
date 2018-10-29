// LSL script generated: Mon Feb  1 21:55:31 PST 2016
integer LENMAX = 8;
integer WIDMAX = 3;
integer LAPChannel = 137137;
integer LAPCmdChannel = 138137;
string UnitIdentity;
string command = "HA Propulsion Unit S1";
string subcommand;
float pangle = 0.0;
Say(string name,integer pnumb,float pang,string pcomm,string psubcomm){
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0,((((((("/me is saying " + pcomm) + " ") + psubcomm) + " ") + ((string)pang)) + " on channel ") + ((string)pnumb)));
    llSetObjectName(objectName);
}
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        llListen(LAPCmdChannel,"",llGetObjectName(),"");
    }
    listen(integer LAPCmdChannel,string name,key id,string message) {
        if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,UnitIdentity));
            if ((llSubStringIndex(message," HA LAP Unit") == 0)) {
                (command = message);
            }
            else  {
            }
        }
    }
    touch_start(integer total_number) {
        vector touch_st = llDetectedTouchST(0);
        float numbery = (touch_st.y * LENMAX);
        float numberx = (touch_st.x * WIDMAX);
        integer number = (llCeil(numbery) + (llCeil((numberx - 1)) * LENMAX));
        if ((((number == 1) || (number == 9)) || (number == 17))) {
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((((number == 2) || (number == 10)) || (number == 18))) {
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((((number == 3) || (number == 11)) || (number == 19))) {
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 4) && (number <= 8))) {
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if (((number >= 12) && (number <= 16))) {
            (subcommand = "yaw");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if (((number >= 20) && (number <= 24))) {
            (subcommand = "speed");
            (pangle = ((numbery - 3) / 2.5));
        }
        else  {
            (subcommand = "with no callable function:");
            (pangle = 0.0);
        }
        Say(llDetectedName(0),LAPChannel,pangle,command,subcommand);
        llRegionSay(LAPChannel,((((command + " ") + subcommand) + " ") + ((string)pangle)));
    }
}
