# Amiga build workspace
This is my Amiga development environment on MacOS.
It uses brew, fs-uae, vasm and powershell. VS Code is recommended (with m68k extension) to help with development.

# Configure development environment
Configuration installs brew. That's the only side effect on your system.

First initial your computer using tools/scripts/install.sh
This will setup brew, fs-uae, lha and powershell.

Vasm can be compiled using build-compiler.ps1. Use default in prompts (just press ENTER).
Do not forget to modify your profile.ps1 accordingly (see instructions after build).

Also, it's strongly advised to import demo.psm1 module in your profile.ps1.
Import-Module /tools/scripts/demo.psm1

# Check everything is working
Invoke src/bigballs/build.ps1, you should see a small demo running in fs-uae.
This script shows commands (from module demo.psm1) and can serve as a basic to build your stuff.

# You are done !
Happy Amiga hacking !
