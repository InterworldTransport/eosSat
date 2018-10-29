// LSL script generated: Mon Feb  1 21:55:08 PST 2016
integer channel;
list gInventoryList;
list getInventoryList(){
    list result = [];
    integer n = llGetInventoryNumber(INVENTORY_ALL);
    while (n) (result = (llGetInventoryName(INVENTORY_ALL,--n) + result));
    return result;
}
default {
    state_entry() {
        (gInventoryList = getInventoryList());
    }
    listen(integer chan,string name,key id,string mes) {
        if ((mes == "What is this?")) {
            llWhisper(0,"Give the What's This card");
            llGiveInventory(llDetectedKey(0),"WhatIsThis");
        }
        else  if ((mes == "How to help?")) {
            llWhisper(0,"Give the Help card");
            llGiveInventory(llDetectedKey(0),"HowToHelp");
        }
        else  llWhisper(0,"Not sure what to do right now.");
    }
    touch_start(integer total_number) {
        (channel = ((integer)(llFrand((-1.0e9)) - 1.0e9)));
        llListen(channel,"","","");
        llDialog(llDetectedKey(0),"What would you like to know about for this site?",["What is this?","How to help?"],channel);
        llListenRemove(channel);
    }
}
