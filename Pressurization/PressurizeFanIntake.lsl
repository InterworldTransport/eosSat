// LSL script generated: Mon Feb  1 21:55:30 PST 2016
float streamStrength = 1.0;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        (streamStrength = 1.0);
        llParticleSystem([]);
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message," on") >= 0)) {
            state FanOn;
        }
        else  if ((llSubStringIndex(message," off") >= 0)) {
            state FanOff;
        }
        else  {
            llParticleSystem([]);
        }
    }
    on_rez(integer foo) {
        state FanOff;
    }
    touch_start(integer total_number) {
        llWhisper(0,("Fan #" + ((string)llGetLinkNumber())));
        llParticleSystem([PSYS_SRC_TEXTURE,llGetInventoryName(INVENTORY_TEXTURE,0),PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<0.0,0.0,1.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.0,PSYS_PART_MAX_AGE,(0.5 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,25,PSYS_SRC_BURST_RATE,9.999999776482582e-3,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,(PI / 16),PSYS_SRC_ANGLE_END,0.0,PSYS_SRC_ACCEL,<0.0,0.0,(-1.0)>,PSYS_SRC_BURST_SPEED_MIN,(2.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(3.0 * streamStrength)]);
    }
}
state FanOn {
    state_entry() {
        llParticleSystem([PSYS_SRC_TEXTURE,llGetInventoryName(INVENTORY_TEXTURE,0),PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<0.0,0.0,1.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.0,PSYS_PART_MAX_AGE,(0.5 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,25,PSYS_SRC_BURST_RATE,9.999999776482582e-3,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,(PI / 16),PSYS_SRC_ANGLE_END,0.0,PSYS_SRC_ACCEL,<0.0,0.0,(-1.0)>,PSYS_SRC_BURST_SPEED_MIN,(2.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(3.0 * streamStrength)]);
    }
    on_rez(integer foo) {
        state FanOff;
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message," off") >= 0)) {
            state FanOff;
        }
        else  if ((llSubStringIndex(message," on") >= 0)) {
            (streamStrength = ((float)str_right(message," on")));
            llParticleSystem([PSYS_SRC_TEXTURE,llGetInventoryName(INVENTORY_TEXTURE,0),PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<0.0,0.0,1.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.0,PSYS_PART_MAX_AGE,(0.5 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,25,PSYS_SRC_BURST_RATE,9.999999776482582e-3,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,(PI / 16),PSYS_SRC_ANGLE_END,0.0,PSYS_SRC_ACCEL,<0.0,0.0,(-1.0)>,PSYS_SRC_BURST_SPEED_MIN,(2.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(3.0 * streamStrength)]);
        }
        else  {
            llParticleSystem([]);
            state default;
        }
    }
}
state FanOff {
    state_entry() {
        (streamStrength = 1.0);
        llParticleSystem([]);
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message," on") >= 0)) {
            state FanOn;
        }
        else  {
            llParticleSystem([]);
            state default;
        }
    }
}
