-module(evil_censor_tests).

-include_lib("eunit/include/eunit.hrl").

censor_test() ->
    ?assertEqual("", evil_censor:text([])).

censor_text_includes_no_evil_word_test() ->
    ?assertEqual("You are person", evil_censor:text("You are person")).

greedy_censor_text_with_replacements__test() ->
    ?assertEqual("Thoughtcrime is ungood, a gooder thing to do, is to crimestop.", evil_censor:text("Objection is bad, a better thing to do, is to agree.")).
