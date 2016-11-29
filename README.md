# Planetarium

[![Video](http://img.youtube.com/vi/mlJv4ZZyFOw/0.jpg)](http://www.youtube.com/watch?v=mlJv4ZZyFOw)

# Summary
A program based around providing info on select planets and creating a small physics sandbox using equations based off reality but modified to improve visuals and performance.
Planet data is loaded from a file and used to populate the program with planet objects. 
In info mode you can cycle through the planets and view descriptions of each, you can return to the main menu by clicking on the back button with the red arrow on it. 
In free mode the planets rotate automatically and a few asteroids are created every second from random points around the system. 
By clicking and holding clusters of asteroids are generated from the mouse pointer.
There is an easter egg button in the bottom right corner that toggles an interesting visual mode.

# Highlights
* The calculations for force on the asteroids in relation to the planets took a lot of tweaking and I'm quite happy with the resulting physics interactions such as the slingshot effect.
* The inheritence and polymorphism for the button classes really streamlined menu navigation.
* The order of translates, scaling, rotation, push and popmatrices in draw required fine tuning to get the desired displays.