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
// This script manages the appearance of motion for the air on a single pressurization fan 
// on an air duct bundle on the eosSat vehicle.  It has no outside message detector (no chat listener)
// as it relies solely upon the relay script on the root prim for all messages. 

$import eosSatString.lslm () str_;

//string pdot = "JP Particle - Big Soft Dot";
float streamStrength=1.0;
key iam;

default
{
    state_entry()
    {
    	streamStrength=1.0;
        llParticleSystem([]);
    }
	on_rez(integer foo) 
 	{
 		state FanOff;
 	}
    link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, " on") >= 0 )
        {
            state FanOn;
        }
        else if (llSubStringIndex(message, " off") >= 0 )
        {
            state FanOff;
        }
        else
        {
            llParticleSystem([]);
        }
    }

    touch_start(integer total_number)
    {
        iam=llGetKey();
        llOwnerSay("Fan #"+(string)llGetLinkNumber()); 
        llParticleSystem( [
                    PSYS_SRC_TEXTURE, llGetInventoryName(INVENTORY_TEXTURE, 0),
                    PSYS_PART_END_SCALE, <0.1,0.1,0.0>, 
                    PSYS_PART_START_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_END_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_START_COLOR, <1.0,0.0,0.0>, 
                    PSYS_PART_START_ALPHA, 0.0,     
                    PSYS_PART_END_ALPHA, 1.0, 
                    PSYS_SRC_BURST_RADIUS, 0.750*streamStrength,                 
                    PSYS_PART_MAX_AGE, 0.75*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK | PSYS_PART_TARGET_POS_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 25,  
                    PSYS_SRC_BURST_RATE, 0.010,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, PI/16,
                    PSYS_SRC_ANGLE_END, 0.0, 
                    PSYS_SRC_ACCEL, <0.0,0.0,-1.0>,  
                    PSYS_SRC_TARGET_KEY, iam,     
                    PSYS_SRC_BURST_SPEED_MIN, 2.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 3.0*streamStrength
                ] );  
    }
}
state FanOn
{
	state_entry()
    {
        iam=llGetKey();
            llParticleSystem( [
                    PSYS_SRC_TEXTURE, llGetInventoryName(INVENTORY_TEXTURE, 0),
                    PSYS_PART_END_SCALE, <0.1,0.1,0.0>, 
                    PSYS_PART_START_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_END_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_START_COLOR, <1.0,0.0,0.0>, 
                    PSYS_PART_START_ALPHA, 0.0,     
                    PSYS_PART_END_ALPHA, 1.0, 
                    PSYS_SRC_BURST_RADIUS, 0.750*streamStrength,                 
                    PSYS_PART_MAX_AGE, 0.75*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK | PSYS_PART_TARGET_POS_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 25,  
                    PSYS_SRC_BURST_RATE, 0.010,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, PI/16,
                    PSYS_SRC_ANGLE_END, 0.0, 
                    PSYS_SRC_ACCEL, <0.0,0.0,-1.0>,  
                    PSYS_SRC_TARGET_KEY, iam,     
                    PSYS_SRC_BURST_SPEED_MIN, 2.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 3.0*streamStrength
                ] );            
    }
    on_rez(integer foo) 
 	{
 		state FanOff;
 	}
    link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, " off") >= 0 )
        {
            state FanOff;
        }
        else if (llSubStringIndex(message, " on") >= 0 )
        {
        	streamStrength = (float)str_right(message, " on");
        	iam=llGetKey();
            llParticleSystem( [
                    PSYS_SRC_TEXTURE, llGetInventoryName(INVENTORY_TEXTURE, 0),
                    PSYS_PART_END_SCALE, <0.1,0.1,0.0>, 
                    PSYS_PART_START_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_END_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_START_COLOR, <1.0,0.0,0.0>, 
                    PSYS_PART_START_ALPHA, 0.0,     
                    PSYS_PART_END_ALPHA, 1.0, 
                    PSYS_SRC_BURST_RADIUS, 0.750*streamStrength,                 
                    PSYS_PART_MAX_AGE, 0.75*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK | PSYS_PART_TARGET_POS_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 25,  
                    PSYS_SRC_BURST_RATE, 0.010,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, PI/16,
                    PSYS_SRC_ANGLE_END, 0.0, 
                    PSYS_SRC_ACCEL, <0.0,0.0,-1.0>,  
                    PSYS_SRC_TARGET_KEY, iam,     
                    PSYS_SRC_BURST_SPEED_MIN, 2.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 3.0*streamStrength
                ] );    
        }
        else
        {
            llParticleSystem([]);
            state default;
        }
    }
}
state FanOff
{
	state_entry()
    {
    	streamStrength=1.0;
        llParticleSystem([]);
    }
    link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, " on") >= 0 )
        {
            state FanOn;
        }
        else
        {
            llParticleSystem([]);
            state default;
        }
    }
}