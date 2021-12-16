%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. июль 2021 12:58
%%%-------------------------------------------------------------------
-module(t_cat_id).

-author("vladimirb").

-export([
    new/2,
    verify/1,
    get_market/1,
    get_cat_mkt_id/1
]).

-export_type([
    t/0,
    cat_mkt_id/0
]).

-type cat_mkt_id() :: integer() | binary().
-type t() :: {c, t_market:t(), cat_mkt_id()}.

-spec new(t_market:t(), cat_mkt_id()) -> t().
new(Market, CatMktId) ->
    {c, Market, CatMktId}.

-spec verify(t()) -> ok.
verify({c, _, _}) -> ok.

%% GETTERS / SETTERS

-spec get_market(t()) -> t_market:t().
get_market({c, Market, _}) -> Market.

-spec get_cat_mkt_id(t()) -> cat_mkt_id().
get_cat_mkt_id({c, _, CatMktId}) -> CatMktId.

-spec to_bin(t()) -> binary().
to_bin({c, Mkt, CatMktId}) when is_integer(CatMktId) ->
    to_bin({c, Mkt, integer_to_binary(CatMktId)});
to_bin({c, Mkt, CatMktId}) when is_binary(CatMktId)->
    <<"cat_", (t_market:to_binchar(Mkt))/binary, $_, CatMktId/binary>>.
