# Ubuntu configuration

# Shitty QT auto scaling breaks OBS
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0

# Something about siji font
xset +fp /home/ubald/.local/share/fonts
xset +fp /home/ubald/.fonts
xset fp rehash

# Make firefox user touch input
set -xg MOZ_USE_XINPUT2 1
xsetwacom --set "Wacom Pen and multitouch sensor Finger touch" Gesture off