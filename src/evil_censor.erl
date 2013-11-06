-module(evil_censor).

-export([text/1
	]).



-define(WORD_BLACKLIST, ["nice", "pony", "sun", "happy", "friendly"]).


text(Sentence) ->
    Tokens = string:tokens(Sentence, " "),
    CensoredTokens = lists:foldr(fun replace_word_in_string/2,	       
				 Tokens, ?WORD_BLACKLIST),
    string:join(CensoredTokens, " ").


replace_word_in_string(BlacklistWord, Tokens) ->
    lists:map(fun(Token) ->
		      case re:run(Token, BlacklistWord, [{capture,none}]) of
			  match -> 
			      lists:duplicate(length(Token), $X);
			  nomatch ->
			      Token
		      end
	      end,
	      Tokens).
