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

integer LENMAX = 7; //Number of controls that may be arranged vertically
integer WIDMAX = 5;  //Number of controls that may be arranged horizontally

// Controlled objects include the LAP systems, HAP systems, Pressurization controls,
// power components, and lift gas systems. Each component is named and each system has a 
// special channel dedicated to the commands and responses.

integer LAPCmdChannel = 138137;
integer COMCmdChannel = 138138;
integer HAPCmdChannel = 138139;
integer PRSCmdChannel = 138140;
//integer POWCmdChannel = 138141;
//integer GASCmdChannel = 138142;

integer channel=0;
string UnitIdentity;
string command="HA Propulsion Unit S1";      //Command string to be issued to a system

string commtext="eosSatMasterControl_Comm_clr";
string presstext="eosSatMasterControl_Press";
string proptext="eosSatMasterControl_Prop";

// Verbal feedback to the avatar operating the control panel is provided by the Say function.

Say(string name, integer pnumb, string pcomm) 
{
    string objectName = llGetObjectName();
    llSetObjectName(name);
    llWhisper(0, "/me is saying " +pcomm + " on channel "+ (string)pnumb);
    llSetObjectName(objectName);
}

$import eosSatString.lslm () str_;
//
//


default 
{
    state_entry() 
    {
    	UnitIdentity = llGetObjectName();
    	//llListen(HAPCmdChannel,"",llGetObjectName(),"");
    }

    touch_start(integer total_number) 
    {
    	integer controlFace=llDetectedTouchFace(total_number);
        vector touch_st = llDetectedTouchST(0);
        float numbery = touch_st.y * LENMAX;
        float numberx = touch_st.x * WIDMAX;
        integer number=llCeil(numbery)+llCeil(numberx-1)*LENMAX;
        channel=0;
        
        //Now we need a switch case to deal with the various commands associated with each numbered region on the console.
        //We must construct the subcommand strings, but the listener has already handled the command string.

        if (number==2)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit P3";
        }
        else if (number==4)
        {
        	llSetTexture(commtext, controlFace);
        	channel=COMCmdChannel;
            command="HA Antenna Unit P1";
        }
        else if (number==5)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle W";
        }
        else if (number==6)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit P2";
        }
        else if (number==7)
        {
        	llSetTexture(commtext, controlFace);
        	channel=COMCmdChannel;
            command="HA Antenna Unit BP";
        }
        
        else if (number==8)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Wing Duct Bundle P2";
        }
        else if (number==9)
        {
        	llSetTexture(proptext, controlFace);
        	channel=LAPCmdChannel;
            command="HA LAP Unit L1";
        }
        else if (number==10)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Wing Duct Bundle P1";
        }
        else if (number==11)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle SW";
        }
        else if (number==13)
        {
        	llSetTexture(presstext, controlFace);
        	llSetTexture(commtext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle NW";
        }
        else if (number==14)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit P1";
        }
        
        else if (number==17)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle SS";
        }
        else if (number==21)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle NN";
        }
        
        else if (number==22)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Wing Duct Bundle S2";
        }
        else if (number==23)
        {
        	llSetTexture(proptext, controlFace);
        	channel=LAPCmdChannel;
            command="HA LAP Unit L2";
        }
        else if (number==24)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Wing Duct Bundle S1";
        }
        else if (number==25)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle SE";
        }
        else if (number==27)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle NE";
        }
        else if (number==28)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit S1";
        }
        
        else if (number==30)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit S3";
        }
        else if (number==32)
        {
        	llSetTexture(commtext, controlFace);
        	channel=COMCmdChannel;
            command="HA Antenna Unit S1";
        }
        else if (number==33)
        {
        	llSetTexture(presstext, controlFace);
        	channel=PRSCmdChannel;
            command="HA Ring Duct Bundle E";
        }
        else if (number==34)
        {
        	llSetTexture(proptext, controlFace);
        	channel=HAPCmdChannel;
            command="HA Propulsion Unit S2";
        }
        else if (number==35)
        {
        	llSetTexture(commtext, controlFace);
        	channel=COMCmdChannel;
            command="HA Antenna Unit BS";
        }
        
        else 
        {
        	llSetTexture(commtext, controlFace);
        	channel=0;
            command="NULL";
        }
        
        //Now we actually issue the command
        Say(llDetectedName(0), channel, command);
        if (channel!=0)
        {
        	llRegionSay(channel, command);        
        }
    }
}

