# Date Time Library

The Date Time Library contains predicates that perform logical arithmetic on dates and times. It is an adapted version of [the original `date_time` library](https://github.com/AmziLS/apls/blob/master/libs/date_time.pro) that is part of [Amzi! Core Components](https://github.com/AmziLS/apls) by [Amzi! inc.](http://www.amzi.com/), to be compatible with [SWI-Prolog](http://www.swi-prolog.org/)'s module system.

The library uses three structures: `date/3`, `time/3` and `datetime/6`. Predicates are provided for dealing with each. The structure arguments are:

```prolog
date(Year,Month,Day)
time(Hour,Minutes,Seconds)
datetime(Year,Month,Day,Hour,Minutes,Seconds)
```

The various predicates try to do the correct thing when overflowing the various quantities, like taking into account the number of days in February when adding, say, 15 days to Feb 20th. The result will be a different day in March depending on whether the year is a leap year or not.

The predicates also recognize the last day of each month as a special case. So if you add a month to a date which is the last day of a month, you get the last day of the next month.

The structures represent absolute dates and times. Relative date/time quantities are represented by structures for each unit, with one argument which is the value. These structures are: `years/1`, `months/1`, `weeks/1`, `days/1`, `hours/1`, `mins/1`, and `secs/1`.

Each is defined as a postfix operator as well. So you can ask for example:

```prolog
?- date_add(date(2002,1,15), 2 weeks, X).
X = date(2002,1,29)
yes
```

The library includes predicates to parse and create date and time strings.

To use the library, either consult or load the date_time file, or include it in your Prolog project. Then import it. For example, from the listener:

```prolog
?- load(date_time).
yes
?- import(date_time).
yes
```
