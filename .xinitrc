#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# -- User Configuration --
### Autostart ###
## System
## Polkit Agent
if [[ -e '/usr/bin/lxqt-policykit-agent' ]]; then
  /usr/bin/lxqt-policykit-agent &
fi
# Keybindings
#if [[ $(command -v xbindkeys) ]]; then
  xbindkeys
#fi
# Input
export GTK_IM_MODULE
export QT_IM_MODULE
export XMODIFIERS=@im='ibus'
ibus-daemon '-drx' &
# Notifications
dunst &
# Disk management
udiskie '--no-automount --tray' &
# Audio
start-pulseaudio-x11 &
if [[ $(command -v start-pulse-audio-x11) ]]; then
  start-pulseaudio-x11 &
fi

#if [[ $(command -v mpd) ]]; then
#  [ ! -s ~/.config/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf &
#fi
## Appearence
# Composite Manager
if [[ $(command -v compton) ]] || [[ $(command -v picom) ]]; then
  picom -b &
fi
# Wallpaper
if [[ $(command -v nitrogen) ]]; then
  # Set wallpaper profile to "hentai" for 2 monitors or "ichigo" for 3 montitors
  export xinit_wallpaper_setting='ichigo'
  # export xinit_wallpaper_setting='hentai'
  rm -rf ~/.config/nitrogen/bg-saved.cfg
  if [[ $xinit_wallpaper_setting == 'ichigo' ]]; then
    cp \
      ~/.config/nitrogen/bg-saved_3-monitor_ichigo.cfg.bak \
      ~/.config/nitrogen/bg-saved.cfg
  elif [[ $xinit_wallpaper_setting == 'hentai' ]]; then
    cp \
      ~/.config/nitrogen/bg-saved_2-monitor_hentai.cfg.bak \
      ~/.config/nitrogen/bg-saved.cfg
  fi
  nitrogen '--restore' &
fi
if [[ $(command -v streamdeck) ]]; then
  streamdeck &
fi
# Screensaver
#xscreensaver &
xset s off &
xset -dpms &
# Widgets (Conky)
conky '--config=\"${HOME}/.config/conky/conky.conf\"' '-b' &


# -- Window Manager --
# i3 (Debugging, Logs Output)
 #exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
# i3 (Normal)
exec i3

