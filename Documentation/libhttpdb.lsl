// LSL script generated: Mon Feb  1 21:55:10 PST 2016
string HTTPDB_URL = "http://w-hat.com/httpdb/";
integer HTTPDB_SAVE = 1000;
integer HTTPDB_LOAD = 1100;
integer HTTPDB_DELETE = 1200;
integer HTTPDB_VALUE_LOADED = 5000;
integer HTTPDB_FAILURE = 5100;
integer HTTPDB_SUCCESS = 5200;
list httpdb_reqids = [];
integer httpdb_free_space = -1;
httpdb_request(integer type,string type_str,string name,string body){
    key reqid = llHTTPRequest((HTTPDB_URL + name),[HTTP_METHOD,type_str],body);
    if ((reqid == NULL_KEY)) httpdb_failure(type,name,0,"HTTP throttled");
    else  (httpdb_reqids += [reqid,name,type]);
}
httpdb_save(string name,string value){
    httpdb_request(HTTPDB_SAVE,"PUT",name,value);
}
httpdb_load(string name){
    httpdb_request(HTTPDB_LOAD,"GET",name,"");
}
httpdb_delete(string name){
    httpdb_request(HTTPDB_DELETE,"DELETE",name,"");
}
httpdb_value_loaded(string name,string value){
    llMessageLinked(LINK_SET,HTTPDB_VALUE_LOADED,value,name);
}
httpdb_failure(integer type,string name,integer status,string body){
    llOwnerSay(((((("[ERROR] httpdb returned status " + ((string)status)) + " for ") + ((string)type)) + " on ") + name));
    llMessageLinked(LINK_SET,HTTPDB_FAILURE,llList2CSV([type,status,body]),name);
}
httpdb_success(integer type,string name,integer status,string body){
    llMessageLinked(LINK_SET,HTTPDB_SUCCESS,llList2CSV([type,status,body]),name);
}
default {
    link_message(integer sender,integer num,string str,key id) {
        if ((num == HTTPDB_SAVE)) httpdb_save(((string)id),str);
        else  if ((num == HTTPDB_LOAD)) httpdb_load(((string)id));
        else  if ((num == HTTPDB_DELETE)) httpdb_delete(((string)id));
    }
    http_response(key reqid,integer status,list meta,string body) {
        integer httpdb_req_index = llListFindList(httpdb_reqids,[reqid]);
        if ((httpdb_req_index != (-1))) {
            string name = llList2String(httpdb_reqids,(httpdb_req_index + 1));
            integer type = llList2Integer(httpdb_reqids,(httpdb_req_index + 2));
            (httpdb_reqids = llDeleteSubList(httpdb_reqids,httpdb_req_index,(httpdb_req_index + 2)));
            if (((status < 200) || (status >= 300))) {
                httpdb_failure(type,name,status,body);
                return;
            }
            if ((type == HTTPDB_LOAD)) httpdb_value_loaded(name,body);
            else  (httpdb_free_space = ((integer)body));
            httpdb_success(type,name,status,body);
            return;
        }
    }
}
