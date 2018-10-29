// LSL script generated: Mon Feb  1 21:55:08 PST 2016
integer LENMAX = 8;
integer WIDMAX = 8;
integer LAPChannel = 137137;
integer COMChannel = 137138;
integer HAPChannel = 137139;
integer PRSChannel = 137140;
integer POWChannel = 137141;
integer GASChannel = 137142;
Say(string name,integer pnumb,float pang,string pcomm,string psubcomm){
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0,((((((("/me is saying " + pcomm) + "/") + psubcomm) + " : ") + ((string)pang)) + " on channel ") + ((string)pnumb)));
    llSetObjectName(objectName);
}
default {
    state_entry() {
    }
    touch_start(integer total_number) {
        vector touch_st = llDetectedTouchST(0);
        integer numberl = llCeil((touch_st.y * LENMAX));
        integer numberw = llCeil((touch_st.x * WIDMAX));
        integer number = (numberl + ((numberw - 1) * 8));
        integer channel = (-1);
        string command;
        string subcommand;
        float pangle = 0.0;
        if ((number == 1)) {
            (channel = LAPChannel);
            (command = "HA LAP Unit L1");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 2)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "Beam On");
            (pangle = 0.0);
        }
        else  if ((number == 3)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit P1");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 4)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle N");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 5)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 6)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 7)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 8)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 9)) {
            (channel = LAPChannel);
            (command = "HA LAP Unit L2");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 10)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "Beam On");
            (pangle = 0.0);
        }
        else  if ((number == 11)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit P2");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 12)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle NE");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 13)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 14)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 15)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 16)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 17)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 18)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "Beam On");
            (pangle = 0.0);
        }
        else  if ((number == 19)) {
            (channel = HAPChannel);
            (command = "UHA Propulsion Unit P3");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 20)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle E");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 21)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 22)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 23)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 24)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 25)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 26)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "Beam On");
            (pangle = 0.0);
        }
        else  if ((number == 27)) {
            (channel = HAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 28)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle SE");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 29)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 30)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 31)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 32)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 33)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 34)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "Beam Off");
            (pangle = 0.0);
        }
        else  if ((number == 35)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 36)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle S");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 37)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 38)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 39)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 40)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 41)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 42)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "Beam Off");
            (pangle = 0.0);
        }
        else  if ((number == 43)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 44)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle SW");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 45)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 46)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 47)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 48)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 49)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 50)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "Beam Off");
            (pangle = 0.0);
        }
        else  if ((number == 51)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 52)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle W");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 53)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 54)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 55)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 56)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 57)) {
            (channel = LAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 58)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "Beam Off");
            (pangle = 0.0);
        }
        else  if ((number == 59)) {
            (channel = HAPChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 60)) {
            (channel = PRSChannel);
            (command = "HA Ring Duct Bundle NW");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 61)) {
            (channel = POWChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 62)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 63)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  if ((number == 64)) {
            (channel = GASChannel);
            (command = "Unit Name");
            (subcommand = "Unit Function");
            (pangle = 0.0);
        }
        else  {
            (channel = 0);
            (command = "Unknown System");
            (subcommand = "with no callable function:");
            (pangle = 0.0);
        }
        Say(llDetectedName(0),channel,pangle,command,subcommand);
        llRegionSay(channel,((((command + " ") + subcommand) + " ") + ((string)pangle)));
    }
}
