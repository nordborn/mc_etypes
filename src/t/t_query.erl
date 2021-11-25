%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. июль 2021 17:40
%%%-------------------------------------------------------------------
-module(t_query).

-author("vladimirb").

-export([
    rec/0,
    fields/0,
    new/2
]).

% GETTERS / SETTERS
-export([
    from_text/2,
    get_id/1,
    get_details/1,
    get_market/1,
    get_details_text/1
]).

-record(query, {
    id :: t_query_id:t(),
    details :: t_query_details:t(),
    upd = my_calendar:now_utc() :: calendar:datetime(),
    ix1 = none :: any(),
    ix2 = none :: any()
}).

-define('REC', query).

-type t() :: #query{}.

%%%===================================================================
%%% PUBLIC
%%%===================================================================

rec() -> ?REC.

fields() -> record_info(fields, ?REC).

%% == BUILDERS ==

-spec new(t_query_id:t(), t_query_details:t()) -> t().
new(QueryId, QueryDetails) ->
    #query{
        id = QueryId,
        details = QueryDetails
    }.

-spec from_text(t_market:t(), Text :: binary()) -> t().
from_text(Market, Text) ->
    Id = t_query_id:new(Market, Text),
    #query{
        id = Id,
        details = t_query_details:from_map(#{
            text => Text,
            total_pages => 0,
            total_items => 0
        })
    }.

%% == GETTERS/SETTERS ==

-spec get_id(t()) -> t_query_id:t().
get_id(#query{id = Id}) -> Id.

-spec get_details(t()) -> t_query_details:t().
get_details(#query{details = Data}) -> Data.

-spec get_market(t()) -> t_market:t().
get_market(#query{id = {q, Market, _QueryText}}) -> Market.

-spec get_details_text(t()) -> binary().
get_details_text(#query{details = #{text := Text}}) -> Text.
