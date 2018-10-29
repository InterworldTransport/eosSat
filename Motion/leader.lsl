// LSL script generated: Mon Feb  1 21:55:24 PST 2016
integer channel = 137135;
string UnitIdentity;
key parentObject;
vector parentCoM;
vector parentAttitude;
rotation parentQuat;
vector homePos = <35.0,146.63999938964844,23.44499969482422>;
vector homeAttitude = <0.0,0.0,0.0>;
vector diffPos;
integer debug = 0;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        (homeAttitude = <0.0,0.0,0.0>);
        llListen(channel,"",UnitIdentity,"");
        llSetLocalRot(llEuler2Rot(homeAttitude));
        llRegionSay((-137136),("setparent " + ((string)llGetKey())));
    }
    touch_start(integer num_detected) {
        llRegionSay((-137136),("setparent " + ((string)llGetKey())));
    }
    listen(integer channel,string name,key id,string message) {
        if ((llSubStringIndex(message,"stop") == 0)) {
        }
        else  if ((llSubStringIndex(message,"start") == 0)) {
        }
        else  if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,UnitIdentity));
            if ((debug == 1)) {
                llOwnerSay((" says exterior message recieved: " + message));
            }
            if ((llSubStringIndex(message,"setparent") >= 0)) {
                (parentObject = ((key)str_right(message,"setparent ")));
                list a = llGetObjectDetails(parentObject,[OBJECT_POS,OBJECT_ROT]);
                (parentCoM = llList2Vector(a,0));
                (parentQuat = llList2Rot(a,1));
                (parentAttitude = llRot2Euler(parentQuat));
                llOwnerSay(("Parent: " + ((string)parentObject)));
            }
            else  if ((llSubStringIndex(message,"massshift") >= 0)) {
                (diffPos = (((vector)str_right(message,"massshift ")) - parentCoM));
                llMessageLinked(LINK_THIS,0,("translate " + ((string)diffPos)),"");
                (parentCoM = (parentCoM + diffPos));
            }
            else  if ((llSubStringIndex(message,"massturn") >= 0)) {
            }
            else  if ((llSubStringIndex(message,"raise") >= 0)) {
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
}
