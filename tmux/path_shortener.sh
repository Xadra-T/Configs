#!/usr/bin/env bash
#
# shorten_path.sh  <full_path>  [max_len]
#
#  ▸ Replaces /long/parent/directories with /l/p/d until the
#    resulting string is ≤ max_len (default 35).               

path="$1"
max="${2:-35}"           # default limit = 35 chars

# $HOME  →  ~   (saves a few chars and looks nicer)
[ -n "$HOME" ] && path="${path/#$HOME/~}"

# collapse from the LEFT until short enough
while [ ${#path} -gt "$max" ]; do
    # turn “/dirname/” into “/d/” for the **left-most** dirname still >1 char
    new="$(sed -E 's@/([^/])[^/]*(/|$)@/\1\2@' <<<"$path")"
    # if nothing changed we can’t squeeze it any further – break to avoid loop
    [ "$new" = "$path" ] && break
    path="$new"
done

printf '%s' "$path"
