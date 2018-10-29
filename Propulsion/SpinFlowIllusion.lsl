// LSL script generated: Mon Feb  1 21:55:31 PST 2016
string opaque = "blur";
string transparent = "alpha";
string pdot = "JP Particle - Big Soft Dot";
float streamStrength = 1.0;
string str_right(string src,string divider){
    integer index = llSubStringIndex(src,divider);
    if ((~index)) return llDeleteSubString(src,0,((index + llStringLength(divider)) - 1));
    return src;
}
default {
    state_entry() {
        llSetTexture(transparent,ALL_SIDES);
        llParticleSystem([]);
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message," spin forward") >= 0)) {
            state FanOn;
        }
        else  if ((llSubStringIndex(message," spin stop") >= 0)) {
            (streamStrength = 1.0);
            llSetTexture(transparent,ALL_SIDES);
            llParticleSystem([]);
        }
        else  {
        }
    }
}
state FanOn {
    state_entry() {
        llSetTexture(opaque,ALL_SIDES);
        llParticleSystem([PSYS_SRC_TEXTURE,pdot,PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<1.0,1.0,0.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.10000000149011612,PSYS_PART_MAX_AGE,(4.0 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,15,PSYS_SRC_BURST_RATE,0.10000000149011612,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,0.0,PSYS_SRC_ANGLE_END,(PI / 12),PSYS_SRC_ACCEL,<0.0,(-1.0),0.0>,PSYS_SRC_BURST_SPEED_MIN,(10.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(20.0 * streamStrength)]);
    }
    on_rez(integer foo) {
        state default;
    }
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message," spin forward") >= 0)) {
            (streamStrength = 1.0);
            llSetTexture(opaque,ALL_SIDES);
            llParticleSystem([PSYS_SRC_TEXTURE,pdot,PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<1.0,1.0,0.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.10000000149011612,PSYS_PART_MAX_AGE,(4.0 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,15,PSYS_SRC_BURST_RATE,0.10000000149011612,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,0.0,PSYS_SRC_ANGLE_END,(PI / 12),PSYS_SRC_ACCEL,<0.0,(-1.0),0.0>,PSYS_SRC_BURST_SPEED_MIN,(10.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(12.0 * streamStrength)]);
        }
        else  if ((llSubStringIndex(message," speed") >= 0)) {
            (streamStrength = ((float)str_right(message," speed")));
            llSetTexture(opaque,ALL_SIDES);
            llParticleSystem([PSYS_SRC_TEXTURE,pdot,PSYS_PART_START_SCALE,<3.999999910593033e-2,3.999999910593033e-2,0.0>,PSYS_PART_END_SCALE,<1.0,1.0,0.0>,PSYS_PART_START_COLOR,<1.0,1.0,1.0>,PSYS_PART_END_COLOR,<1.0,1.0,0.0>,PSYS_PART_START_ALPHA,1.0,PSYS_PART_END_ALPHA,0.10000000149011612,PSYS_PART_MAX_AGE,(4.0 * streamStrength),PSYS_PART_FLAGS,((PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK) | PSYS_PART_INTERP_SCALE_MASK),PSYS_SRC_BURST_PART_COUNT,15,PSYS_SRC_BURST_RATE,0.10000000149011612,PSYS_SRC_PATTERN,PSYS_SRC_PATTERN_ANGLE_CONE,PSYS_SRC_ANGLE_BEGIN,0.0,PSYS_SRC_ANGLE_END,(PI / 12),PSYS_SRC_ACCEL,<0.0,(-1.0),0.0>,PSYS_SRC_BURST_SPEED_MIN,(10.0 * streamStrength),PSYS_SRC_BURST_SPEED_MAX,(12.0 * streamStrength)]);
        }
        else  if ((llSubStringIndex(message," pitch") >= 0)) {
        }
        else  {
            state default;
        }
    }
}
