%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. июль 2021 0:43
%%%-------------------------------------------------------------------
-module(t_query_id).

-author("vladimirb").

-export([
    new/2,
    get_market/1
]).

-export_type([
    t/0
]).

-type query_text() :: binary().
-type t() :: {q, t_market:t(), query_text()}.

-spec new(t_market:t(), query_text()) -> t().
new(Market, QueryText) ->
    {q, Market, QueryText}.

-spec get_market(t()) -> t_market:t().
get_market({q, Market, _}) -> Market.
