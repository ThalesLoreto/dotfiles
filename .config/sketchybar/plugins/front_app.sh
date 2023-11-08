#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5

case $INFO in
"System Settings")
    ICON=
    ;;
"Emacs")
    ICON=
    ;;
"Activity Monitor")
    ICON=󰨇
    ;;
"Arc")
    ICON_PADDING_RIGHT=5
    ICON=󰞍
    ;;
"Code")
    ICON_PADDING_RIGHT=4
    ICON=󰨞
    ;;
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Discord")
    ICON=󰙯
    ;;
"Discord PTB")
    ICON=󰙯
    ;;
"FaceTime")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Finder")
    ICON=󰀶
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"IINA")
    ICON_PADDING_RIGHT=4
    ICON=󰕼
    ;;
"kitty")
    ICON=󰄛
    ;;
"iTerm2")
    ICON=
    ;;
"Alacritty")
    ICON=
    ;;
"Brave Browser")
    ICON=
    ;;
"Messages")
    ICON=󰍦
    ;;
"Notion")
    ICON_PADDING_RIGHT=6
    ICON=󰈄
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"PS Remote Play")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Spotify")
    ICON=
    ;;
"WhatsApp")
    ICON=󰍥
    ;;
"TextEdit")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Transmission")
    ICON_PADDING_RIGHT=3
    ICON=󰶘
    ;;
*)
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
