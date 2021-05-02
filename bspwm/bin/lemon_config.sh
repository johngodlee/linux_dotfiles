#! /bin/sh

num_mon=$(bspc query -M | wc -l)
PAD=" "
SEP="|"


while read -r line ; do
  case $line in
    C*)
      clock="$PAD${line#?}$PAD"
      ;;
    V*)
      volume="$PAD${line#?}$PAD$SEP"
      ;;
    B*)
      battery="$PAD${line#?}$PAD$SEP"
      ;;
    L*)
      wifi="$PAD${line#?}$PAD$SEP"
      ;;
    W*)
      wm="$PAD${line#?}$PAD$SEP"
      ;;
  esac
  printf "%s\n" "%{l}${wm}%{r}${wifi}${battery}${volume}${clock}"
done
