// LSL script generated: Mon Feb  1 21:55:05 PST 2016
integer LENMAX = 8;
integer WIDMAX = 8;
integer COMChannel = 137138;
default {
    state_entry() {
    }
    touch_start(integer total_number) {
        vector touch_st = llDetectedTouchST(0);
        float numbery = (touch_st.y * LENMAX);
        float numberx = (touch_st.x * WIDMAX);
        integer number = (llCeil(numbery) + (llCeil((numberx - 1)) * 8));
        integer channel = (-1);
        string command;
        string subcommand;
        float pangle = 0.0;
        if ((number == 1)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 2)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 3)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 4) && (number <= 8))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 9)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 10)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 11)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 12) && (number <= 16))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit P1");
            (subcommand = "roll");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 17)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 18)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 19)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 20) && (number <= 24))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 25)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 26)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 27)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 28) && (number <= 32))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BP");
            (subcommand = "roll");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 33)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 34)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 35)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 36) && (number <= 40))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 41)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 42)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 43)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 44) && (number <= 48))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit BS");
            (subcommand = "roll");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 49)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 50)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 51)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 52) && (number <= 56))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 57)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 58)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "beam on");
            (pangle = 0.0);
        }
        else  if ((number == 59)) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "beam off");
            (pangle = 0.0);
        }
        else  if (((number >= 60) && (number <= 64))) {
            (channel = COMChannel);
            (command = "HA Antenna Unit S1");
            (subcommand = "roll");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  {
            (channel = 0);
            (command = "Unknown System");
            (subcommand = "with no callable function:");
            (pangle = 0.0);
        }
        llRegionSay(channel,((((command + " ") + subcommand) + " ") + ((string)pangle)));
    }
}
