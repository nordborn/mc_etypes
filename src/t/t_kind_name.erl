%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. авг. 2021 7:28
%%%-------------------------------------------------------------------
-module(t_kind_name).

-author("vladimirb").

-export_type([
    t/0
]).

%% (c)ategory / (q)uery / (b)rand
-type t() :: c | q | b.
