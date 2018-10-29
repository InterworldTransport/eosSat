//script to make propeller blade go transparent/opaque on linkmessage

string opaque = "metal";

default
{
     state_entry()
     {
         llSetTexture(opaque, ALL_SIDES);
     }
     link_message(integer sender_number, integer number, string message, key id)
     {
        if (llSubStringIndex(message, "spin") >= 0 )
        {
            if (llSubStringIndex(message, "forward") >= 0 )
            {
                llSetTexture("alpha",ALL_SIDES);
            }
            else
            {
                llSetTexture(opaque,ALL_SIDES);
            }
        }
        else if (llSubStringIndex(message, "pitch") >= 0 )
        {
            //llOwnerSay("No action.");
        }
     }      
} 