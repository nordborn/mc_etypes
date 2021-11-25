%%%-------------------------------------------------------------------
%%% @author vladimirb
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% Points to dates when scraping, hist contains of kinds like cats, queries, brands
%%% @end
%%% Created : 24. май 2021 9:49
%%%-------------------------------------------------------------------

-module(t_hist).

-author("vladimirb").

% BUILDERS/GETTERS/SETTERS
-export([
    new/2,
    get_kind_id/1,
    get_scraping_status/1,
    get_upd/1,
    get_scraping_status_as_binchar/1
]).

-export_type([
    t/0
]).

-record(hist, {
    kind_id :: t_kind_id:t(),
    scraping_status :: t_scraping_status:t(),
    upd :: calendar:datetime()
}).

-type t() :: #hist{}.

%% == BUILDERS ==

-spec new(t_kind_id:t(), t_scraping_status:t()) -> t().
new(KindId, ScrapingStatus) ->
    Now = my_calendar:now_utc(),
    #hist{
        kind_id = KindId,
        scraping_status = ScrapingStatus,
        upd = Now
    }.

%% == GETTERS ==

-spec get_kind_id(t()) -> t_kind_id:t().
get_kind_id(#hist{kind_id = Id}) -> Id.

-spec get_scraping_status(t()) -> t_scraping_status:t().
get_scraping_status(#hist{scraping_status = S}) -> S.

-spec get_scraping_status_as_binchar(t()) -> binary().
get_scraping_status_as_binchar(Hist) ->
    t_scraping_status:to_binchar(get_scraping_status(Hist)).

-spec get_upd(t()) -> calendar:datetime().
get_upd(#hist{upd = Upd}) -> Upd.
