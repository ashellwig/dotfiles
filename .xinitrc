#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# --- Default ---
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# --- User Configuration ---
### Autostart ###
## System
# Update Systemd
dbus-update-activation-environment '--sytemd' '--all' &
# Audio
start-pulseaudio-x11 &
([ ! -s "${HOME}/.config/mpd/pid" ] && mpd) &
## Appearence
# Composite Manager
compton '-b' &
# Wallpaper
nitrogen '--restore' &
# Screensaver
xscreensaver &
# Widgets (Conky)
$(conky --config=$HOME/.config/conky/conky.conf) &
# -- Window Manager --
# i3 (Debugging, Logs Output)
 #exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
# i3 (Normal)
exec i3