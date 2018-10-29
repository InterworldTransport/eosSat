// LSL script generated: Mon Feb  1 21:55:08 PST 2016
integer LENMAX = 7;
integer WIDMAX = 5;
integer LAPCmdChannel = 138137;
integer COMCmdChannel = 138138;
integer HAPCmdChannel = 138139;
integer PRSCmdChannel = 138140;
integer channel = 0;
string UnitIdentity;
string command = "HA Propulsion Unit S1";
string commtext = "eosSatMasterControl_Comm_clr";
string presstext = "eosSatMasterControl_Press";
string proptext = "eosSatMasterControl_Prop";
Say(string name,integer pnumb,string pcomm){
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0,((("/me is saying " + pcomm) + " on channel ") + ((string)pnumb)));
    llSetObjectName(objectName);
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
    }
    touch_start(integer total_number) {
        integer controlFace = llDetectedTouchFace(total_number);
        vector touch_st = llDetectedTouchST(0);
        float numbery = (touch_st.y * LENMAX);
        float numberx = (touch_st.x * WIDMAX);
        integer number = (llCeil(numbery) + (llCeil((numberx - 1)) * LENMAX));
        (channel = 0);
        if ((number == 2)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit P3");
        }
        else  if ((number == 4)) {
            llSetTexture(commtext,controlFace);
            (channel = COMCmdChannel);
            (command = "HA Antenna Unit P1");
        }
        else  if ((number == 5)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle W");
        }
        else  if ((number == 6)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit P2");
        }
        else  if ((number == 7)) {
            llSetTexture(commtext,controlFace);
            (channel = COMCmdChannel);
            (command = "HA Antenna Unit BP");
        }
        else  if ((number == 8)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Wing Duct Bundle P2");
        }
        else  if ((number == 9)) {
            llSetTexture(proptext,controlFace);
            (channel = LAPCmdChannel);
            (command = "HA LAP Unit L1");
        }
        else  if ((number == 10)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Wing Duct Bundle P1");
        }
        else  if ((number == 11)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle SW");
        }
        else  if ((number == 13)) {
            llSetTexture(presstext,controlFace);
            llSetTexture(commtext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle NW");
        }
        else  if ((number == 14)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit P1");
        }
        else  if ((number == 17)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle SS");
        }
        else  if ((number == 21)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle NN");
        }
        else  if ((number == 22)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Wing Duct Bundle S2");
        }
        else  if ((number == 23)) {
            llSetTexture(proptext,controlFace);
            (channel = LAPCmdChannel);
            (command = "HA LAP Unit L2");
        }
        else  if ((number == 24)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Wing Duct Bundle S1");
        }
        else  if ((number == 25)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle SE");
        }
        else  if ((number == 27)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle NE");
        }
        else  if ((number == 28)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit S1");
        }
        else  if ((number == 30)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit S3");
        }
        else  if ((number == 32)) {
            llSetTexture(commtext,controlFace);
            (channel = COMCmdChannel);
            (command = "HA Antenna Unit S1");
        }
        else  if ((number == 33)) {
            llSetTexture(presstext,controlFace);
            (channel = PRSCmdChannel);
            (command = "HA Ring Duct Bundle E");
        }
        else  if ((number == 34)) {
            llSetTexture(proptext,controlFace);
            (channel = HAPCmdChannel);
            (command = "HA Propulsion Unit S2");
        }
        else  if ((number == 35)) {
            llSetTexture(commtext,controlFace);
            (channel = COMCmdChannel);
            (command = "HA Antenna Unit BS");
        }
        else  {
            llSetTexture(commtext,controlFace);
            (channel = 0);
            (command = "NULL");
        }
        Say(llDetectedName(0),channel,command);
        if ((channel != 0)) {
            llRegionSay(channel,command);
        }
    }
}
