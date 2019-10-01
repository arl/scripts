#!/usr/bin/env perl
## uncolor — remove terminal escape sequences such as color changes
while (<>) {
    s/ \e[ #%()*+\-.\/]. |
       \e\[ [ -?]* [@-~] | # CSI ... Cmd
       \e\] .*? (?:\e\\|[\a\x9c]) | # OSC ... (ST|BEL)
       \e[P^_] .*? (?:\e\\|\x9c) | # (DCS|PM|APC) ... ST
       \e. //xg;
    print;
}
