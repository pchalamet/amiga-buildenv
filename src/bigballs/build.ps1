Import-Module ../../tools/scripts/demo.psm1

Build-Devpac -out bigballs.exe -files bigballs.asm
Invoke-AmigaExecutable -exe bigballs.exe -config A1200
