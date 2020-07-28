# Disable an xinput device

My trackpad is going crazy since I dropped a bit of water on it.

    $ xinput list

    ⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
    ⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
    ⎜   ↳ Raydium Corporation Raydium Touch System	id=11	[slave  pointer  (2)]
    ⎜   ↳ SynPS/2 Synaptics TouchPad              	id=9	[slave  pointer  (2)]
    ⎜   ↳ Logitech USB Receiver                   	id=15	[slave  pointer  (2)]
    ⎜   ↳ TPPS/2 IBM TrackPoint                   	id=10	[slave  pointer  (2)]  <- this guy
    ⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
        ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
        ↳ Power Button                            	id=6	[slave  keyboard (3)]
        ↳ Video Bus                               	id=7	[slave  keyboard (3)]
        ↳ Sleep Button                            	id=8	[slave  keyboard (3)]
        ↳ Integrated Camera: Integrated C         	id=12	[slave  keyboard (3)]
        ↳ AT Translated Set 2 keyboard            	id=13	[slave  keyboard (3)]
        ↳ ThinkPad Extra Buttons                  	id=16	[slave  keyboard (3)]
        ↳ Logitech USB Receiver                   	id=14	[slave  keyboard (3)]
        ↳ Logitech USB Receiver                   	id=17	[slave  keyboard (3)]


    $ xinput --disable 10

Problem solved!
