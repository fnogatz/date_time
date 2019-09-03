:- use_module(library(date_time)).

term_expansion(Query -> Result, (Head :- Test)) :-
   format(atom(Head), '~w -> ~w', [Query, Result]),
   Test = (
      call(Query),
      call(Result),
      !
   ),
   tap:register_test(Head).

:- use_module(library(tap)).

% Real tests go here

date_compare(date(2002,1,15), X, date(2002,2,24)) ->
   X = (<).
date_compare(date(2002,1,15), =<, date(2002,2,24)) ->
   true.

date_add(date(2002,1,15), [1 months, 2 days], D) ->
   D = date(2002, 2, 17).
date_add(date(2002,1,15), [1 years, 1 months, 15 days], D) ->
   D = date(2003, 3, 2).
date_add(date(2002,1,31), 1 months, X) ->
   X = date(2002, 2, 28).
date_add(date(2002,2,28), 1 months, X) ->
   X = date(2002, 3, 31).

date_difference(date(2002,3,2), date(2002,1,15), D) ->
   D = [0 years, 1 months, 15 days].
date_difference(date(2002,2,28), date(2002,1,31), X) ->
   X = [0 years, 1 months, 0 days].

date_string(D, F, "24 Feb 1946") ->
   D = date(1946, 2, 24),
   F = 'd mon y'.
date_string(D, F, "February 24, 1946") ->
   D = date(1946, 2, 24),
   F = 'month d, y'.
date_string(date(1946,2,24), 'month d, y', X) ->
   X = "February 24, 1946".
date_string(D, 'd/m/y', "24/2/1946") ->
   D = date(1946, 2, 24).
date_string(date(1946,2,24), F, X) ->
   F = 'y/m/d',
   X = "1946/2/24".

time_string(time(2,33,15), X) ->
   X = "2:33:15".
time_string(T, "2:33:22") ->
   T = time(2, 33, 22).

date_get(today, _).
date_get(yesterday, _).
date_get(tomorrow, _).
date_get(last_week, _).
date_get(next_week, _).
date_get(last_month, _).
date_get(next_month, _).
date_get(last_year, _).
date_get(next_year, _).
