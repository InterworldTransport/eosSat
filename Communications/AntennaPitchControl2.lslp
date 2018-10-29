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

vector 		startAttitude;
string		LastMessage;

$import eosSatControl.lslm () att_;
$import eosSatString.lslm () str_;
$import eosSatTalk.lslm () tlk_;

default
{
    state_entry()
    {
    	startAttitude = <PI_BY_TWO, 0.0, 3*PI/4>;
        llSetLocalRot(llEuler2Rot(startAttitude));
    }
    
    link_message(integer sender_number, integer number, string message, key id)
    {   
        if ( llSubStringIndex(message, "pitch") >=0 )
        {
            att_pitch(startAttitude, <0.0, (float)str_right(message, "pitch")*PI/180.0, 0.0>); 
        }
        else if (message == "reset")
        {
        	att_pitch(startAttitude, <0.0, 0.0, 0.0>);
        }
        else if (message == "talk")
        {
        	tlk_SayAttitude(message);   
        }
        LastMessage=message; 
    }
}