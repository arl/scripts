# Disable an xinput device

My trackpad is going crazy since I've dropped some water on it...

```
$ xinput list

⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ Raydium Corporation Raydium Touch System	id=9	[slave  pointer  (2)]
⎜   ↳ Logitech Wireless Keyboard PID:4023     	id=10	[slave  pointer  (2)]
⎜   ↳ Logitech Wireless Mouse                 	id=11	[slave  pointer  (2)]
⎜   ↳ Synaptics TM3276-022                    	id=15	[slave  pointer  (2)]
⎜   ↳ TPPS/2 IBM TrackPoint                   	id=16	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=8	[slave  keyboard (3)]
    ↳ Integrated Camera: Integrated C         	id=12	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=13	[slave  keyboard (3)]
    ↳ ThinkPad Extra Buttons                  	id=14	[slave  keyboard (3)]
    ↳ Logitech Wireless Keyboard PID:4023     	id=17	[slave  keyboard (3)]
```

```
$ xinput --disable 10
```

Voilà, until it dries, problem solved!