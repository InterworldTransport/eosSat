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
// date ~June 2008
// copyright 2008
//
//************

integer channel;
integer PIN = 1341134;

linkSetCommand()
{
	integer linkcount=llGetNumberOfPrims();
    llMessageLinked(1, 1, "describe", ""); 
    integer loop=1;
    integer startparam=0;
    while (loop<=linkcount)
    {
    	if(loop>1) {llRemoteLoadScriptPin(llGetLinkKey(loop), "PrimChildDescriber", PIN, TRUE, startparam);}
        llMessageLinked(loop, loop, "describe", ""); 
        loop++;    
    }
}

default {
    state_entry() 
    {
        llOwnerSay(llGetObjectName()+" : "+(string)llGetKey()+" is ready to push a describer script to all linked prims using the agreed upon PIN.");
    }

	listen(integer chan, string name, key id, string mes)
    {
        if(id == llGetOwnerKey(id))//won't listen to objects unless they aren't in the region.
        	if (llSubStringIndex(mes, "Descriptions") >= 0 )
            {
            	llSay(0, "Starting Description Work");
            	linkSetCommand();
            }
    }

    touch_start(integer total_number)
    {    
    	// Create random channel within range [-1000000000,-2000000000]
		channel = (integer)(llFrand(-1000000000.0) - 1000000000.0);
 		llListen(channel,"", "","");
    	llDialog(llDetectedKey(0), "Please choose the function to run.",
                 ["Test Idea", "Descriptions"], channel);
    	llListenRemove(channel);
    }
}


