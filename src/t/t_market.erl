%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. май 2021 12:43
%%%-------------------------------------------------------------------
-module(t_market).

-author("vladimirb").

-export([
    to_binchar/1
]).

-type t() :: wild | ozon | beru | sber | lamoda.

-spec to_binchar(t()) -> binary().
to_binchar(wild) -> <<$w>>.
