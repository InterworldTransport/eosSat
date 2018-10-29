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

rotation rot_xyzq;
vector start_vector=<0.0, 0.0, 0.0>;
rotation start_rot;

$import eosSatString.lslm () str_;

default {
    state_entry() 
    {
        start_rot = llEuler2Rot(start_vector);
        llSetLocalRot(start_rot); //Do the Rotation...
        rot_xyzq = llEuler2Rot(<0,1.0,0>*DEG_TO_RAD); // A Rotation of 1 degree around 2nd axis
    }
    link_message(integer sender_number, integer number, string message, key id)
     {
        if (llSubStringIndex(message, "pitch") >= 0 )
        {
        	rot_xyzq = llEuler2Rot(<0.0,(float)str_right(message, "pitch"),0.0>*DEG_TO_RAD); // Change to a Rotation
        	llSetLocalRot(start_rot*rot_xyzq); //Do the Rotation...
        	//llSetLocalRot(llGetLocalRot()*rot_xyzq); //Do the Rotation...
        }
        else if (llSubStringIndex(message, "reset") >=0)
        {
        	llSetLocalRot(start_rot); //Do the Rotation...
        }
        //if (llSubStringIndex(message, "roll") >=0 )
        //{
        //	float pangle = (float) llDeleteSubString(message, 0, 4);
        //	vector angles_in_radians = <pangle,0,0>*DEG_TO_RAD; // Change to Radians
        //	rot_xyzq = llEuler2Rot(angles_in_radians); // Change to a Rotation
        //	llSetLocalRot(llGetLocalRot()*rot_xyzq); //Do the Rotation...
        //}
     }
}


		