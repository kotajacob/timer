timer(1) [""["timer-VERSION"]]

# NAME

timer - A basic countdown timer.

# SYNOPSIS

*timer* _DURATION_

# DESCRIPTION
Pause for DURATION which displaying a countdown. Two different formats are
acceptable for DURATION.

1. A sequence of decimal numbers, each with optional fraction and a unit suffix,
such as "300ms", "1.5h" or "2h45m". Valid time units are "ns", "us" (or "µs"),
"ms", "s", "m", "h".

2. A kitchen time format like "3:04PM" or "15:04". The timer will complete at
the next occurence of the specified time.

# AUTHORS

Maintained by Dakota Walsh <kota at nilsu.org>.
Up-to-date sources can be found at https://git.sr.ht/~kota/timer/

# COPYRIGHT

Copyright 2022 Dakota Walsh

License GPLv3+ GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it. There is NO
WARRANTY, to the extent permitted by law.
