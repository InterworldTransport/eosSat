// Rocket Propulsion script v1.2.1 by Elbereth Witte, July 2007
//
// Broke launch code off into launch() function, additionally callable by linkmessage
//                                              Elbereth Witte - September 2007
// Added liftoff sound, Elbereth Witte, January 21st 2008
// Added reset on rez, Elbereth Witte, March 13th 2008


float thrust = 1.2; // meters per sec thrust additional to that needed to break gravity while standing straight up

launch() { // we can launch more than one way, cheaper to make it a function
    llMessageLinked(LINK_ALL_OTHERS, 0, "flameon", NULL_KEY); // effects on!
    llSetForce(<0.0, 0.0, 9.8 + thrust> * llGetMass(), TRUE); // thrust on
    // gravity constant + thrust modifier * mass
    llSetStatus(STATUS_PHYSICS, TRUE); // now we become physical, if not already
    //llTriggerSound("4c10ded8-8e1c-dcde-8d52-5836d0242667", 1.0);
    //llSetPrimitiveParams([PRIM_TEMP_ON_REZ, TRUE]); // and we will die in 60-70 secs, and not leave a lost-and-found mess
}

default {
    state_entry() {
        llMessageLinked(LINK_ALL_OTHERS, 0, "off", NULL_KEY); // wrangle effect slaves (particles/lighting)
    }

    touch_start(integer c) {
        if (llDetectedKey(0) == llGetOwner()) { // if this is the owner touching
            launch(); // execute launch() routine
            state done; // we're done
        }
    }

    link_message(integer sender, integer recint, string recstr, key reckey) {
        if (recstr == "triggerlaunch") { // we just got a message to launch!
            launch(); // execute launch() routine
            state done; // we're done
        }
    }
}

state done {
    state_entry() {
        // twiddle our thumbs, we've done what we've been asked to
    }

    on_rez(integer foo) {
        // okay, not a dignified state to be rezzed in, reset!
        llSetPrimitiveParams([PRIM_PHYSICS, FALSE, PRIM_TEMP_ON_REZ, FALSE]);
        llSetForce(<0.0, 0.0, 0.0>, TRUE); // thrust off
        state default;
    }
}