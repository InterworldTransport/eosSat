// Original created by Anylyn Hax in the hot summer of 2007.
// Alteration for psuedo-xml output by Alfred Differ July 2008.
// This derivativee version of the code is copyright 2008.
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
// The primary difference for this new version is to switch from ouput 
// appropriate for the llSetPrimitiveParams() function to psuedo-XML for
// use in documentation of large builds.

string header_str;
string footer_str	=	"</prim>";
string pos_str;
string rot_str;
string size_str;
string type_str;
//string face_str;
string mat_str;
string phyz_str;
string phan_str;
string temp_str;
string flex_str;
string point_str;

list booleans = ([
        "FALSE",                    // 0
        "TRUE"                      // 1
        ]);
 
list texgens = ([
        "DEFAULT",      // 0
        "PLANAR"        // 1
        ]);
 
list holeshape = ([
        "DEFAULT",        //   0  default (matches the prim type: square for box, circle for cylinder, etc.)
        "","","","","","","","","","","","","","","",
        "CIRCLE",         //   16  circle
        "","","","","","","","","","","","","","","",
        "SQUARE",         //   32  square
        "","","","","","","","","","","","","","","", 
        "TRIANGLE"        //   48  triangle
        ]);
 
list sculpttype = ([
        "SPHERE",  //   1  sphere (Converge top & bottom, stitch left side to right)  
        "TORUS",   //   2  torus (Stitch top to bottom, stitch left side to right)  
        "PLANE",   //   3  plane (No stitching or converging)  
        "CYLINDER" //   4  cylinder (Stitch left side to right, leave top and bottom open) 
        ]);
 
list bumpmapping = ([
        "NONE",           //   0  none: no bump map  
        "BRIGHT",         //   1  brightness: generate bump map from highlights  
        "DARK",           //   2  darkness: generate bump map from lowlights  
        "WOOD",           //   3  woodgrain  
        "BARK",           //   4  bark  
        "BRICKS",         //   5  bricks  
        "CHECKER",        //   6  checker  
        "CONCRETE",       //   7  concrete  
        "TILE",           //   8  crustytile  
        "TONE",          //   9  cutstone: blocks  
        "DISKS",          //   10  discs: packed circles  
        "GRAVEL",         //   11  gravel  
        "SIDING",         //   13  siding  
        "LARGETILE",      //   14  stonetile  
        "STUCCO",         //   15  stucco  
        "SUCTION",        //   16  suction: rings  
        "WEAVE"           //   17  weave  
        ]);
 
list shinys = ([
        "PRIM_SHINY_NONE",          //   0  none  
        "PRIM_SHINY_LOW",           //   1  low  
        "PRIM_SHINY_MEDIUM",        //   2  medium 
        "PRIM_SHINY_HIGH"           //   3  high  
        ]);
 
list materials =([
        "STONE",      //  0  stone  
        "METAL",      //  1  metal  
        "GLASS",      //  2  glass  
        "WOOD",       //  3  wood  
        "FLESH",      //  4  flesh  
        "PLASTIC",    //  5  plastic  
        "RUBBER",     //  6  rubber  
        "LIGHT"       //  7  light 
        ]);

string fillHeader(integer number)
{
	return "\n<prim\n    name="+llGetObjectName()+"\n\tkey="+(string)llGetKey()+",\n\tlinkNumber="+(string)number+">\n<description>"+llGetObjectDesc()+"</description>\n";
}

string fillPos(list pos)
{
    return "<position value="+(string)llList2Vector(pos, 0)+" />\n";
}

string fillRot(list rot)
{
    return "<rotation value="+(string)llList2Vector(rot, 0)+" />\n";
}

string fillSize(list size)
{
    return "<size value="+(string)llList2Vector(size, 0)+" />\n";
}

string fillTypeDetails(list prim_type)
{
	string output;
	if(llList2Integer(prim_type,0)==0){output = fillTypeBox(prim_type);}
    if(llList2Integer(prim_type,0)==1){output = fillTypeCylinder(prim_type);}
	if(llList2Integer(prim_type,0)==2){output = fillTypePrism(prim_type);}
	if(llList2Integer(prim_type,0)==3){output = fillTypeSphere(prim_type);}
	if(llList2Integer(prim_type,0)==4){output = fillTypeTorus(prim_type);}
	if(llList2Integer(prim_type,0)==5){output = fillTypeTube(prim_type);}
	if(llList2Integer(prim_type,0)==6){output = fillTypeRing(prim_type);}
	if(llList2Integer(prim_type,0)==7){output = fillTypeSculpt(prim_type);}
	return output;
}

string fillTypeBox(list prim_type)
{
	string output = "<type value=box>\n";
    output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
    output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
    output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
    output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
    output += "\t<topsize value="+(string)llList2Vector(prim_type,5)+" />\n";
    output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
    output += "</type>\n";
    return output;
}

