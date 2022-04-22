# timer

A basic countdown timer. Displays the remaining duration while counting down.

# Usage
```
timer 25s
timer 11:32AM
timer 19:20
timer 3h40m50s
```

You may like to wrap this tool in a shell script to do the following:
1. Run the timer.
2. Display a notification.
3. Unmute speakers.
4. Play a little notification sound.
5. Remute if previously muted.

I've included a script that does the following in `contrib/timer.sh`.

See `timer(1)` for more details.

# Install
```
make all
sudo make install
```

# Uninstall
```
sudo make uninstall
```

# Author
Written and maintained by Dakota Walsh.
Up-to-date sources can be found at https://git.sr.ht/~kota/timer/

# License
GNU GPL version 3 or later, see LICENSE.
Copyright 2022 Dakota Walsh
