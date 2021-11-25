%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. май 2021 9:49
%%%-------------------------------------------------------------------
-module(t_item).

-author("vladimirb").

% BUILDERS/GETTERS/SETTERS
-export([
    new/2,
    update/3,
    get_id/1,
    get_details/1
]).

% DB_API
-export([
    fields/0,
    rec/0
]).

-export_type([
    t/0
]).

-define('REC', item).

-record(item, {
    id :: t_item_id:t(),
    %% ymd of full-item-scraping dates, 20210406
    details_hist :: [my_calendar:date_ymd_int()],
    details :: t_item_details:t()
}).

-type t() :: #item{}.

rec() -> ?REC.

fields() -> record_info(fields, ?REC).

%%%===================================================================
%%% PUBLIC
%%%===================================================================

%% == BUILDERS ==

-spec new(t_item_id:t(), t_item_details:t()) -> t().
new(ItemId, ItemDetails) ->
    #item{
        id = ItemId,
        details_hist = [],
        details = ItemDetails
    }.

%% @doc none means "don't update, keep as is"
-spec update(t_item:t(), t_item_details:t() | none, my_calendar:date_ymd_int() | none) -> t().
update(I, none, none) ->
    I;
update(ItemPrev, ItemDetails, none) ->
    ItemPrev#item{
        details = ItemDetails
    };
update(ItemPrev = #item{details_hist = DetailsHist}, none, DetailsHistNewAt) ->
    ItemPrev#item{
        details_hist = [DetailsHistNewAt | DetailsHist]
    };
update(#item{id = Id, details_hist = DetailsHist}, ItemDetails, DetailsHistNewAt) ->
    #item{
        id = Id,
        details = ItemDetails,
        details_hist = [DetailsHistNewAt | DetailsHist]
    }.

%% == GETTERS/SETTERS ==

-spec get_id(t()) -> t_item_id:t().
get_id(#item{id = Id}) -> Id.

-spec get_details(t()) -> t_item_details:t().
get_details(#item{details = D}) -> D.
