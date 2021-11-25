%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. авг. 2021 10:05
%%%-------------------------------------------------------------------
-module(t_stock).

-author("vladimirb").

-export_type([
    t/0
]).

-type t() :: NameOrIx :: binary() | non_neg_integer().
