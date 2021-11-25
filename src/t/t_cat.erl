%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. май 2021 9:49
%%%-------------------------------------------------------------------
-module(t_cat).

-author("vladimirb").

% BUILDERS/GETTERS/SETTERS

-export([
    new/2,
    get_id/1,
    get_details/1,
    get_upd/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    id := t_cat_id:t(),
    details := t_cat_details:t(),
    upd := calendar:datetime()
}.

%%%===================================================================
%%% PUBLIC
%%%===================================================================

%% == BUILDERS ==

-spec new(t_cat_id:t(), t_cat_details:t()) -> t().
new(CatId, CatDetails) ->
    #{
        id => CatId,
        details => CatDetails,
        upd => my_calendar:now_utc()
    }.

%% == GETTERS/SETTERS ==

-spec get_id(t()) -> t_cat_id:t().
get_id(#{id := Id}) -> Id.

-spec get_details(t()) -> t_cat_details:t().
get_details(#{details := Data}) -> Data.

get_upd(#{upd := Upd}) -> Upd.
