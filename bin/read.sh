#!/bin/sh

list() {
  for file in ~/read/*; do
    echo "$file"
  done
  for file in ~/stuff/phd/lit/*; do
    echo "$file"
  done
}

selection="$(list | dmenu -i -l 5)"

[ -z "$selection" ] || zathura "$selection"
