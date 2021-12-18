%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. июль 2021 13:28
%%%-------------------------------------------------------------------
-module(t_item_id).

-author("vladimirb").

-export([
    new/2,
    verify/1,
    get_item_mkt_id/1,
    get_market/1,
    to_short_bin/1
]).

-export_type([
    t/0
]).

-type item_mkt_id() :: integer() | binary().
-type t() :: {i, t_market:t(), item_mkt_id()}.

-spec new(t_market:t(), item_mkt_id()) -> t().
new(Market, ItemMktId) ->
    {i, Market, ItemMktId}.

-spec verify(t()) -> ok.
verify({i, _, _}) -> ok.

%% GETTERS

-spec get_item_mkt_id(t()) -> item_mkt_id().
get_item_mkt_id({i, _, ItemMktId}) -> ItemMktId.

-spec get_market(t()) -> t_market:t().
get_market({i, Mkt, _}) -> Mkt.

-spec to_short_bin(t()) -> binary().
%% @doc bin("iw123")
to_short_bin({i, Mkt, ItemMktId}) when is_integer(ItemMktId) ->
    to_short_bin({i, Mkt, integer_to_binary(ItemMktId)});
to_short_bin({i, Mkt, ItemMktId}) when is_binary(ItemMktId)->
    <<"i", (t_market:to_binchar(Mkt))/binary, ItemMktId/binary>>.
