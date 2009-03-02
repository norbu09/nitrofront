-module (web_index).
-include_lib ("nitrogen/include/wf.inc").
-compile(export_all).

main() -> #template { file="./wwwroot/onecolumn.html", bindings=[
  {'Group', index},
  {'Item', linklist}
]}.

title() -> "list of links".
headline() -> "List of links".

get_data() -> 
    [Key,Value] = links:get_all(),
    io:format("DEBUG: ~s -> ~s~n",[Key, Value]),
    [[{path, Key}, {dest, Value}, {postback, {data, 1}}]].

get_map() -> [{path, pathLabel@text}, {dest, destLabel@text}, {postback, myButton@postback}].

body() ->
  Data = get_data(),
  Map = get_map(),
  #h3 { text="list of mappings" },
  #table { class=tiny, rows=[
    #tablerow { cells=[
      #tableheader { text="Path" },
      #tableheader { text="Destination" },
      #tableheader { }
    ]},
    #bind { id=tableBinding, data=Data, map=Map, body=#tablerow { cells=[
      #tablecell { id=pathLabel },
      #tablecell { id=destLabel },
      #tablecell { body=#button { id=myButton, text="Button" } }
    ]}}
  ]}.




event(_) -> ok.
