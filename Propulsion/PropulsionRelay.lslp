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

integer     channel = 137139;
string      UnitIdentity;
string		LastMessage;
vector 		startAttitude;

$import eosSatString.lslm () str_;
$import eosSatTalk.lslm () tlk_;
$import eosSatControl.lslm () att_;


default
{
    state_entry()
    {
    	UnitIdentity = llGetObjectName();
    	startAttitude = llRot2Euler(llGetRot());
    	llListen(channel,"",llGetObjectName(),"");
    	llParticleSystem([]);
        llSetLocalRot(llEuler2Rot(startAttitude));

        llMessageLinked(LINK_SET, 0, "spin stop", ""); 
        llMessageLinked(LINK_SET, 0, "pitch 0.0", ""); 
    }
    
    listen( integer channel, string name, key id, string message )
    {
        if (llSubStringIndex(message, UnitIdentity) == 0 )
        {
            message = str_right(message, UnitIdentity);
            if (llSubStringIndex(message, "yaw") >= 0 )
            {
                att_yaw(startAttitude, <0.0, 0.0, ((float)str_right(message, "yaw"))*PI/180.0>);
            }
            else if (llSubStringIndex(message, "reset") >= 0 )
            {
                llMessageLinked(LINK_SET, 0, "reset", "");
                att_yaw(startAttitude, <0.0,0.0,0.0>);
            }
            else 
            {
            	llMessageLinked(LINK_SET, 0, message, "");
            }
        }
        
        if (message == "talk")
        {
            tlk_SayAttitude(message);
            llMessageLinked(LINK_SET, 0, message, ""); 
        }           
    }
}