string fillTypeCylinder(list prim_type)
{
	string output = "<type value=cylinder>\n";
	output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<topsize value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
	output += "</type>\n";
	return output;
}

string fillTypePrism(list prim_type)
{
	string output = "<type value=Prism>\n";
	output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<topsize value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
	output += "</type>\n";
	return output;
}

string fillTypeSphere(list prim_type)
{
	string output = "<type value=Sphere>\n";
	output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<dimple value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "</type>\n";
	return output;
}

string fillTypeTorus(list prim_type)
{
	string output = "<type value=Torus>\n";
	output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<holesize value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
	output += "\t<advancedcut value="+(string)llList2Vector(prim_type,7)+" />\n";
	output += "\t<taper value="+(string)llList2Vector(prim_type,8)+" />\n";
	output += "\t<revs value="+(string)llList2Float(prim_type,9)+" />\n";
	output += "\t<radoffset value="+(string)llList2Float(prim_type,10)+" />\n";
	output += "\t<skew value="+(string)llList2Float(prim_type,11)+"</element>\n";
	output += "</type>\n";
	return output;
}

string fillTypeTube(list prim_type)
{
	string output = "<type value=Tube>\n";
	output += "\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<holesize value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
	output += "\t<advancedcut value="+(string)llList2Vector(prim_type,7)+" />\n";
	output += "\t<taper value="+(string)llList2Vector(prim_type,8)+" />\n";
	output += "\t<revs value="+(string)llList2Float(prim_type,9)+" />\n";
	output += "\t<radoffset value="+(string)llList2Float(prim_type,10)+" />\n";
	output += "\t<skew value="+(string)llList2Float(prim_type,11)+" />\n";
	output += "</type>\n";
	return output;
}

string fillTypeRing(list prim_type)
{
	string output = "<type value=Ring>\n";
	output += "\t<\t<holeshape value="+(string)llList2String(holeshape ,llList2Integer(prim_type,1))+" />\n";
	output += "\t<cut value="+(string)llList2Vector(prim_type,2)+" />\n";
	output += "\t<hollow value="+(string)llList2Float(prim_type,3)+" />\n";
	output += "\t<twist value="+(string)llList2Vector(prim_type,4)+" />\n";
	output += "\t<holesize value="+(string)llList2Vector(prim_type,5)+" />\n";
	output += "\t<topshear value="+(string)llList2Vector(prim_type,6)+" />\n";
	output += "\t<advancedcut value="+(string)llList2Vector(prim_type,7)+" />\n";
	output += "\t<taper value="+(string)llList2Vector(prim_type,8)+" />\n";
	output += "\t<revs value="+(string)llList2Float(prim_type,9)+" />\n";
	output += "\t<radoffset value="+(string)llList2Float(prim_type,10)+" />\n";
	output += "\t<skew value="+(string)llList2Float(prim_type,11)+" />\n";
	output += "</type>\n";
	return output;
}

string fillTypeSculpt(list prim_type)
{
	string output = "<type value=Sculpt>\n";
	output += "\t<map value="+(string)llList2String(prim_type,1)+" />\n";
	output += "\t<type value="+(string)llList2Integer(prim_type,2)+" />\n";
	output += "</type>\n";
	return output;
}

string fillFaceDetail(integer sides)
{
	integer i=0;
	list bump_shiny;
	list color;
	list bright;
	list texgen;
	list texture;
	string output="\n<property name=face>\n";

	while(i <= sides) 
    {
    	bump_shiny=llGetPrimitiveParams([PRIM_BUMP_SHINY,i]);
		color=llGetPrimitiveParams([PRIM_COLOR,i]);
		bright=llGetPrimitiveParams([PRIM_FULLBRIGHT,i]);
		texgen=llGetPrimitiveParams([PRIM_TEXGEN ,i]);
		texture=llGetPrimitiveParams([PRIM_TEXTURE,i]);
		
    	output += "\t<facenumber value="+(string)i+" />\n";
        	
		if (bump_shiny != []) 
		{
			output += "\t<element name=bumpshiny>\n";
			output += "\t\t<shine value="+llList2String(shinys,llList2Integer(bump_shiny,0))+" />\n";
			output += "\t\t<bump value="+llList2String(bumpmapping ,llList2Integer(bump_shiny,1))+" />\n";
			output += "\t</element>\n";
			bump_shiny = [];
		}
		if (color != []) 
		{
			output += "\t<element name=color>\n";
			output += "\t\t<color value=>"+(string)llList2Vector(color,0)+" />\n";
			output += "\t\t<alpha value=>"+(string)llList2Float(color,1)+" />\n";
			output += "\t</element>\n";
			color = [];
		}
		if (bright != []) 
		{
			output += "\t<element name=fullbright>\n";
			output += "\t\t<light value=>"+(string)llList2String(booleans ,llList2Integer(bright,0))+" />\n";
			output += "\t</element>\n";
			bright = []; 
		} 
		if (texgen != []) 
		{
			output += "\t<element name=textgen>\n";
			output += "\t\t<mode value="+llList2String(texgens,llList2Integer(texgen,0))+" />\n";
			output += "\t</element>\n";
			texgen = [];
		}
		if (texture != []) 
		{
			output += "\t<element name=texture>\n";
            output += "\t\t<key value="+(string)llList2String(texture,0)+" />\n";
			output += "\t\t<repeats value="+(string)llList2Vector(texture,1)+" />\n";
            output += "\t\t<offsets value="+(string)llList2Vector(texture,2)+" />\n";
			output += "\t\t<rotation value="+(string)llList2Float(texture,3)+" />\n";
            output += "\t</element>\n";
			texture = [];
		}
    	i++;
    }
	output = "\n</property>\n";
	return output;
}

