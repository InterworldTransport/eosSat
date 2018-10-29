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
// This script manages the appearance of motion for the propeller on a single electric 
// propulsion unit on the eosSat vehicle.  It has no outside message detector (no chat listener)
// as it relies solely upon the relay script on the root prim for all messages. 

string opaque = "blur";
string transparent = "alpha";
string pdot = "JP Particle - Big Soft Dot";
float streamStrength=1.0;

$import eosSatString.lslm () str_;

default
{
    state_entry()
    {
        llSetTexture(transparent, ALL_SIDES);
        llParticleSystem([]);
    }
 	link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, " spin forward") >= 0 )
        {
            state FanOn;
        }
        else if (llSubStringIndex(message, " spin stop") >= 0 )
        {
          	streamStrength=1.0;
        	llSetTexture(transparent,ALL_SIDES);
        	llParticleSystem([]);
        }
        else
        {
        }
    }
}
state FanOn
{
	state_entry()
    {
		llSetTexture(opaque,ALL_SIDES);
        llParticleSystem( [
        			PSYS_SRC_TEXTURE, pdot,
                    PSYS_PART_START_SCALE, <0.04,0.04,0.0>, 
                    PSYS_PART_END_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_START_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_END_COLOR, <1.0,1.0,0.0>, 
                    PSYS_PART_START_ALPHA, 1.0,     
                    PSYS_PART_END_ALPHA, 0.1,                      
                    PSYS_PART_MAX_AGE, 4.0*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 15,  
                    PSYS_SRC_BURST_RATE, 0.1,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, 0.0,
                    PSYS_SRC_ANGLE_END, PI/12, 
                    PSYS_SRC_ACCEL, <0.0,-1.0,0.0>,       
                    PSYS_SRC_BURST_SPEED_MIN, 10.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 20.0*streamStrength
                ] );
    }
    on_rez(integer foo) 
 	{
 		state default;
 	}
 	link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, " spin forward") >= 0 )
        {
        	streamStrength=1.0;
            llSetTexture(opaque,ALL_SIDES);
        	llParticleSystem( [
        			PSYS_SRC_TEXTURE, pdot,
                    PSYS_PART_START_SCALE, <0.04,0.04,0.0>, 
                    PSYS_PART_END_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_START_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_END_COLOR, <1.0,1.0,0.0>, 
                    PSYS_PART_START_ALPHA, 1.0,     
                    PSYS_PART_END_ALPHA, 0.1,                      
                    PSYS_PART_MAX_AGE, 4.0*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 15,  
                    PSYS_SRC_BURST_RATE, 0.1,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, 0.0,
                    PSYS_SRC_ANGLE_END, PI/12, 
                    PSYS_SRC_ACCEL, <0.0,-1.0,0.0>,       
                    PSYS_SRC_BURST_SPEED_MIN, 10.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 12.0*streamStrength
                ] );
        }
        else if (llSubStringIndex(message, " speed") >= 0 )
        {
        	streamStrength = (float)str_right(message, " speed");
        	llSetTexture(opaque,ALL_SIDES);
        	llParticleSystem( [
        			PSYS_SRC_TEXTURE, pdot,
                    PSYS_PART_START_SCALE, <0.04,0.04,0.0>, 
                    PSYS_PART_END_SCALE, <1.0,1.0,0.0>, 
                    PSYS_PART_START_COLOR, <1.0,1.0,1.0>,
                    PSYS_PART_END_COLOR, <1.0,1.0,0.0>, 
                    PSYS_PART_START_ALPHA, 1.0,     
                    PSYS_PART_END_ALPHA, 0.1,                      
                    PSYS_PART_MAX_AGE, 4.0*streamStrength,    
                    PSYS_PART_FLAGS, ( PSYS_PART_EMISSIVE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_INTERP_SCALE_MASK ),
                    PSYS_SRC_BURST_PART_COUNT, 15,  
                    PSYS_SRC_BURST_RATE, 0.1,  
                    PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE_CONE,
                    PSYS_SRC_ANGLE_BEGIN, 0.0,
                    PSYS_SRC_ANGLE_END, PI/12, 
                    PSYS_SRC_ACCEL, <0.0,-1.0,0.0>,       
                    PSYS_SRC_BURST_SPEED_MIN, 10.0*streamStrength,   
                    PSYS_SRC_BURST_SPEED_MAX, 12.0*streamStrength
                ] );
        }
        else if (llSubStringIndex(message, " pitch") >= 0 )
        {
        	//do nothing
        }
        else
        {
            state default;
        }
    }
}