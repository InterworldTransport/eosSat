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
// This script runs the actual motion of the eosSat vehicle.
// It is a message detector and a routine that manages translations
// and rotations of element containing it on the airship.
//
// This script relies soley on linked messages, so there must be no 
// listeners for outside messages.

vector		targetPos;
rotation	targetRot;
vector		diffPos;
rotation	diffRot;
float		shiftSpeed=0.01;
integer		debug=0;

$import eosSatString.lslm () str_;
$import eosSatMovement.lslm () mov_;

default {
    state_entry() 
    {

    }
    link_message(integer sender_number, integer number, string message, key id)
    {
		if (llSubStringIndex(message, "translate") >=0 )
		{
			diffPos=(vector)str_right(message, "translate ");				//<x, y, z>
			targetPos=llGetPos()+diffPos;
			mov_translate(targetPos, diffPos, shiftSpeed, debug);
		}
		else if (llSubStringIndex(message, "euler") >=0 )
		{
			diffRot=llEuler2Rot((vector)str_right(message, "euler "));		//<pitch, roll, yaw>
			targetRot=diffRot*llGetRot();
			mov_rotate(targetRot, diffRot, shiftSpeed, debug);
		}
		else if (llSubStringIndex(message, "rotate") >=0 )
		{
			diffRot=(rotation)str_right(message, "rotate ");				//<x, y, z, s>
			targetRot=diffRot*llGetRot();
			mov_rotate(targetRot, diffRot, shiftSpeed, debug);
		}
		else if (llSubStringIndex(message, "resetpos") >= 0 )
		{
			diffPos=(vector)str_right(message, "resetpos ");					//<x, y, z>
			targetPos=llGetPos()+diffPos;
			mov_translate(targetPos, diffPos, shiftSpeed, debug);
		}
		else if (llSubStringIndex(message, "resetrot") >= 0 )
		{
			vector homeAttitude=(vector)str_right(message, "resetrot ");	//<x, y, z>
			llSetLocalRot(llEuler2Rot(homeAttitude));
		}
    }
    
}
