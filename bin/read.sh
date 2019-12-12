#!/bin/sh

shopt -s nullglob

list() {
  for file in ~/read/*; do
    echo "$file"
  done
  for file in ~/stuff/phd/lit/*; do
    echo "$file"
  done
}

selection="$(list | bemenu -l 5 --nf '#eff0eb' --hb '#78787e' --hf '#eff0eb' --tf '#eff0eb' --ff '#57c7ff' --fn 'DejaVu Sans Mono 14' -p '')"

[ -z "$selection" ] || zathura "$selection"
