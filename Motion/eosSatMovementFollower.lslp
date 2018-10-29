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
// date ~April 2009
// copyright 2009
//
//************

//************
//
// This script runs the envelope movement follower on the eosSat vehicle.
// It is a message detector, object hunter and a routine that manages 
// translations and rotations of a secondary element on the airship.

//list a = llGetObjectDetails(llDetectedKey(0), ([OBJECT_NAME, 
//                    OBJECT_DESC, OBJECT_POS, OBJECT_ROT, OBJECT_VELOCITY,
//                    OBJECT_OWNER, OBJECT_GROUP, OBJECT_CREATOR]));

integer     exteriorChannel = 137136;
integer		interiorChannel =-137136;
string      UnitIdentity;
vector		homePos=<35.000, 55.000, 30.900>;
vector 		homeAttitude=<0.0,0.0,0.0>;
key			parentObject="";
vector		followPos;
rotation	followRot;
vector		diffPos;
rotation	diffRot;
float		shiftSpeed=0.01;
integer		debug=0;

$import eosSatString.lslm () str_;
//$import eosSatMovement.lslm () mov_;

default {
    state_entry()
    {
    	UnitIdentity = llGetObjectName();
    	homePos=llGetPos();
    	homeAttitude=llRot2Euler(llGetRot());
    	llOwnerSay(" says Home Position: "+(string)homePos+" and Home Attitude: "+(string)homeAttitude+" and following: "+(string)parentObject);
    	//llOwnerSay("");
    	llListen(interiorChannel,"",UnitIdentity,"");
    	llListen(exteriorChannel,"",UnitIdentity,"");
        llSetLocalRot(llEuler2Rot(homeAttitude));
    }
    listen( integer channel, string name, key id, string message )
    {
    if (channel=exteriorChannel)
    {
    	if (llSubStringIndex(message, "stop") ==0 )		//turn off timer looking for global commands
        {
        	
        }
        else if (llSubStringIndex(message, "start") ==0 )	//turn on timer for getting global commands
        {
        	
        } 
        else if (llSubStringIndex(message, UnitIdentity) == 0 )
        {
            message = str_right(message, UnitIdentity);
            llOwnerSay(" says exterior message recieved: "+message);
            
            if (llSubStringIndex(message, "raise") >= 0 )
            {
            	diffPos=<0.0,0.0,(float)str_right(message, "raise ")>;
            	llMessageLinked(LINK_THIS, 0, ("translate "+(string)diffPos), "");
            }
            else if (llSubStringIndex(message, "translate") >=0 )
            {
            	llMessageLinked(LINK_THIS, 0, message, "");
            }
            else if (llSubStringIndex(message, "euler") >=0 )
            {
            	llMessageLinked(LINK_THIS, 0, message, "");
            }
            else if (llSubStringIndex(message, "rotate") >=0 )
            {
            	llMessageLinked(LINK_THIS, 0, message, "");
            }
            else if (llSubStringIndex(message, "reset") >= 0 )
            {
                llMessageLinked(LINK_THIS, 0, "resetrot "+(string)homeAttitude, "");
                llMessageLinked(LINK_THIS, 0, "reset "+(string)homePos, "");
            }
            else 
            {  
            	//llMessageLinked(LINK_SET, 0, message, "");
            }
            //llRegionSay(interiorChannel, (string)llGetPos()); 
        }   
    }   
    else if (channel=interiorChannel)
    {	
        llOwnerSay(" says interior message recieved: "+message);
    }
    } 
}
