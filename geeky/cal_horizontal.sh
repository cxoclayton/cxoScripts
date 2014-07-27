#!/bin/bash

# Horizontal Calendar
# Version: 1.0.0
# Clayton Coleman


cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed 's/./#/g') /" | sed -e '1d' -e '2p;2p;2p;2p' | sed -e '$!N;s/\n/ /' -e '$!N;s/\n/ /' -e '$!N;s/\n/ /' -e '$!N;s/\n/ /' | sed "s/^/ /;s/$/ /;s/ $(date +%e) /\|$(date +%e)\|/" | sed -e "s/^\ \ //"
