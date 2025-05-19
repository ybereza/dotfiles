date_formatted=$(date "+%a %F %H:%M")

audio_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | rg -o '\d+%' | head -n 1)

network=$(nmcli | head -n1 | awk '{print $4}')

addr=$(host $(hostname) | awk '{print $4}' | head -n 1)

layout=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name')

echo "volume: $audio_volume | $network $addr | $layout | $date_formatted"
