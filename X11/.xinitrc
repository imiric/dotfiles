XKB=/home/ivan/.files/X11/xkb
xkbcomp -I$XKB $XKB/keymap/us-intl-gajscript-mod3 $DISPLAY

xsetroot -cursor_name left_ptr

/usr/bin/xscreensaver -no-splash &

/usr/bin/urxvtd -q -o -f

feh --bg-fill /usr/share/backgrounds/Maraetaibeforesunrise.jpg

compton -CGb

#exec qtile -l WARNING
#exec subtle
#exec ck-launch-session dbus-launch wmfs
exec herbstluftwm

#(conky -q -c ~/.config/wmfs/conkyrc | while true; read line; do wmfs -c status "default $line"; done) &

#exec wmfs


wmname LG3D  # fix Java apps
