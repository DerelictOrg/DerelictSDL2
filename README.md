DerelictSDL2
============

Dynamic bindings to [SDL 2](http://www.libsdl.org/download-2.0.php) version 2.0.1, [SDL2_image](http://www.libsdl.org/projects/SDL_image/), [SDL2_mixer](http://www.libsdl.org/projects/SDL_mixer/), [SDL2_ttf](http://www.libsdl.org/projects/SDL_ttf/), and [SDL2_net](http://www.libsdl.org/projects/SDL_net/) for the D Programming Language.

For information on how to build DerelictSDL2 and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the SDL 2 libraries via DerelictSDL2, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

```D
// This example shows how to import all of the DerelictSDL2 bindings. Of course,
// you only need to import the modules that correspond to the libraries you
// actually need to load.
import derelict.sdl2.sdl;
import derelict.sdl2.image;
import derelict.sdl2.mixer;
import derelict.sdl2.ttf;
import derelict.sdl2.net;

void main() {
    // This example shows how to load all of the SDL2 libraries. You only need
    // to call the load methods for those libraries you actually need to load.

    // Load the SDL 2 library.
    DerelictSDL2.load();

    // Load the SDL2_image library.
    DerelictSDL2Image.load();

    // Load the SDL2_mixer library.
    DerelictSDL2Mixer.load();

    // Load the SDL2_ttf library
    DerelictSDL2ttf.load();

    // Load the SDL2_net library.
    DerelictSDL2Net.load();

    // Now SDL 2 functions for all of the SDL2 libraries can be called.
    ...
}
```
