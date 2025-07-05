#!/bin/bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item aerospace_dummy left \
  --set aerospace_dummy display=0 \
  script="$PLUGIN_DIR/spaces.sh" \
  --subscribe aerospace_dummy aerospace_workspace_change

monitor_count=$(aerospace list-monitors | wc -l)

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for sid in $(aerospace list-workspaces --monitor $m); do
    # Swap display IDs for dual monitor setup
    display_id=$m
    if [ "$monitor_count" -eq 2 ]; then
      display_id=$((3 - m)) # Swaps 1->2, 2->1
    fi

    sketchybar --add space space.$sid left \
      --set space.$sid space=$sid \
      icon=$sid \
      background.color=$TRANSPARENT \
      label.color=$ACCENT_COLOR \
      icon.color=$ACCENT_COLOR \
      display=$display_id \
      label.font="sketchybar-app-font:Regular:14.0" \
      icon.font="VictorMono Nerd Font:Semibold:12.0" \
      label.padding_right=10 \
      label.y_offset=-1 \
      click_script="$PLUGIN_DIR/space_click.sh $sid"

    # Initialize with app icons
    apps=$(aerospace list-windows --monitor "$m" --workspace "$sid" |
      awk -F '|' '{gsub(/^ *| *$/, "", $2); if (!seen[$2]++) print $2}')

    icon_strip=""
    if [ "${apps}" != "" ]; then
      while read -r app; do
        icon_strip+=" $($PLUGIN_DIR/icons.sh "$app")"
      done <<<"${apps}"
      sketchybar --set space.$sid label="$icon_strip"
    else
      # Hide empty workspaces initially
      sketchybar --set space.$sid display=0
    fi
  done
done

# Set initial focus (this will be updated by the plugin)
for focus in $(aerospace list-workspaces --focused); do
  sketchybar --set space.$focus background.drawing=on \
    background.color=$ACCENT_COLOR \
    label.color=$ITEM_COLOR \
    icon.color=$ITEM_COLOR
done
