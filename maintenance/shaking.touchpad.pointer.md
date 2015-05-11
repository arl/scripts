#shaking touchpad pointer#

If your touchpad pointer suddenly starts to seem unstable, or shaking,
even if the extremity of the finger seems immobile, try this :

Install synclient : 
```sudo apt-get install synclient```

It's always safe to save the current state before tweaking, so
```synclient > somewheresafe/synclient.bak```

Just typing
```synclient```
will list all the available options

The interesting ones in the case of a *shaking* pointer are 

List properties of the device, in our case 'ETPS/2 Elantech Touchpad'
```xinput list-props 'ETPS/2 Elantech Touchpad' | grep -i finger```
- HorizHysteresis
- VertHysteresis

A higher value means that a bigger displacement of the finger is needed in order to actually move the pointer.

To set a new value to **HorizHysteresis** or **VertHysteresis** just do :
```synclient HorizHysteresis=NEWVALUE```

While a value too high will make the pointer close to immobile, a value too low will make it *shake* 