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
// date ~June 2008
// copyright 2008
//
//************

$import httpdb.lslm () db_;
string name_str;
string value_str;

buildDescription(integer number)
{
	list type_list = llGetPrimitiveParams([PRIM_TYPE]);
	
    list rot_list = llGetPrimitiveParams([PRIM_ROTATION]);
    
    list pos_list = llGetPrimitiveParams([PRIM_POSITION]);
    
	list size_list = llGetPrimitiveParams([PRIM_SIZE]);
	
    name_str = (string)llGetKey()+"/";
    value_str = "\n<prim\n    name="+llGetObjectName()+",\n    key="+(string)llGetKey()+",\n    linkNumber="+(string)number+">\n<description>"+llGetObjectDesc()+"</description>\n<property name=type>\n" + llDumpList2String(type_list,",\n") + "\n</property>\n<property name=rotation>\n" + llDumpList2String(rot_list,",\n") + "\n</property>\n<property name=position>\n" + llDumpList2String(pos_list,",\n") + "\n</property>\n<property name=size>\n" + llDumpList2String(size_list,",\n") + "\n</property>\n</prim>"; 	
}

default {

    link_message(integer sender_number, integer number, string message, key id)
    {
        if (llSubStringIndex(message, "describe") >= 0 )
        {
 			buildDescription(number);
			db_httpdb_save(name_str, value_str);	// httpdb saving code here
			//db_httpdb_delete(name_str);
	 			
            //llSay(0, "\n<prim\n    name="+llGetObjectName()+",\n    key="+(string)llGetKey()+",\n    linkNumber="+(string)number+">\n<description>"+llGetObjectDesc()+"</description>\n<property name=type>\n{" + llDumpList2String(type_list,"}\n{") + "}\n</property>\n<property name=rotation>\n{" + llDumpList2String(rot_list,"}\n{") + "}\n</property>\n<property name=position>\n{" + llDumpList2String(pos_list,"}\n{") + "}\n</property>\n<property name=size>\n{" + llDumpList2String(size_list,"}\n{") + "}\n</property>\n</prim>");
        	
        	
        	if (number != 1) 
        	{
        		llRemoveInventory(llGetScriptName());
        	}
        }
    }
    // httpdb llHTTPRequest response handler. this should not be removed.
    // insert your own code at the bottom of the function.
    http_response( key reqid, integer status, list meta, string body ) 
    {

        // See if it's an httpdb request
        integer httpdb_req_index = llListFindList( db_httpdb_reqids, [reqid] );
        if ( httpdb_req_index != -1 ) 
        {
            // pull its info out the list
            string  name = llList2String( db_httpdb_reqids, httpdb_req_index+1 );
            integer type = llList2Integer(db_httpdb_reqids, httpdb_req_index+2 );

            // remove it from the list
            db_httpdb_reqids = llDeleteSubList( db_httpdb_reqids, httpdb_req_index, httpdb_req_index+2 );

            // only 2xx codes represent success
            if ( status < 200 || status >= 300 ) 
            {
                db_httpdb_failure( type, name, status, body );
                return;
            }

            // if it's a load request, call httpdb_value_loaded
            if ( type == db_HTTPDB_LOAD )
                db_httpdb_value_loaded( name, body );
            // otherwise, the body should be the updated amount of free space    
            else
                db_httpdb_free_space = (integer)body;

            db_httpdb_success( type, name, status, body );

            return;
        }
    }
}
