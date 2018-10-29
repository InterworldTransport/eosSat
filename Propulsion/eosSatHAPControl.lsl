// LSL script generated: Mon Feb  1 21:55:31 PST 2016
integer LENMAX = 8;
integer WIDMAX = 6;
integer HAPChannel = 137139;
default {
    state_entry() {
    }
    touch_start(integer total_number) {
        vector touch_st = llDetectedTouchST(0);
        float numbery = (touch_st.y * LENMAX);
        float numberx = (touch_st.x * WIDMAX);
        integer number = (llCeil(numbery) + (llCeil((numberx - 1)) * WIDMAX));
        integer channel = (-1);
        string command;
        string subcommand;
        float pangle = 0.0;
        if ((number == 1)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 2)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 3)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 4) && (number <= 8))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 9)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 10)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 11)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 12) && (number <= 16))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S1");
            (subcommand = "yaw");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 17)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 18)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 19)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 20) && (number <= 24))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 25)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 26)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 27)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 28) && (number <= 32))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S2");
            (subcommand = "yaw");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 33)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 34)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 35)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 36) && (number <= 40))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "pitch");
            (pangle = (180.0 * ((numbery - 5.5) / 2.5)));
        }
        else  if ((number == 41)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "reset");
            (pangle = 0.0);
        }
        else  if ((number == 42)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "spin forward");
            (pangle = 0.0);
        }
        else  if ((number == 43)) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "spin stop");
            (pangle = 0.0);
        }
        else  if (((number >= 44) && (number <= 48))) {
            (channel = HAPChannel);
            (command = "HA Propulsion Unit S3");
            (subcommand = "yaw");
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
