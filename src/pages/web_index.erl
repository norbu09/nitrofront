-module (web_index).
-include_lib ("nitrogen/include/wf.inc").
-compile(export_all).

main() -> 
	#template { file="./wwwroot/template.html"}.

title() ->
	"list of links".

body() ->
    [Key,Value] = links:get_all(),
    io:format("DEBUG: ~s -> ~s~n",[Key, Value]),
	#label{text="list of links."},
    #p{},
    #label { text=Key },
    #value { text=Value }.


	
event(_) -> ok.
