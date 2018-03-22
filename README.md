# Amiga build workspace
This is my Amiga development environment on MacOS.
It uses brew, fs-uae, vasm and powershell. VS Code is recommended (with m68k extension) to help with development.

# Configure development environment
First initial your computer using tools/scripts/install.sh
This will setup brew, fs-uae, lha and powershell.

Vasm can be compiled using build-compiler.ps1. Use default in prompts (just press ENTER).
Do not forget to modify your profile.ps1 accordingly (see instructions after build).

Also, it's strongly advised to import demo.psm1 module in your profile.ps1.
Import-Module /tools/scripts/demo.psm1

# How to compile
See example in src/bigballs/build.ps1
Note that this build script use powershell and a module in tools/scripts/demo.psm1 (which you should have in your profile).

# You are done !
Happy Amiga hacking !

