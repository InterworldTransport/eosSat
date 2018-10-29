// LSL script generated: Mon Feb  1 21:55:24 PST 2016
integer channel = 137136;
string UnitIdentity;
list parent = [];
vector homePos;
vector homeAttitude;
rotation homeQuat;
vector diffPos;
integer debug = 0;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
string mov_str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
list mov_checkParent(string message){
    if ((llSubStringIndex(message,"setparent") == 0)) {
        key parentObject = ((key)mov_str_right(message,"setparent "));
        return ([parentObject] + llGetObjectDetails(parentObject,[OBJECT_POS,OBJECT_ROT]));
    }
    else  {
        return [];
    }
}
default {
    state_entry() {
        (UnitIdentity = llGetObjectName());
        (homeAttitude = llRot2Euler(llGetRot()));
        (homeQuat = llGetRot());
        (homePos = llGetPos());
        llListen(channel,"",UnitIdentity,"");
    }
    touch_start(integer number) {
        llOwnerSay((" says my parent is " + llList2String(parent,0)));
    }
    listen(integer channel,string name,key id,string message) {
        if ((llSubStringIndex(message,UnitIdentity) == 0)) {
            (message = str_right(message,(UnitIdentity + " ")));
            if ((debug == 1)) {
                llOwnerSay((" says exterior message recieved: " + message));
            }
            list parentCheck = mov_checkParent(message);
            if (((parentCheck != []) != 0)) {
                (parent = (parentCheck + [llRot2Euler(llList2Rot(parentCheck,2))]));
            }
            if ((llSubStringIndex(message,"massshift") == 0)) {
                (diffPos = (((vector)str_right(message,"massshift ")) - llList2Vector(parent,1)));
                llMessageLinked(LINK_THIS,0,("translate " + ((string)diffPos)),"");
                (parent = llListReplaceList(((parent = []) + parent),[diffPos],1,1));
            }
            else  if ((llSubStringIndex(message,"massturn") == 0)) {
            }
            else  if ((llSubStringIndex(message,"raise") == 0)) {
                (diffPos = <0.0,0.0,((float)str_right(message,"raise "))>);
                llMessageLinked(LINK_THIS,0,("translate " + ((string)diffPos)),"");
            }
            else  if ((llSubStringIndex(message,"translate") == 0)) {
                llMessageLinked(LINK_THIS,0,message,"");
            }
            else  if ((llSubStringIndex(message,"yaw") == 0)) {
                vector diffEuler = <0.0,0.0,((((float)str_right(message,"yaw ")) * PI) / 180.0)>;
                llMessageLinked(LINK_SET,0,("euler " + ((string)diffEuler)),"");
            }
            else  if ((llSubStringIndex(message,"pitch") >= 0)) {
                vector diffEuler = <((((float)str_right(message,"yaw ")) * PI) / 180.0),0.0,0.0>;
                llMessageLinked(LINK_SET,0,("euler " + ((string)diffEuler)),"");
            }
            else  if (((llSubStringIndex(message,"euler") == 0) || (llSubStringIndex(message,"rotate") == 0))) {
                llMessageLinked(LINK_SET,0,message,"");
            }
            else  if ((llSubStringIndex(message,"reset") == 0)) {
                llMessageLinked(LINK_THIS,0,("resetrot " + ((string)homeAttitude)),"");
                llMessageLinked(LINK_THIS,0,("resetpos " + ((string)homePos)),"");
                llMessageLinked(LINK_SET,0,"reset","");
            }
        }
    }
}
