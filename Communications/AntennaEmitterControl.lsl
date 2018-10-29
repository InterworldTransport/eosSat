// LSL script generated: Mon Feb  1 21:55:05 PST 2016
vector startAttitude = <0.0,PI_BY_TWO,0.0>;
string LastMessage;
float streamSpeed = 1.0;
att_pitch(vector pstart,vector ppitch){
    llSetLocalRot(llEuler2Rot((pstart + ppitch)));
}
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        llParticleSystem([]);
        llSetLocalRot(llEuler2Rot(startAttitude));
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message,"pitch") >= 0)) {
            att_pitch(startAttitude,<0.0,((((float)str_right(message,"pitch")) * PI) / 180.0),0.0>);
        }
        else  if ((message == "reset")) {
            att_pitch(startAttitude,<0.0,0.0,0.0>);
        }
        else  if ((llSubStringIndex(message,"beam on") > 0)) {
            llParticleSystem([PSYS_SRC_TEXTURE,llGetInventoryName(INVENTORY_TEXTURE,0),PSYS_PART_START_SCALE,<4.4999998062849045e-2,4.4999998062849045e-2,0.0>,PSYS_PART_END_SCALE,<0.8999999761581421,0.8999999761581421,0.0>,PSYS_PART_START_COLOR,<1.0,0.25,0.25>,PSYS_PART_END_COLOR,<1.0,0.25,0.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.25,PSYS_PART_MAX_AGE,4.0,PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,15,PSYS_SRC_BURST_RATE,0.10000000149011612,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,0.0,PSYS_SRC_ANGLE_END,0.0,PSYS_SRC_BURST_SPEED_MIN,10.0,PSYS_SRC_BURST_SPEED_MAX,12.0]);
        }
        else  if ((llSubStringIndex(message,"beam off") > 0)) {
            llParticleSystem([]);
        }
        else  if ((llSubStringIndex(message,"speed") > 0)) {
            (streamSpeed = ((float)str_right(message," speed")));
            integer countblip = ((integer)llCeil((25.0 * streamSpeed)));
            llParticleSystem([PSYS_SRC_TEXTURE,llGetInventoryName(INVENTORY_TEXTURE,0),PSYS_PART_START_SCALE,<4.4999998062849045e-2,4.4999998062849045e-2,0.0>,PSYS_PART_END_SCALE,<0.8999999761581421,0.8999999761581421,0.0>,PSYS_PART_START_COLOR,<1.0,0.25,0.25>,PSYS_PART_END_COLOR,<1.0,0.25,0.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.25,PSYS_PART_MAX_AGE,4.0,PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,countblip,PSYS_SRC_BURST_RATE,9.999999776482582e-3,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,0.0,PSYS_SRC_ANGLE_END,0.0,PSYS_SRC_BURST_SPEED_MIN,(5.0 * streamSpeed),PSYS_SRC_BURST_SPEED_MAX,(6.0 * streamSpeed)]);
        }
        (LastMessage = message);
    }
}
