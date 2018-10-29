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
// This script runs the primary relay for an eosSat vehicle component.
// It is a message detector and relay and a routine that manages translations
// and rotations of the lead element on the airship.
//
// This script uses link messages to do the actual motion, so it must not 
// use a link message event handler itself without extreme care to avoid 
// infinite loops.

integer     channel = 137136;
integer		interiorChannel=-137136;
string      UnitIdentity;

list		parent=[];						// parent list is [key, position, rotation, attitude]
list		home=[];						// home list is [position, rotation, attitude]
list		target=		[<0.0,0.0,0.0>, 
						<0.0,0.0,0.0,1.0>, 
						<0.0,0.0,0.0>];		// target list is [position, rotation, attitude]
list		difference=	[<0.0,0.0,0.0>, 
						<0.0,0.0,0.0,1.0>, 
						<0.0,0.0,0.0>];		// difference list is [position, rotation, attitude]

vector		homePos;
vector 		homeAttitude;
rotation	homeQuat;

vector		targetPos;
rotation	targetRot;
vector		diffPos;
rotation	diffRot;
float		shiftSpeed=0.01;
integer		debug=0;

$import eosSatString.lslm () str_;
$import eosSatMovement.lslm () mov_;

default
{
    state_entry()
    {
    	UnitIdentity = llGetObjectName();
    	homeAttitude = llRot2Euler(llGetRot());
    	homeQuat=llGetRot();
    	homePos=llGetPos();
    	llListen(channel,"",UnitIdentity,"");
    }
    touch_start(integer number)
    {
    	llOwnerSay(" says my parent is "+llList2String(parent, 0));	
    }
    
    listen( integer channel, string name, key id, string message )
    {
        if (llSubStringIndex(message, UnitIdentity) == 0 )
        {
            message = str_right(message, UnitIdentity+" ");
            if (debug==1)
    		{
            	llOwnerSay(" says exterior message recieved: "+message);
    		}
    		
    		list parentCheck=mov_checkParent(message);
    		if ((parentCheck != []) != 0)		//List != comparison returns difference in list lengths
    		{
    			parent=parentCheck+[llRot2Euler(llList2Rot(parentCheck, 2))];
    			// parent list is [key, position, rotation, attitude]
    		}
            
            if 		(llSubStringIndex(message, "massshift") == 0)
            {	//The Parent's center of mass has shifted.  Time to move ours.
            	diffPos=(vector)str_right(message, "massshift ")-llList2Vector(parent, 1);
            	llMessageLinked(LINK_THIS, 0, ("translate "+(string)diffPos), "");
            	parent=llListReplaceList((parent=[])+parent, [diffPos], 1, 1);
            	//parentCoM=parentCoM+diffPos;
            }
            else if 		(llSubStringIndex(message, "massturn") == 0)
            {	//The Parent's center of mass has turned.  Time to move our mass and reorient.
            	
            }
            else if 		(llSubStringIndex(message, "raise") == 0 )
            {
            	diffPos=<0.0,0.0,(float)str_right(message, "raise ")>;
            	llMessageLinked(LINK_THIS, 0, ("translate "+(string)diffPos), "");
            	//translations are only sent to root prim
            }
            else if 		(llSubStringIndex(message, "translate") ==0)
            {
            	llMessageLinked(LINK_THIS, 0, message, "");
            	//translations are only sent to root prim
            }
            else if 		(llSubStringIndex(message, "yaw") == 0 )
            {
            	vector diffEuler=<0.0, 0.0, ((float)str_right(message, "yaw "))*PI/180.0>;
            	llMessageLinked(LINK_SET, 0, ("euler "+(string)diffEuler), "");
            	//rotations are sent to the whole set of prims
            }
            else if 		(llSubStringIndex(message, "pitch") >= 0 )
            {
            	vector diffEuler=<((float)str_right(message, "yaw "))*PI/180.0, 0.0, 0.0>;
            	llMessageLinked(LINK_SET, 0, ("euler "+(string)diffEuler), "");
            	//rotations are sent to the whole set of prims
            }
            else if (	 	(llSubStringIndex(message, "euler") ==0)
            			|| 	(llSubStringIndex(message, "rotate") ==0)
            			)
            {
            	llMessageLinked(LINK_SET, 0, message, "");
            	//rotations are sent to the whole set of prims
            }
            else if 		(llSubStringIndex(message, "reset") == 0 )
            {
                llMessageLinked(LINK_THIS, 0, "resetrot "+(string)homeAttitude, "");
                llMessageLinked(LINK_THIS, 0, "resetpos "+(string)homePos, "");
                llMessageLinked(LINK_SET, 0, "reset", "");
            }
        }      
    }
}