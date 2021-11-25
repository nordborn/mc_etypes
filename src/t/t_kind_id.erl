%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. авг. 2021 11:04
%%%-------------------------------------------------------------------
-module(t_kind_id).

-author("vladimirb").

-export_type([
    t/0
]).

-type t() :: t_cat_id:t() | t_query_id:t() | t_item_id:t().
