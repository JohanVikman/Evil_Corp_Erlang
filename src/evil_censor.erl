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
	
    
    %% [
    %%  begin 
    %% 	 lists:map(fun(BlacklistWord ++ Suffix, BlacklistWord) ->
    %% 			   lists:duplicate(length(BlacklistWord++Suffix), $X);
    %% 		      (Token, BlacklistWord) ->
    %% 			   Token
    %% 		   end,
    %% 		   Tokens) 
    %%  end 
    %%  || 
    %% 	Token <- Tokens].


%% CensorBar =  lists:duplicate(length(BlacklistWord),$X),
%% re:replace(SentenceAcc, BlacklistWord, CensorBar, [global,{return,list}]).
