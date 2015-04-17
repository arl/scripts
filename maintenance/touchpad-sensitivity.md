#modify touchpad sensitivity#
credits to http://superuser.com/questions/229839/reduce-laptop-touch-pad-sensitivity-in-ubuntu

First you need to get the exact name of your touchpad device
list all input devices
```xinput list | egrep -i 'touch|pad'```
if you are lucky ;-) , or
```xinput list```

List properties of the device, in our case 'ETPS/2 Elantech Touchpad'
```xinput list-props 'ETPS/2 Elantech Touchpad' | grep -i finger```

Before modifying anything
**SAVE YOUR ORIGINAL VALUES**
These are mines : 
- Synaptics Finger (267): 1, 1, 0
- Synaptics Two-Finger Pressure (273):    282
- Synaptics Two-Finger Width (274):       7
- Synaptics Two-Finger Scrolling (277):   1, 1

From the three values in *Synaptics Finger* :
- the first parameter controls release pressure, 
- by increasing the second parameter, you require more finger pressure for the trackpad to respond.
- the third is to detect a button press (I think).

Use xinput to change the sensityvity
```xinput set-prop 'ETPS/2 Elantech Touchpad' 'Synaptics Finger'  1, 20, 0```
