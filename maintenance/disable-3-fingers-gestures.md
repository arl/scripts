# Disable 3 fingers gestures

Sometimes mouse pad is too much sensible and detects a **3 fingers gesture** while
only 2 fingers are actually touching the pad.
This happens for example when you try to initiate a '2 fingers' scrolling.
This behaviour, can transform a nice user experience into a real 
pain in the ass as, at least on my Ubuntu set-up, the application switcher
gets called intempestively...

To simply disable 3 fingers gestures, on Ubuntu :
```
synclient TapButton3=2
synclient ClickFinger3=2
```
