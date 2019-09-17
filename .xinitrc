#!/bin/sh

# --- Variables ---

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# --- System Files ---

# Xresources
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# System Keyboard Map
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi


# --- User Files ---

# Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# User Keymap
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Drop-In Configs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# --- User Configuration ---
### Autostart ###
## System
## Polkit Agent
/usr/bin/lxqt-policykit-agent & Keybindings
xbindkeys
# Notifications, Disk management
udiskie '-Ant2' &
# Audio
start-pulseaudio-x11 &
[ ! -s ~/.config/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf &
## Appearence
# Composite Manager
compton '-b' &
# Wallpaper
nitrogen '--restore' &

# Screensaver
#xscreensaver &
# Widgets (Conky)
#conky '--config=\"${HOME}/.config/conky/conky.conf\"' '-b' &


# -- Window Manager --
# i3 (Debugging, Logs Output)
 #exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
# i3 (Normal)
exec i3
