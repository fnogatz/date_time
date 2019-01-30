# TAP Input/Output Test Suite

Definition of input/output tests for `library(date_time)` following the [Test Anything Protocol](http://testanything.org/) (TAP).

## Run Tests

The defined tests can be run using the following command:

```shell
swipl -q -g main -t halt -s test.pl
```

This produces a TAP compatible output like the following:

```
TAP version 13
1..4
ok 1 - date_compare(date(2002,1,15),_3368,date(2002,2,24)) -> _3368=(<)
ok 2 - date_compare(date(2002,1,15),=<,date(2002,2,24)) -> true
ok 3 - date_add(date(2002,1,15),[1 months,2 days],_3416) -> _3416=date(2002,2,17)
ok 4 - date_add(date(2002,1,15),[1 years,1 months,15 days],_3462) -> _3462=date(2003,3,2)
```

## Define Tests

Tests are defined in the `test.pl` file after the call of `:- use_module(library(tap))`.
