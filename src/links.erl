-module(links).
-compile(export_all).

get_all() ->
    {json,{struct, Props}} = erlang_couchdb:invoke_view({"localhost", 5984}, "umleitung", "redir", "match", [{"key", "\"/\""}]),
    try  proplists:get_value(<<"rows">>, Props) of
        [{struct, Row} | _] ->
            [proplists:get_value(<<"key">>, Row),proplists:get_value(<<"value">>, Row)];
        _ -> {error, unknown}
    catch
        _:_ -> {error, unknown}
    end.

