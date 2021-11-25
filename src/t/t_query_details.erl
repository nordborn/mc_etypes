%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. июль 2021 0:47
%%%-------------------------------------------------------------------
-module(t_query_details).

-author("vladimirb").

-export([
    from_map/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    text := binary(),
    total_pages := non_neg_integer(),
    total_items := non_neg_integer()
}.

-spec from_map(map()) -> t().
from_map(M = #{text := T, total_pages := P, total_items := I}) when
    is_binary(T) andalso P >= 0 andalso I >= 0
->
    M.
