-module(evil_censor).

-export([text/1
        ]).


-define(WORD_REPLACEMENT, [{"bad", "ungood"},
                           {"better", "gooder"},
                           {"objection","thoughtcrime"},
                           {"Objection","Thoughtcrime"},
                           {"agree","crimestop"}]).


text(Sentence) ->
    lists:foldr(fun({SearchedToken, Replacement},AccIn) ->
                        re:replace(AccIn,SearchedToken, Replacement, [{return,list}])
                end,
                Sentence, 
                ?WORD_REPLACEMENT).