string fillMatDetail(list mat)
{
   	return "<material value="+(string)llList2String(materials ,llList2Integer(mat,0))+" />\n";
}

string fillPhyzDetail(list physics)
{
	string output = "<physics value="+(string)llList2String(booleans ,llList2Integer(physics ,0))+" />\n";
	if (llSubStringIndex(output, "FALSE") >= 0 ) {output="";}
	return output;
}

string fillPhanDetail(list phantom)
{
	string output = "<phantom value="+(string)llList2String(booleans ,llList2Integer(phantom ,0))+" />\n";
    if (llSubStringIndex(output, "FALSE") >= 0 ) {output="";}
    return output;
}

string fillTempDetail(list temprez)
{
	string output = "<temprez value="+(string)llList2String(booleans ,llList2Integer(temprez ,0))+" />\n";
	if (llSubStringIndex(output, "FALSE") >= 0 ) {output="";}
	return output;
}

string fillLightDetail(list light)
{
	string output = "<pointlight>\n";
	output += "\t<enabled value="+(string)llList2String(booleans ,llList2Integer(light,0))+" />\n";
	output += "\t<color value="+(string)llList2Vector(light,1)+" />\n";
	output += "\t<intensity value="+(string)llList2Float(light,2)+" />\n";
	output += "\t<radius value="+(string)llList2Float(light,3)+" />\n";
	output += "\t<falloff value="+(string)llList2Float(light,4)+" />\n";
    output += "</pointlight>\n";
    if (llSubStringIndex(output, "FALSE") >= 0 ) {output="";}
	return output;
}

string fillFlexDetail(list flex)
{
	string output = "<flex>\n";
	output += "\t<enabled value="+(string)llList2String(booleans ,llList2Integer(flex,0))+" />\n";
	output += "\t<softness value="+(string)llList2Integer(flex,1)+" />\n";
	output += "\t<gravity value="+(string)llList2Float(flex,2)+" />\n";
	output += "\t<friction value="+(string)llList2Float(flex,3)+" />\n";
	output += "\t<wind value="+(string)llList2Float(flex,4)+" />\n";
	output += "\t<tension value="+(string)llList2Float(flex,5)+" />\n";
	output += "\t<force value="+(string)llList2Vector(flex,6)+" />\n";
	output += "</flex>\n";
	if (llSubStringIndex(output, "FALSE") >= 0 ) {output="";}
	return output;
}

default
{
    link_message(integer sender_number, integer number, string message, key id)
    {
		header_str 	= fillHeader(number); 
        pos_str 	= fillPos(llGetPrimitiveParams([PRIM_POSITION]));
		rot_str 	= fillRot(llGetPrimitiveParams([PRIM_ROTATION]));
		size_str 	= fillSize(llGetPrimitiveParams([PRIM_SIZE]));
        type_str 	= fillTypeDetails(llGetPrimitiveParams([PRIM_TYPE]));
        //face_str 	= fillFaceDetail(llGetNumberOfSides());
        mat_str		= fillMatDetail(llGetPrimitiveParams([PRIM_MATERIAL]));
		phyz_str	= fillPhyzDetail(llGetPrimitiveParams([PRIM_PHYSICS]));
		phan_str	= fillPhanDetail(llGetPrimitiveParams([PRIM_PHANTOM]));
		temp_str	= fillTempDetail(llGetPrimitiveParams([PRIM_TEMP_ON_REZ]));
		point_str	= fillLightDetail(llGetPrimitiveParams([PRIM_POINT_LIGHT]));
		flex_str	= fillFlexDetail(llGetPrimitiveParams([PRIM_FLEXIBLE]));

		llOwnerSay(header_str+pos_str+rot_str+size_str+type_str+point_str+mat_str+phyz_str+phan_str+temp_str+flex_str+footer_str);
        //llOwnerSay(header_str+pos_str+rot_str+size_str+type_str+face_str+mat_str+phyz_str+phan_str+temp_str+point_str+flex_str+footer_str);
        llOwnerSay((string)llGetFreeMemory() + " Bytes");   
        if (number != 1) 
        {
        	llRemoveInventory(llGetScriptName());
        }      
    }
}