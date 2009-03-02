-module (web_index).
-include_lib ("nitrogen/include/wf.inc").
-compile(export_all).

main() -> #template { file="./wwwroot/onecolumn.html", bindings=[
  {'Group', index},
  {'Item', linklist}
]}.

title() -> "list of links".
headline() -> "List of links".

body() ->
    [Key,Value] = links:get_all(),
    io:format("DEBUG: ~s -> ~s~n",[Key, Value]),
    #h3 { text="the links so far" },
    #p{},
    #label { text=Key },
    #value { text=Value }.

event(_) -> ok.
