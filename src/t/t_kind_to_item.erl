-module(t_kind_to_item).

-author("vladimirb").

-export([
    from_map/1
]).

-export_type([
    t/0
]).

-type t() :: #{
    kind_id := t_kind_id:t(),
    pos := non_neg_integer(),
    item_id := t_item_id:t(),
    upd := calendar:datetime()
}.

-spec from_map(map()) -> t().
from_map(
    #{
        kind_id := _,
        item_id := _,
        pos := _,
        upd := _
    } = M
) ->
    M.
