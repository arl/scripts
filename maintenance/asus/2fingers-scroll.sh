#! /bin/bash
# if the 2fingers scroll gets low, get it immediately up with:
sudo modprobe -r psmouse
sudo modprobe psmouse

# to check the values, in case it has been overrided
synclient | grep 'TwoFingerScroll'
