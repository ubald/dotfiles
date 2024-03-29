# Linux configuration

# set -Ux PYENV_ROOT $HOME/.pyenv
# set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# set -xg PATH "/home/ubald/.pyenv/bin" $PATH
# status --is-interactive; and pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  pyenv init - | source"\nfi' >> ~/.bash_profile


alias capslock="python3 -c 'from ctypes import *; X11 = cdll.LoadLibrary(\"libX11.so.6\"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'"

# Resets all of the USB devices, useful on the work ThinkPad that freezes the bus when connecting the USB-C hub 
alias resetusb="sudo find /sys/bus/usb/devices/*/authorized -exec sh -c 'echo 0 > \${0}; echo 1 > \${0}' {} \;"

# OBS needs a reset once in a while to restart the webcam
alias resetobs="sudo modprobe -r v4l2loopback"