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

// This script runs with the flat control panel that manages the eosSat vehicle.
// It is a simple detector scripts that decides which function was selected and then calls
// it out so the proper object on the vehicle can act on it.

integer LENMAX = 8; //Number of controls that may be arranged vertically
integer WIDMAX = 6;  //Number of controls that may be arranged horizontally

// Controlled objects include the LAP systems, HAP systems, Pressurization controls,
// power components, and lift gas systems. Each component is named and each system has a 
// special channel dedicated to the commands and responses.

//integer LAPChannel = 137137;
//integer COMChannel = 137138;
integer HAPChannel = 137139;
//integer PRSChannel = 137140;
//integer POWChannel = 137141;
//integer GASChannel = 137142;

// Verbal feedback to the avatar operating the control panel is provided by the Say function.

Say(string name, integer pnumb, float pang, string pcomm, string psubcomm) 
{
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0, "/me is saying " +pcomm +" "+ psubcomm +" "+ (string)pang + " on channel "+ (string)pnumb);
    llSetObjectName(objectName);
}


//
//


default 
{
    state_entry() 
    {
    }

    touch_start(integer total_number) 
    {
        vector touch_st = llDetectedTouchST(0);
        float numbery = touch_st.y * LENMAX;
        float numberx = touch_st.x * WIDMAX;
        integer number=llCeil(numbery)+llCeil(numberx-1)*WIDMAX;
        
        //Now we need a big switch case to deal with the various commands associated with each numbered region on the console.
        //We must construct the channel, command, and subcommand strings.
        integer channel = -1;
        string command;      //Command string to be issued to a system
        string subcommand;   //String subcommand to be issued to a system
        float pangle = 0.0;  //Numeric subcommand to be issued to a system
        
        if (number==1)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==2)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==3)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="spin stop";
            pangle=0.0;
        }
        else if (number>=4 && number<=8)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="pitch";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        
        else if (number==9)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==10)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==11)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="spin stop";
            pangle=0.0; 
        }
        else if (number>=12 && number<=16)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S1";
            subcommand="yaw";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        
        else if (number==17)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==18)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==19)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="spin stop";
            pangle=0.0; 
        }
        else if (number>=20 && number<=24)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="pitch";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        
        else if (number==25)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==26)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==27)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="spin stop";
            pangle=0.0;
        }
        else if (number>=28 && number<=32)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S2";
            subcommand="yaw";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        
        else if (number==33)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==34)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==35)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="spin stop";
            pangle=0.0;
        }
        else if (number>=36 && number<=40)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="pitch";
            pangle=180.0*((numbery-5.5)/2.5);
        }
        
        else if (number==41)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="reset";
            pangle=0.0;
        }
        else if (number==42)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="spin forward";
            pangle=0.0;
        }
        else if (number==43)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="spin stop";
            pangle=0.0;
        }
        else if (number>=44 && number<=48)
        {
            channel=HAPChannel;
            command="HA Propulsion Unit S3";
            subcommand="yaw";
            pangle=180.0*((numbery-5.5)/2.5);
        }
 
        else 
        {
            channel=0;
            command="Unknown System";
            subcommand="with no callable function:";
            pangle=0.0;
        }
        
        //Now we actually issue the command
        //Say(llDetectedName(0), channel, pangle, command, subcommand);
        llRegionSay(channel, command+" "+subcommand+" "+(string)pangle);        
    }
}

