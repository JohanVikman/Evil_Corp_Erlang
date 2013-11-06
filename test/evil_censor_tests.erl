-module(evil_censor_tests).

-include_lib("eunit/include/eunit.hrl").

censor_test() ->
    ?assertEqual("", evil_censor:text([])).
    
censor_text_includes_no_evil_word_test() ->
    ?assertEqual("You are person", evil_censor:text("You are person")).
    
censor_text_includes_one_evil_word_test() ->
    ?assertEqual("You are a XXXX person", evil_censor:text("You are a nice person")).

censor_text_includes_pony_word_test() ->
    ?assertEqual("You are a XXXX", evil_censor:text("You are a pony")).

censor_text_includes_sun_test() ->
    ?assertEqual("The XXX is bright", evil_censor:text("The sun is bright")).

censor_text_includes_all_the_blacklisted_words_in_step_two_test() ->
    ?assertEqual("Such a XXXX day with a bright XXXX makes me XXXXX",
		 evil_censor:text("Such a nice day with a bright sun, makes me happy")).

greedy_censor_text_with_nice_prefix__test() ->
    ?assertEqual("You are so XXXXXXXXX", evil_censor:text("You are so friendly!")).
