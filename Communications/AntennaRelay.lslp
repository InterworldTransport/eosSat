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
// date ~February 2009
// copyright 2009
//
//************

//************
//
// This script runs a single communication unit on the eosSat vehicle.
// It is a message detector and relay and a routine that manages the roll angle.

integer     channel = 137138;
string      UnitIdentity;
string		LastMessage;

// This vector is a global rotation setting for the unit.  When converted to a quaternion 
// via llEuler2Rot() it can be used to reset the unit to point skyward.
vector startAttitude = <0.0, PI_BY_TWO, 0.0>;

// Verbal feedback to the avatar operating the unit is provided by the Say function.

$import eosSatControl.lslm () att_;
$import eosSatString.lslm () str_;
$import eosSatTalk.lslm () tlk_;

default
{
    state_entry()
    {
    	UnitIdentity = llGetObjectName();
        llListen(channel,"",llGetObjectName(),"");
        
        llSetRot(llEuler2Rot(startAttitude));
        llMessageLinked(LINK_SET, 0, "pitch 0.0", ""); 
        llParticleSystem([]);
    }
    
    listen( integer channel, string name, key id, string message )
    {
        if (llSubStringIndex(message, UnitIdentity) == 0 )
        {
            message = str_right(message, UnitIdentity);
            if (llSubStringIndex(message, "roll") >= 0 )
            {
                att_roll(startAttitude, <0.0, ((float)str_right(message, "roll"))*PI/180.0, 0.0>);
            }
            else if (llSubStringIndex(message, "reset") >= 0 )
            {
                llMessageLinked(LINK_SET, 0, "pitch 0.0", "");
                att_roll(startAttitude, <0.0,0.0,0.0>);
            }
            llMessageLinked(LINK_SET, 0, message, ""); 
        }
        if (message == "talk")
        {
            tlk_SayAttitude(message);
            llMessageLinked(LINK_SET, 0, message, ""); 
        }  
        LastMessage=message;         
    }
}

