//************
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// written by Alfred Differ
// date ~March 2009
// copyright 2009
//
//************

//************
//
// This script runs a single electric propulsion unit on the eosSat vehicle.
// It is a message detector and relay and a routine that manages the local yaw  angle.

integer     channel = 137140;
string      UnitIdentity;
//string		LastMessage;


$import eosSatString.lslm () str_;


default
{
    state_entry()
    {
    	UnitIdentity = llGetObjectName();
    	llListen(channel,"",llGetObjectName(),"");
    	llParticleSystem([]);

        llMessageLinked(LINK_ALL_CHILDREN, 0, "reset", ""); 
    }
    
    listen( integer channel, string name, key id, string message )
    {
        if (llSubStringIndex(message, UnitIdentity) == 0 )
        {
            message = str_right(message, UnitIdentity);
            if (llSubStringIndex(message, "sound") >= 0 )
            {
                llPlaySound(llGetInventoryName(INVENTORY_SOUND, 0),1.0);
            }
            else if (llSubStringIndex(message, "interior intake") >= 0 )
            {
            	message = str_right(message, "interior intake");
                llMessageLinked(66, 0, message, "");  //just relay it
            }
            else if (llSubStringIndex(message, "interior outtake") >= 0 )
            {
            	message = str_right(message, "interior outtake");
                llMessageLinked(59, 0, message, "");  //just relay it
            }
            
            else if (llSubStringIndex(message, "exterior intake") >= 0 )
            {
            	message = str_right(message, "exterior intake");
                llMessageLinked(61, 0, message, "");  //just relay it
            }
            else if (llSubStringIndex(message, "exterior outtake") >= 0 )
            {
            	message = str_right(message, "exterior outtake");
                llMessageLinked(55, 0, message, "");  //just relay it
            }
            
            else if (llSubStringIndex(message, "column intake") >= 0 )
            {
            	message = str_right(message, "column intake");
                llMessageLinked(2, 0, message, "");  //just relay it
            }
            else if (llSubStringIndex(message, "column outtake") >= 0 )
            {
            	message = str_right(message, "column outtake");
                llMessageLinked(5, 0, message, "");  //just relay it
            }
            
            else if (llSubStringIndex(message, "subdorsal intake") >= 0 )
            {
            	message = str_right(message, "subdorsal intake");
                llMessageLinked(43, 0, message, "");  //just relay it
            }
            else if (llSubStringIndex(message, "subdorsal outtake") >= 0 )
            {
            	message = str_right(message, "subdorsal outtake");
                llMessageLinked(41, 0, message, "");  //just relay it
            }
            
            else if (llSubStringIndex(message, "dorsal intake") >= 0 )
            {
            	message = str_right(message, "dorsal intake");
                llMessageLinked(4, 0, message, "");  //just relay it
            }
            else if (llSubStringIndex(message, "dorsal outtake") >= 0 )
            {
            	message = str_right(message, "dorsal outtake");
                llMessageLinked(3, 0, message, "");  //just relay it
            }
            
            else if (llSubStringIndex(message, "reset") >= 0 )
            {
                llMessageLinked(LINK_ALL_CHILDREN, 0, "reset", "");  //just relay it
            }
        }
    }
}