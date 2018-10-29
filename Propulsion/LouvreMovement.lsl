// LSL script generated: Mon Feb  1 21:55:31 PST 2016
rotation rot_xyzq;
vector start_vector = <0.0,0.0,0.0>;
rotation start_rot;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (start_rot = llEuler2Rot(start_vector));
        llSetLocalRot(start_rot);
        (rot_xyzq = llEuler2Rot((<0,1.0,0> * DEG_TO_RAD)));
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message,"pitch") >= 0)) {
            (rot_xyzq = llEuler2Rot((<0.0,((float)str_right(message,"pitch")),0.0> * DEG_TO_RAD)));
            llSetLocalRot((start_rot * rot_xyzq));
        }
        else  if ((llSubStringIndex(message,"reset") >= 0)) {
            llSetLocalRot(start_rot);
        }
    }
}
