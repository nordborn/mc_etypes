%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% Item with 'minimal details', usually available from listings, fast scraping
%%% @end
%%% Created : 24. май 2021 9:49
%%%-------------------------------------------------------------------
-module(t_item_min).

-author("vladimirb").

% BUILDERS/GETTERS/SETTERS
-export([
    new/2,
    get_id/1,
    get_details/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    id := t_item_id:t(),
    details := t_item_details_min:t()
}.

%%%===================================================================
%%% PUBLIC
%%%===================================================================

%% == BUILDERS ==

-spec new(t_item_id:t(), t_item_details_min:t()) -> t().
new(ItemId, ItemDetails) ->
    #{
        id => ItemId,
        details => ItemDetails
    }.

%% == GETTERS/SETTERS ==

-spec get_id(t()) -> t_item_id:t().
get_id(#{id := Id}) -> Id.

-spec get_details(t()) -> t_item_details_min:t().
get_details(#{details := D}) -> D.
