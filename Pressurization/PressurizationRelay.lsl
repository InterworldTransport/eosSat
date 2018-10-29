// LSL script generated: Mon Feb  1 21:55:30 PST 2016
integer channel = 137140;
string UnitIdentity;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        llListen(channel,"",llGetObjectName(),"");
        llParticleSystem([]);
        llMessageLinked(LINK_ALL_CHILDREN,0,"reset","");
    }
    listen(integer channel,string name,key id,string message) {
        if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,UnitIdentity));
            if ((llSubStringIndex(message,"sound") >= 0)) {
                llPlaySound(llGetInventoryName(INVENTORY_SOUND,0),1.0);
            }
            else  if ((llSubStringIndex(message,"interior intake") >= 0)) {
                (message = str_right(message,"interior intake"));
                llMessageLinked(66,0,message,"");
            }
            else  if ((llSubStringIndex(message,"interior outtake") >= 0)) {
                (message = str_right(message,"interior outtake"));
                llMessageLinked(59,0,message,"");
            }
            else  if ((llSubStringIndex(message,"exterior intake") >= 0)) {
                (message = str_right(message,"exterior intake"));
                llMessageLinked(61,0,message,"");
            }
            else  if ((llSubStringIndex(message,"exterior outtake") >= 0)) {
                (message = str_right(message,"exterior outtake"));
                llMessageLinked(55,0,message,"");
            }
            else  if ((llSubStringIndex(message,"column intake") >= 0)) {
                (message = str_right(message,"column intake"));
                llMessageLinked(2,0,message,"");
            }
            else  if ((llSubStringIndex(message,"column outtake") >= 0)) {
                (message = str_right(message,"column outtake"));
                llMessageLinked(5,0,message,"");
            }
            else  if ((llSubStringIndex(message,"subdorsal intake") >= 0)) {
                (message = str_right(message,"subdorsal intake"));
                llMessageLinked(43,0,message,"");
            }
            else  if ((llSubStringIndex(message,"subdorsal outtake") >= 0)) {
                (message = str_right(message,"subdorsal outtake"));
                llMessageLinked(41,0,message,"");
            }
            else  if ((llSubStringIndex(message,"dorsal intake") >= 0)) {
                (message = str_right(message,"dorsal intake"));
                llMessageLinked(4,0,message,"");
            }
            else  if ((llSubStringIndex(message,"dorsal outtake") >= 0)) {
                (message = str_right(message,"dorsal outtake"));
                llMessageLinked(3,0,message,"");
            }
            else  if ((llSubStringIndex(message,"reset") >= 0)) {
                llMessageLinked(LINK_ALL_CHILDREN,0,"reset","");
            }
        }
    }
}
