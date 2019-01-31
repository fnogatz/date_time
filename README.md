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

## Installation

This pack is available from the [add-on registry of SWI-Prolog](http://www.swi-prolog.org/pack/list).

It can be installed with `pack_install/1`:

```prolog
?- pack_install(date_time).
```

Then, you can use it by simply calling `use_module(library(date_time))`.

## Requirements

Only for development purposes the [`tap` pack](http://www.swi-prolog.org/pack/list?p=tap) is needed:

```prolog
?- pack_install(tap).
```

## Provided Predicates

```prolog
date_get/2,             % get a date for today, tomorrow, etc.
date_create/4,          % create a new date structure
date_extract/2,         % extract date fields from a date structure
date_age/2,             % compute an age from a birthday
date_compare/3,         % compare two dates
date_add/3,             % add years/months/weeks/days to a date
date_difference/3,      % find the difference between two dates
date_interval/3,        % find difference in single interval type (year, month, etc.)
date_string/3,          % convert between date structures and strings
date_year_day/2,        % calculate the day number for the year
date_1900_days/2,       % calculate the days since the 0th day of 1900
is_date_expression/1,   % succeeds if expression is a special date expression
is_date_interval/1,     % succeeds if expression is a date interval
is_date/1,              % succeeds if expression is a date
time_get/2,             % gets the current time
time_compare/3,         % compares two times
time_add/3,             % add hours/mins/secs to a time
time_difference/3,      % find the difference between two times
time_interval/3,        % find the difference in single interval type(hour, min, sec)
time_string/2,          % convert between time structures and strings
datetime_get/2,         % get the current date and time
datetime_compare/3,     % compare two datetime structures
datetime_add/3,         % add datetime quantities to a datetime
datetime_difference/3,  % find the difference between two datetimes
datetime_string/3,      % convert to/from datetime strings
datetime_date_time/3,   % convert datetime to/from date and time structures
datetime_extract/2,     % extract years, months etc. from date time structure
is_datetime_interval/1, % succeeds if expression is a date or time interval
is_datetime/1,          % succeeds if expression is a datetime
week_dayn/2,            % returns number for day of the week, 0 = Monday, 1 = Tuesday, ...
week_day/2,             % returns the day of the week for a date or datetime
```

For further details have a look at the [implementation](prolog/date_time.pl), it is well documented. In addition, the [defined tests](test/test.pl) might give an impression on how to use this library. 
