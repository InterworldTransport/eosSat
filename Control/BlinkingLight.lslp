integer rate=3;
vector color = <1.0, 0.0, 0.0>;

default {
    state_entry() {
        llSetTimerEvent(rate);
    }
    
    timer(){
    	//Blink the light on
    	llSetPrimitiveParams([PRIM_FULLBRIGHT, ALL_SIDES, TRUE]);
    	
    	//Blink the light off    	
    	llSetPrimitiveParams([PRIM_FULLBRIGHT, ALL_SIDES, FALSE ]);
    }
}
