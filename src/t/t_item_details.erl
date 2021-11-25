%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. июль 2021 13:28
%%%-------------------------------------------------------------------
-module(t_item_details).

-author("vladimirb").

-export([
    from_map/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    name := binary(),
    img_paths := [binary()],
    descr := binary(),
    brand_id := binary() | none,
    brand_name := binary() | none,
    price_initial := integer(),
    price := integer(),
    n_ordered := integer() | none,
    n_ordered_approx := integer() | none,
    discount_percent := integer() | none,
    stocks := [t_stock:t()],
    is_sold_out := boolean() | none,
    rating := float() | none,
    n_feedbacks := non_neg_integer() | none,
    upd := calendar:datetime(),
    upd_ts := non_neg_integer()
}.

-spec from_map(map()) -> t().
from_map(
    M = #{
        name := _,
        img_paths := _,
        descr := _,
        brand_id := _,
        brand_name := _,
        price_initial := _,
        price := _,
        n_ordered := _,
        n_ordered_approx := _,
        discount_percent := _,
        stocks := _,
        is_sold_out := _,
        rating := _,
        n_feedbacks := _,
        upd := _,
        upd_ts := _
    }
) ->
    M.
