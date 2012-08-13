xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput --set-prop --type=int --format=8 10 "Synaptics Off" 1
exec /usr/bin/awesome
