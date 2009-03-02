-module (web_create).
-include_lib ("nitrogen/include/wf.inc").
-compile(export_all).

main() -> #template { file="./wwwroot/onecolumn.html", bindings=[
  {'Group', index},
  {'Item', create}
]}.

title() -> "create a new mapping".
headline() -> "Map a new path to a destination".

body() -> [
  #p{},
  #label { text="Path: " },
  #inplace_textbox { text="/new/path" },
  #label { text=" Destination: " },
  #inplace_textbox { text="http://new.destinati.on/" },
  #button { text="save", postback=button_pressed }
].
	
event(button_pressed) -> 
  wf:flash("record saved");

event(_) -> ok.

inplace_textbox_event(_Tag, Value) ->
  Value.
