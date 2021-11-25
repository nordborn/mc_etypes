%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. июль 2021 13:28
%%%-------------------------------------------------------------------
-module(t_item_details_min).

-author("vladimirb").

-export([
    from_map/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    name := binary(),
    img_path := binary(),
    brand_name := binary(),
    brand_id := non_neg_integer(),
    price_initial := integer(),
    price := integer(),
    discount_percent := float(),
    upd := calendar:datetime()
}.

-spec from_map(map()) -> t().
from_map(
    M = #{
        name := _,
        img_path := _,
        brand_name := _,
        brand_id := _,
        price_initial := _,
        price := _,
        discount_percent := _,
        upd := _
    }
) ->
    M.
