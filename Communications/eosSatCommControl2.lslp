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

// This script runs with the flat control subpanel that manages the eosSat vehicle's communications.
// It is a simple detector scripts that decides which function was selected and then calls
// it out so the proper object on the vehicle can act on it.  It also has a listener that pays
// attention to what the master control panel says the controlled device is at the moment.  Since it
// only accepts devices that start with the name 'HA Antenna Unit' and it only listens on the 
// communications command channel it will only hand out commands related to communications.

integer LENMAX = 8; //Number of controls that may be arranged vertically
integer WIDMAX = 3;  //Number of controls that may be arranged horizontally

//integer LAPChannel = 137137;
integer COMChannel = 137138;
//integer HAPChannel = 137139;
//integer PRSChannel = 137140;
//integer POWChannel = 137141;
//integer GASChannel = 137142;
integer COMCmdChannel = 138138;

string command="HA Antenna Unit S1";      //default for start up
string subcommand;   //String subcommand to be issued to a system
float pangle = 0.0;  //Numeric subcommand to be issued to a system


// Verbal feedback to the avatar operating the control panel is provided by the Say function.

Say(string name, integer pnumb, float pang, string pcomm, string psubcomm) 
{
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0, "/me is saying " +pcomm +" "+ psubcomm +" "+ (string)pang + " on channel "+ (string)pnumb);
    llSetObjectName(objectName);
}

$import eosSatString.lslm () str_;
//
//


default 
{
    state_entry() 
    {
    	llListen(COMCmdChannel,"",llGetObjectName(),"");
    }
	listen( integer HAPCmdChannel, string name, key id, string message )
    {
        if (llSubStringIndex(message, " HA Antenna Unit") == 0 )
        {
            command=message;
        }
        else
        {
            //Do nothing here.
        }
    }
    touch_start(integer total_number) 
    {
        vector touch_st = llDetectedTouchST(0);
        float numbery = touch_st.y * LENMAX;
        float numberx = touch_st.x * WIDMAX;
        integer number=llCeil(numbery)+llCeil(numberx-1)*LENMAX;
        
        //Now we need a switch case to deal with the various commands associated with each numbered region on the console.
        //We must construct the subcommand strings, but the listener has already handled the command string.
        
        if (number==1 || number==9 || number==17)
        {
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==2 || number==10 || number==18)
        {
            subcommand="beam on";
            pangle=0.0;
        }
        else if (number==3 || number==11 || number==19)
        {
            subcommand="beam off";
            pangle=0.0;
        }
        else if (number>=4 && number<=8)
        {
            subcommand="pitch";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        else if (number>=12 && number<=16)
        {
            subcommand="roll";
            pangle=180.0*((numbery-5.5)/2.5);
        }
 		else if (number>=20 && number<=24)
        {
            subcommand="speed";
            pangle=((numbery-3)/2.5);
        }
        else 
        {
            subcommand="with no callable function:";
            pangle=0.0;
        }
        
        //Now we actually issue the command
        Say(llDetectedName(0), COMChannel, pangle, command, subcommand);
        llRegionSay(COMChannel, command+" "+subcommand+" "+(string)pangle);        
    }
}

