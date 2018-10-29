// LSL script generated: Mon Feb  1 21:55:30 PST 2016
integer LENMAX = 8;
integer WIDMAX = 5;
integer PRSChannel = 137140;
integer PRSCmdChannel = 138140;
string command = "HA Ring Duct Bundle N";
string subcommand;
float pangle = 1.0;
default {
    state_entry() {
        llListen(PRSCmdChannel,"",llGetObjectName(),"");
    }
    listen(integer PRSCmdChannel,string name,key id,string message) {
        llWhisper(0,("Pressurization panel heard " + message));
        if ((llSubStringIndex(message,"HA Ring Duct Bundle") == 0)) {
            (command = message);
            llWhisper(0,"and acted on it as a ring duct bundle");
        }
        if ((llSubStringIndex(message,"HA Wing Duct Bundle") == 0)) {
            (command = message);
            llWhisper(0,"and acted on it as a wing duct bundle");
        }
        else  {
        }
    }
    touch_start(integer total_number) {
        vector touch_st = llDetectedTouchST(0);
        float numbery = (touch_st.y * LENMAX);
        float numberx = (touch_st.x * WIDMAX);
        integer number = (llCeil(numbery) + (llCeil((numberx - 1)) * LENMAX));
        if ((number == 1)) {
            (subcommand = "reset interior intake");
            (pangle = 1.0);
        }
        else  if ((number == 2)) {
            (subcommand = "interior intake on");
            (pangle = 1.0);
        }
        else  if ((number == 3)) {
            (subcommand = "interior intake off");
            (pangle = 1.0);
        }
        else  if ((number == 4)) {
            (subcommand = "reset interior outtake");
            (pangle = 1.0);
        }
        else  if ((number == 5)) {
            (subcommand = "interior outtake on");
            (pangle = 1.0);
        }
        else  if ((number == 6)) {
            (subcommand = "interior outtake off");
            (pangle = 1.0);
        }
        else  if (((number >= 7) && (number <= 8))) {
            (pangle = (touch_st.x * 2.0));
        }
        else  if ((number == 9)) {
            (subcommand = "reset exterior intake");
            (pangle = 1.0);
        }
        else  if ((number == 10)) {
            (subcommand = "exterior intake on");
            (pangle = 1.0);
        }
        else  if ((number == 11)) {
            (subcommand = "exterior intake off");
            (pangle = 1.0);
        }
        else  if ((number == 12)) {
            (subcommand = "reset exterior outtake");
            (pangle = 1.0);
        }
        else  if ((number == 13)) {
            (subcommand = "exterior outtake on");
            (pangle = 1.0);
        }
        else  if ((number == 14)) {
            (subcommand = "exterior outtake off");
            (pangle = 1.0);
        }
        else  if (((number >= 15) && (number <= 16))) {
            (pangle = (touch_st.x * 2.0));
        }
        else  if ((number == 17)) {
            (subcommand = "reset column intake");
            (pangle = 1.0);
        }
        else  if ((number == 18)) {
            (subcommand = "column intake on");
            (pangle = 1.0);
        }
        else  if ((number == 19)) {
            (subcommand = "column intake off");
            (pangle = 1.0);
        }
        else  if ((number == 20)) {
            (subcommand = "reset column outtake");
            (pangle = 1.0);
        }
        else  if ((number == 21)) {
            (subcommand = "column outtake on");
            (pangle = 1.0);
        }
        else  if ((number == 22)) {
            (subcommand = "column outtake off");
            (pangle = 1.0);
        }
        else  if (((number >= 23) && (number <= 24))) {
            (pangle = (touch_st.x * 2.0));
        }
        else  if ((number == 25)) {
            (subcommand = "reset subdorsal intake");
            (pangle = 1.0);
        }
        else  if ((number == 26)) {
            (subcommand = "subdorsal intake on");
            (pangle = 1.0);
        }
        else  if ((number == 27)) {
            (subcommand = "subdorsal outtake off");
            (pangle = 1.0);
        }
        else  if ((number == 28)) {
            (subcommand = "reset subdorsal outtake");
            (pangle = 1.0);
        }
        else  if ((number == 29)) {
            (subcommand = "subdorsal outtake on");
            (pangle = 1.0);
        }
        else  if ((number == 30)) {
            (subcommand = "subdorsal outtake off");
            (pangle = 1.0);
        }
        else  if (((number >= 31) && (number <= 32))) {
            (pangle = (touch_st.x * 2.0));
        }
        else  if ((number == 33)) {
            (subcommand = "reset dorsal intake");
            (pangle = 1.0);
        }
        else  if ((number == 34)) {
            (subcommand = "dorsal intake on");
            (pangle = 1.0);
        }
        else  if ((number == 35)) {
            (subcommand = "dorsal intake off");
            (pangle = 1.0);
        }
        else  if ((number == 36)) {
            (subcommand = "reset dorsal outtake");
            (pangle = 1.0);
        }
        else  if ((number == 37)) {
            (subcommand = "dorsal outtake on");
            (pangle = 1.0);
        }
        else  if ((number == 38)) {
            (subcommand = "dorsal outtake off");
            (pangle = 1.0);
        }
        else  if (((number >= 39) && (number <= 40))) {
            (pangle = (touch_st.x * 2.0));
        }
        else  {
            (command = "Unknown System ");
            (subcommand = "with no callable function:");
            (pangle = 1.0);
        }
        llRegionSay(PRSChannel,((((command + " ") + subcommand) + " ") + ((string)pangle)));
    }
}
