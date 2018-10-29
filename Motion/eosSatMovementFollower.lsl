// LSL script generated: Mon Feb  1 21:55:24 PST 2016
integer exteriorChannel = 137136;
integer interiorChannel = -137136;
string UnitIdentity;
vector homePos = <35.0,55.0,30.899999618530273>;
vector homeAttitude = <0.0,0.0,0.0>;
key parentObject = "";
vector diffPos;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        (homePos = llGetPos());
        (homeAttitude = llRot2Euler(llGetRot()));
        llOwnerSay((((((" says Home Position: " + ((string)homePos)) + " and Home Attitude: ") + ((string)homeAttitude)) + " and following: ") + ((string)parentObject)));
        llListen(interiorChannel,"",UnitIdentity,"");
        llListen(exteriorChannel,"",UnitIdentity,"");
        llSetLocalRot(llEuler2Rot(homeAttitude));
    }
    listen(integer channel,string name,key id,string message) {
        if ((channel = exteriorChannel)) {
            if ((llSubStringIndex(message,"stop") == 0)) {
            }
            else  if ((llSubStringIndex(message,"start") == 0)) {
            }
            else  if ((llSubStringIndex(message,UnitIdentity) == 0)) {
                (message = str_right(message,UnitIdentity));
                llOwnerSay((" says exterior message recieved: " + message));
                if ((llSubStringIndex(message,"raise") >= 0)) {
                    (diffPos = <0.0,0.0,((float)str_right(message,"raise "))>);
                    llMessageLinked(LINK_THIS,0,("translate " + ((string)diffPos)),"");
                }
                else  if ((llSubStringIndex(message,"translate") >= 0)) {
                    llMessageLinked(LINK_THIS,0,message,"");
                }
                else  if ((llSubStringIndex(message,"euler") >= 0)) {
                    llMessageLinked(LINK_THIS,0,message,"");
                }
                else  if ((llSubStringIndex(message,"rotate") >= 0)) {
                    llMessageLinked(LINK_THIS,0,message,"");
                }
                else  if ((llSubStringIndex(message,"reset") >= 0)) {
                    llMessageLinked(LINK_THIS,0,("resetrot " + ((string)homeAttitude)),"");
                    llMessageLinked(LINK_THIS,0,("reset " + ((string)homePos)),"");
                }
                else  {
                }
            }
        }
        else  if ((channel = interiorChannel)) {
            llOwnerSay((" says interior message recieved: " + message));
        }
    }
}
