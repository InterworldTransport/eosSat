

default {
    state_entry() {
        llParticleSystem([]); 
    }
    
    link_message(integer sender, integer pint, string pstr, key pkey) {
      
        if (pstr == "coolit") llParticleSystem([]); 
        
        else if (pstr == "ignition") llParticleSystem([
            PSYS_PART_FLAGS,
                PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK |
                PSYS_PART_WIND_MASK | PSYS_PART_FOLLOW_VELOCITY_MASK,
            PSYS_PART_START_COLOR, <1.0, 0.6, 0.6>, 
            PSYS_PART_START_ALPHA, 1.0,
            PSYS_PART_END_COLOR, <0.7, 0.7, 0.6>, 
            PSYS_PART_END_ALPHA, 0.2,
            PSYS_PART_START_SCALE, <0.15, 0.7, 0.0>, 
            PSYS_PART_END_SCALE, <3.0, 3.0, 0.0>,
            PSYS_PART_MAX_AGE, 3.0,
            PSYS_SRC_ACCEL, <0.0, 0.0, 3.0>,
            PSYS_SRC_PATTERN, 
            PSYS_SRC_PATTERN_ANGLE_CONE,
            PSYS_SRC_BURST_RATE, 0.08, 
            PSYS_SRC_BURST_PART_COUNT, 10,
            PSYS_SRC_BURST_RADIUS, 0.250,
            PSYS_SRC_BURST_SPEED_MIN, 10.0, 
            PSYS_SRC_BURST_SPEED_MAX, 12.0,
            PSYS_SRC_ANGLE_BEGIN, 0.0, 
            PSYS_SRC_ANGLE_END, PI / 12 ]);
            
	}
}
