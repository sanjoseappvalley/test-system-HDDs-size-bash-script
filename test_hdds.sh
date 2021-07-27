#!/bin/bash

first_dirs=("/dev/hdd" "/dev/hdd1" "/dev/hdd2" "/dev/hdd3" "/dev/hdd4" "/dev/hdd5" "/dev/hdd6" "/dev/hdd7" "/dev/hdd8" "/dev/hdd9" "/dev/hdd10" "/dev/hdd11")

second_dirs=("/dev/hdd12" "/dev/hdd13" "/dev/hdd14" "/dev/hdd15" "/dev/hdd16" "/dev/hdd17" "/dev/hdd18" "/dev/hdd19" "/dev/hdd20" "/dev/hdd21" "/dev/hdd22" "/dev/hdd23")

for dd in "${first_dirs[@]}"; do
  mapfile -t -O "${#hdds1[@]}" hdds1 < <(df --output=size -h $dd | sed '1d;s/[^0-9]//g')
done

for dd in "${second_dirs[@]}"; do
  mapfile -t -O "${#hdds2[@]}" hdds2 < <(df --output=size -h $dd | sed '1d;s/[^0-9]//g')
done


echo "0-11 HDDs should be 931 GB"
for disk in "${hdds1[@]}"; do
    if [ $disk -eq 931 ]; then
      echo "Correct size $disk GB"
    else
      echo "ERROR! Wrong size $disk GB"
    fi
done


echo
echo "12-23 HDDs should be 1862 GB"
for disk in "${hdds2[@]}"; do
    if [ $disk -eq 1862 ]; then
      echo "Correct size $disk GB"
    else
      echo "ERROR! Wrong size $disk GB"
    fi
done
