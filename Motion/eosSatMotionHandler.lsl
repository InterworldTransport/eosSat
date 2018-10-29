// LSL script generated: Mon Feb  1 21:55:24 PST 2016
vector targetPos;
rotation targetRot;
vector diffPos;
rotation diffRot;
float shiftSpeed = 9.999999776482582e-3;
integer debug = 0;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
mov_translate(vector target,vector diff,float speed,integer debug){
    do  {
        llSetPos((llGetPos() + (speed * llVecNorm(diff))));
        (diff = (target - llGetPos()));
    }
    while ((llVecMag(diff) > 9.999999776482582e-3));
    llSetPos(target);
    if ((debug = 1)) {
        llOwnerSay((" says on position target @: " + ((string)llGetPos())));
    }
}
mov_rotate(rotation target,rotation diff,float speed,integer debug){
    vector axis = llRot2Axis(diff);
    float angle = llRot2Angle(diff);
    do  {
        llSetRot((llAxisAngle2Rot(axis,(speed * angle)) * llGetRot()));
        (diff = (target / llGetRot()));
    }
    while ((llFabs(diff.s) < 0.9900000095367432));
    llSetRot(target);
    if ((debug = 1)) {
        llOwnerSay((" says on rotation target @: " + ((string)llGetRot())));
    }
}
default {
    state_entry() {
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message,"translate") >= 0)) {
            (diffPos = ((vector)str_right(message,"translate ")));
            (targetPos = (llGetPos() + diffPos));
            mov_translate(targetPos,diffPos,shiftSpeed,debug);
        }
        else  if ((llSubStringIndex(message,"euler") >= 0)) {
            (diffRot = llEuler2Rot(((vector)str_right(message,"euler "))));
            (targetRot = (diffRot * llGetRot()));
            mov_rotate(targetRot,diffRot,shiftSpeed,debug);
        }
        else  if ((llSubStringIndex(message,"rotate") >= 0)) {
            (diffRot = ((rotation)str_right(message,"rotate ")));
            (targetRot = (diffRot * llGetRot()));
            mov_rotate(targetRot,diffRot,shiftSpeed,debug);
        }
        else  if ((llSubStringIndex(message,"resetpos") >= 0)) {
            (diffPos = ((vector)str_right(message,"resetpos ")));
            (targetPos = (llGetPos() + diffPos));
            mov_translate(targetPos,diffPos,shiftSpeed,debug);
        }
        else  if ((llSubStringIndex(message,"resetrot") >= 0)) {
            vector homeAttitude = ((vector)str_right(message,"resetrot "));
            llSetLocalRot(llEuler2Rot(homeAttitude));
        }
    }
}
