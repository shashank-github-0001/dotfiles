#!/usr/bin/zsh

start=1
for filename in *;
do
    mv "$filename" "$start.png"
    ((start++))
done
