integer channel = 4;

integer number = 0;
integer numberw = 0;
integer MAX = 10;
integer WID = 2;

default {
    state_entry() {
    }

    touch_start(integer total_number) {
        vector touch_uv = llDetectedTouchST(0);
        number = llCeil(touch_uv.y * MAX);
        numberw = llCeil(touch_uv.x * WID);
		if (numberw==2) 
		{
			number=number+10;
		}

        llWhisper(0, llDetectedName(0) + " is changing the TV channel to " + (string)number);
        //llRegionSay(channel, (string)number);        
    }
}