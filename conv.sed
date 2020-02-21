#!/usr/bin/sed -f

:start

s/$/\x1e/
G 
t check_quotes

:check_quotes
s/^"\(\([^"]\|""\)*\)"/\1\x1f/
t handle_quotes
s/^\([^,\x1e]*\)/\1\x1f/
t save_pattern

:handle_quotes
s/^\([^\x1f]*\)""/\1"/
t handle_quotes

:save_pattern
s/^\([^\x1f]*\x1f\)\([^\x1e]*\)\x1e\n\(.*\)/\3\1\x1e\2/
h
s/\x1e.*$//
x
s/^[^\x1e]*\x1e//
t prepare_next

:prepare_next
s/^,//
t start
g
s/\r\?\x1f$//

#clean hold space
x; s/.*//; x
