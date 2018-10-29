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

// This script runs with the flat control panel that manages the eosSat vehicle.
// It is a simple detector script that decides which function was selected and then calls
// it out so the proper object on the vehicle can act on it.

integer LENMAX = 8; //Number of controls that may be arranged vertically
integer WIDMAX = 5;  //Number of controls that may be arranged horizontally

// Controlled objects include the LAP systems, HAP systems, Pressurization controls,
// power components, and lift gas systems. Each component is named and each system has a 
// special channel dedicated to the commands and responses.

//integer LAPChannel = 137137;
//integer COMChannel = 137138;
//integer HAPChannel = 137139;
integer PRSChannel = 137140;
//integer POWChannel = 137141;
//integer GASChannel = 137142;
integer PRSCmdChannel = 138140;

string command="HA Ring Duct Bundle N";      //Command string to be issued to a system
string subcommand;   //String subcommand to be issued to a system
float pangle = 1.0;  //Numeric subcommand to be issued to a system
//string      UnitIdentity;

// Verbal feedback to the avatar operating the control panel is provided by the Say function.

Say(string name, integer pnumb, float pang, string pcomm, string psubcomm) 
{
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0, "/me is saying " +pcomm +" "+ psubcomm +(string)pang +" on channel "+ (string)pnumb);
    llSetObjectName(objectName);
}

$import eosSatString.lslm () str_;

//
//

default 
{
    state_entry() 
    {
    	//UnitIdentity = llGetObjectName();
    	llListen(PRSCmdChannel,"",llGetObjectName(),"");
    }
    listen( integer PRSCmdChannel, string name, key id, string message )
    {
        llWhisper(0, "Pressurization panel heard "+message);
        if (llSubStringIndex(message, "HA Ring Duct Bundle") == 0 )
        {
            command=message;
            llWhisper(0, "and acted on it as a ring duct bundle");
        }
        if (llSubStringIndex(message, "HA Wing Duct Bundle") == 0 )
        {
            command=message;
            llWhisper(0, "and acted on it as a wing duct bundle");
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
        //llWhisper(0, (string)numbery+"/"+(string)numberx+" : "+(string)number);
        //Now we need a big switch case to deal with the various commands associated with each numbered region on the console.
        //We must construct the channel, command, and subcommand strings.
        //integer channel = -1;
        
        
        if (number==1)
        {
            subcommand="reset interior intake";
            pangle=1.0;
        }
        else if (number==2)
        {
            subcommand="interior intake on";
            pangle=1.0;
        }
        else if (number==3)
        {
            subcommand="interior intake off";
            pangle=1.0;
        }
        else if (number==4)
        {
            subcommand="reset interior outtake";
            pangle=1.0;
        }
        else if (number==5)
        {
            subcommand="interior outtake on";
            pangle=1.0;
        }
        else if (number==6)
        {
            subcommand="interior outtake off";
            pangle=1.0;
        }
        else if (number>=7 && number<=8)
        {
            pangle=touch_st.x*2.0;
        }
        
        else if (number==9)
        {
            subcommand="reset exterior intake";
            pangle=1.0;
        }
        else if (number==10)
        {
            subcommand="exterior intake on";
            pangle=1.0;
        }
        else if (number==11)
        {
            subcommand="exterior intake off";
            pangle=1.0; 
        }
        else if (number==12)
        {
            subcommand="reset exterior outtake";
            pangle=1.0;
        }
        else if (number==13)
        {
            subcommand="exterior outtake on";
            pangle=1.0;
        }
        else if (number==14)
        {
            subcommand="exterior outtake off";
            pangle=1.0; 
        }
        else if (number>=15 && number<=16)
        {
            pangle=touch_st.x*2.0;
        }
        
        else if (number==17)
        {
            subcommand="reset column intake";
            pangle=1.0;
        }
        else if (number==18)
        {
            subcommand="column intake on";
            pangle=1.0;
        }
        else if (number==19)
        {
            subcommand="column intake off";
            pangle=1.0; 
        }
        else if (number==20)
        {
            subcommand="reset column outtake";
            pangle=1.0;
        }
        else if (number==21)
        {
            subcommand="column outtake on";
            pangle=1.0;
        }
        else if (number==22)
        {
            subcommand="column outtake off";
            pangle=1.0;
        }
        else if (number>=23 && number<=24)
        {
            pangle=touch_st.x*2.0;
        }
        
        else if (number==25)
        {
            subcommand="reset subdorsal intake";
            pangle=1.0;
        }
        else if (number==26)
        {
            subcommand="subdorsal intake on";
            pangle=1.0;
        }
        else if (number==27)
        {
            subcommand="subdorsal outtake off";
            pangle=1.0;
        }
        else if (number==28)
        {
            subcommand="reset subdorsal outtake";
            pangle=1.0;
        }
        else if (number==29)
        {
            subcommand="subdorsal outtake on";
            pangle=1.0;
        }
        else if (number==30)
        {
            subcommand="subdorsal outtake off";
            pangle=1.0;
        }
        else if (number>=31 && number<=32)
        {
            pangle=touch_st.x*2.0;
        }
        
        else if (number==33)
        {
            subcommand="reset dorsal intake";
            pangle=1.0;
        }
        else if (number==34)
        {
            subcommand="dorsal intake on";
            pangle=1.0;
        }
        else if (number==35)
        {
            subcommand="dorsal intake off";
            pangle=1.0;
        }
        else if (number==36)
        {
            subcommand="reset dorsal outtake";
            pangle=1.0;
        }
        else if (number==37)
        {
            subcommand="dorsal outtake on";
            pangle=1.0;
        }
        else if (number==38)
        {
            subcommand="dorsal outtake off";
            pangle=1.0;
        }
        else if (number>=39 && number<=40)
        {
            pangle=touch_st.x*2.0;
        }
        
        else 
        {
            //channel=-1;
            command="Unknown System ";
            subcommand="with no callable function:";
            pangle=1.0;
        }
        
        //Now we actually issue the command
        //Say(llDetectedName(0), PRSChannel, pangle, command, subcommand);
        llRegionSay(PRSChannel, command+" "+subcommand+" "+(string)pangle);        
    }    
}