#! /bin/sh

num_mon=$(bspc query -M | wc -l)
PADDING=" "
SEP="|"

while read -r line ; do
  case $line in
    C*)
      clock="$PADDING${line#?}$PADDING"
      ;;
    B*)
      battery="$PADDING${line#?}$PADDING"
      ;;
    V*)
      volume="$PADDING${line#?}$PADDING"
      ;;
    L*)
      wifi="$PADDING${line#?}$PADDING"
      ;;
  esac
  printf "%s\n" "%{l}%{r}${wifi}${battery}${volume}${clock}"
done
