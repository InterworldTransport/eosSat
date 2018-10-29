// LSL script generated: Mon Feb  1 21:55:05 PST 2016
integer LENMAX = 8;
integer WIDMAX = 3;
integer COMChannel = 137138;
integer COMCmdChannel = 138138;
string command = "HA Antenna Unit S1";
string subcommand;
float pangle = 0.0;
Say(string name,integer pnumb,float pang,string pcomm,string psubcomm){
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0,((((((("/me is saying " + pcomm) + " ") + psubcomm) + " ") + ((string)pang)) + " on channel ") + ((string)pnumb)));
    llSetObjectName(objectName);
}
default {
    state_entry() {
        llListen(COMCmdChannel,"",llGetObjectName(),"");
    }
    listen(integer HAPCmdChannel,string name,key id,string message) {
        if ((llSubStringIndex(message," HA Antenna Unit") == 0)) {
            (command = message);
        }
        else  {
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
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((((number == 3) || (number == 11)) || (number == 19))) {
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 4) && (number <= 8))) {
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if (((number >= 12) && (number <= 16))) {
            (subcommand = "roll");
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
        Say(llDetectedName(0),COMChannel,pangle,command,subcommand);
        llRegionSay(COMChannel,((((command + " ") + subcommand) + " ") + ((string)pangle)));
    }
}
