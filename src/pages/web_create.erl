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
  #link {class=tiny, text="back to list", url="/web/index"},
  #p{},
  #label { text="Path: " },
  #textbox { id=path, text="/new/path" },
  #label { text=" Destination: " },
  #textbox { id=dest, text="http://new.destinati.on/" },
  #p{},
  #button { text="save", postback=button_pressed }
].
	
event(button_pressed) -> 
  Path=wf:q(path),
  Dest=wf:q(dest),
  links:create_mapping(Path, Dest),
  wf:flash(wf:f("record saved: ~s -> ~s",[Path,Dest]));

event(_) -> ok.

