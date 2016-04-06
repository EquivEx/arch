#!/bin/sh


# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

#Set text editor
export EDITOR=/bin/vim
export TERM=/bin/urxvtc -bl
# MPD daemon start 
#[ ! -s ~/.mpd/pid ] && mpd

asoundconf set-default-card Device

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/TTF
fc-cache -rv &
xset fp rehash
xset s 5400 5400

xsetroot -cursor_name left_ptr &
#unclutter -noevents -root &

#Update .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#Start xcompmgr
#compton --opengl --vsync opengl-swc --paint-on-overlay -b

#Wallpaper script
#wallpaper.sh &

#Make Right Alt Key Windows key
#xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
#xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group

#URxvt-Daemon
urxvtd &

#Start udiskie
udiskie &

#Turn Numlock On
numlockx &
#exec bspwm
exec openbox-session
