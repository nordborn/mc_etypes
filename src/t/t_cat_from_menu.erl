%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. май 2021 9:49
%%%-------------------------------------------------------------------
-module(t_cat_from_menu).

-author("vladimirb").

-export([
    from_map/1,
    get_market/1,
    get_path/1,
    get_id/1,
    get_parent_id/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    id := t_cat_id:t(),
    name := binary(),
    path := binary(),
    parent_id := t_cat_id:t() | none,
    upd := calendar:datetime()
}.

-spec from_map(map()) -> t().
from_map(
    #{
        id := _,
        name := _,
        path := _,
        parent_id := _,
        upd := _
    } = M
) ->
    M.

-spec get_market(t()) -> t_market:t().
get_market(#{id := {c, Market, _CatMktId}}) -> Market.

-spec get_path(t()) -> binary().
get_path(#{path := Path}) -> Path.

-spec get_id(t()) -> t_cat_id:t().
get_id(#{id := CatId}) -> CatId.

-spec get_parent_id(t()) -> t_cat_id:t() | none.
get_parent_id(#{parent_id := ParentId}) -> ParentId.
