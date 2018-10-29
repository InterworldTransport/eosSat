// LSL script generated: Mon Feb  1 21:55:10 PST 2016
string db_HTTPDB_GO = "http://w-hat.com/httpdb/general_orbital/eossat/";
integer db_HTTPDB_SAVE = 1000;
integer db_HTTPDB_LOAD = 1100;
list db_httpdb_reqids = [];
integer db_httpdb_free_space = -1;
string name_str;
string value_str;
db_httpdb_request(integer type,string type_str,string name,string body){
    key reqid = llHTTPRequest((db_HTTPDB_GO + name),[HTTP_METHOD,type_str],body);
    if ((reqid == NULL_KEY)) db_httpdb_failure(type,name,0,"HTTP throttled");
    else  (db_httpdb_reqids += [reqid,name,type]);
}
db_httpdb_save(string name,string value){
    db_httpdb_request(db_HTTPDB_SAVE,"PUT",name,value);
}
db_httpdb_value_loaded(string name,string value){
    llWhisper(0,(llGetObjectName() + " has loaded details."));
}
db_httpdb_failure(integer type,string name,integer status,string body){
    llWhisper(0,((((("[ERROR] httpdb returned status " + ((string)status)) + " for ") + ((string)type)) + " on ") + name));
}
db_httpdb_success(integer type,string name,integer status,string body){
    llWhisper(0,(llGetObjectName() + " has recorded details."));
}
buildDescription(integer number){
    list type_list = llGetPrimitiveParams([PRIM_TYPE]);
    list rot_list = llGetPrimitiveParams([PRIM_ROTATION]);
    list pos_list = llGetPrimitiveParams([PRIM_POSITION]);
    list size_list = llGetPrimitiveParams([PRIM_SIZE]);
    (name_str = (((string)llGetKey()) + "/"));
    (value_str = (((((((((((((((("\n<prim\n    name=" + llGetObjectName()) + ",\n    key=") + ((string)llGetKey())) + ",\n    linkNumber=") + ((string)number)) + ">\n<description>") + llGetObjectDesc()) + "</description>\n<property name=type>\n") + llDumpList2String(type_list,",\n")) + "\n</property>\n<property name=rotation>\n") + llDumpList2String(rot_list,",\n")) + "\n</property>\n<property name=position>\n") + llDumpList2String(pos_list,",\n")) + "\n</property>\n<property name=size>\n") + llDumpList2String(size_list,",\n")) + "\n</property>\n</prim>"));
}
default {
    link_message(integer sender_number,integer number,string message,key id) {
        if ((llSubStringIndex(message,"describe") >= 0)) {
            buildDescription(number);
            db_httpdb_save(name_str,value_str);
            if ((number != 1)) {
                llRemoveInventory(llGetScriptName());
            }
        }
    }
    http_response(key reqid,integer status,list meta,string body) {
        integer httpdb_req_index = llListFindList(db_httpdb_reqids,[reqid]);
        if ((httpdb_req_index != (-1))) {
            string name = llList2String(db_httpdb_reqids,(httpdb_req_index + 1));
            integer type = llList2Integer(db_httpdb_reqids,(httpdb_req_index + 2));
            (db_httpdb_reqids = llDeleteSubList(db_httpdb_reqids,httpdb_req_index,(httpdb_req_index + 2)));
            if (((status < 200) || (status >= 300))) {
                db_httpdb_failure(type,name,status,body);
                return;
            }
            if ((type == db_HTTPDB_LOAD)) db_httpdb_value_loaded(name,body);
            else  (db_httpdb_free_space = ((integer)body));
            db_httpdb_success(type,name,status,body);
            return;
        }
    }
}
