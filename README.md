# Amiga build workspace
This is my Amiga development environment on MacOS.
It uses brew, fs-uae, vasm and powershell. VS Code is recommended (with m68k extension) to help with development.

# How to use it
First initial your computer using tools/scripts/install.sh
This will setup brew, fs-uae and powershell.

vasm is not installed automatically as of now.
Follow https://blitterstudio.com/setting-up-an-amiga-cross-compiler/ how to do this.

# How to compile
See example in src/bigballs/build.ps1
Note that this build script use powershell and a module in tools/scripts/demo.psm1.
