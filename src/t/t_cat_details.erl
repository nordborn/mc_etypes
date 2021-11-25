%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. июль 2021 13:40
%%%-------------------------------------------------------------------
-module(t_cat_details).

-author("vladimirb").

-export([
    from_map/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    name := binary(),
    path := binary(),
    total_pages := non_neg_integer(),
    total_items := non_neg_integer()
}.

-spec from_map(map()) -> t().
from_map(
    M = #{
        name := _,
        path := _,
        total_pages := _,
        total_items := _
    }
) ->
    M.
