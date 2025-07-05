#!/bin/sh

source "$CONFIG_DIR/colors.sh"

update_icons() {
  m=$1
  sid=$2

  apps=$(aerospace list-windows --monitor "$m" --workspace "$sid" \
  | awk -F '|' '{gsub(/^ *| *$/, "", $2); if (!seen[$2]++) print $2}' \
  | sort)

  icon_strip=""
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icons.sh "$app")"
    done <<<"${apps}"
  else 
    icon_strip=" —"
  fi

  sketchybar --set space.$sid label="$icon_strip"
}

# Get the focused workspace
focused_workspace=$(aerospace list-workspaces --focused)

# Get monitor list and count
monitor_list=$(aerospace list-monitors | awk '{print $1}')
monitor_count=$(echo "$monitor_list" | wc -l)

# Update all workspaces
for m in $monitor_list; do
  for sid in $(aerospace list-workspaces --monitor $m); do
    # Check if workspace has apps
    apps_count=$(aerospace list-windows --monitor "$m" --workspace "$sid" | wc -l)
    
    # Swap display IDs for dual monitor setup
    display_id=$m
    if [ "$monitor_count" -eq 2 ]; then
      display_id=$((3 - m))  # Swaps 1->2, 2->1
    fi
    
    if [ "${apps_count}" -gt 0 ] || [ "$sid" = "$focused_workspace" ]; then
      # Update icons and show workspace
      update_icons "$m" "$sid"
      sketchybar --set space.$sid display=$display_id
    else
      # Hide empty non-focused workspaces
      sketchybar --set space.$sid display=0
    fi
  done
done

# Update focused workspace appearance
sketchybar --set space.$focused_workspace background.drawing=on \
  background.color=$ACCENT_COLOR \
  label.color=$ITEM_COLOR \
  icon.color=$ITEM_COLOR

# Update all non-focused workspaces appearance
for m in $monitor_list; do
  for sid in $(aerospace list-workspaces --monitor $m); do
    if [ "$sid" != "$focused_workspace" ]; then
      sketchybar --set space.$sid background.drawing=off \
        label.color=$ACCENT_COLOR \
        icon.color=$ACCENT_COLOR
    fi
  done
done
