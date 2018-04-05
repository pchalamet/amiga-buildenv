# see https://blitterstudio.com/setting-up-an-amiga-cross-compiler/ for more details

Push-Location

$tools = $PSScriptRoot | Split-Path
$compiler = Join-Path $tools "compiler"
Remove-Item $compiler -Recurse -Force
New-Item $compiler -ItemType Directory | Set-Location
New-Item "bin" -ItemType Directory | Out-Null
New-Item "src" -ItemType Directory | Push-Location

# build vasm
iwr http://sun.hasenbraten.de/vasm/release/vasm.tar.gz -OutFile vasm.tar.gz
tar -xvf vasm.tar.gz
Push-Location vasm
make CPU=m68k SYNTAX=mot
Copy-Item -Path vasmm68k_mot,vobjdump -Destination ../../bin
Pop-Location

# build vlink
iwr http://sun.hasenbraten.de/vlink/release/vlink.tar.gz -OutFile vlink.tar.gz
tar -xvf vlink.tar.gz
Push-Location vlink
make
Copy-Item -Path vlink -Destination ../../bin
Pop-Location

# build vc
iwr http://www.ibaug.de/vbcc/vbcc.tar.gz -OutFile vbcc.tar.gz
tar -xvf vbcc.tar.gz
Push-Location vbcc
New-Item "bin" -ItemType Directory | Out-Null
make TARGET=m68k
make TARGET=m68ks
Copy-Item -Path bin/vbcc*,bin/vc,bin/vprof ../../bin
Pop-Location

# get targets
iwr http://server.owl.de/~frank/vbcc/2014-12-30/vbcc_unix_config.tar.gz -OutFile vbcc_unix_config.tar.gz
iwr http://server.owl.de/~frank/vbcc/2014-12-30/vbcc_target_m68k-amigaos.lha -OutFile vbcc_target_m68k-amigaos.lha
tar -xvf vbcc_unix_config.tar.gz
lha x vbcc_target_m68k-amigaos.lha
Copy-Item config ../config -Recurse
(Get-Content ../config/aos68k) -replace "-phxass ", "" | Set-Content ../config/aos68k
Copy-Item vbcc_target_m68k-amigaos/targets ../targets -Recurse

Pop-Location
Pop-Location


$tools = $PSScriptRoot | Split-Path
$vbcc = Join-Path $tools "compiler"
Write-Host "Append following lines to your profile.ps1:"
Write-Host "`$env:VBCC = `"$vbcc`""
Write-Host "`$env:PATH += `":`$env:VBCC/bin`""
Write-Host "Import-Module $tools/scripts/demo.psm1"

