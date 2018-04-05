
function Build-Devpac
{
    [CmdletBinding()]
    param([String] $out, [String[]] $files)

    vc -quiet -devpac +aos68k -O2 -notmpfile -nostdlib -o $out $files
    if (! $?) { Throw "Compilation failure" }
}

function Invoke-AmigaExecutable
{
    [CmdletBinding()]
    param([String] $exe, [String] $config)

    $filename = Split-Path $exe -leaf
    $tools = $PSScriptRoot | Split-Path
    New-Item $tools/hd0 -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item $tools/hd0/S -ItemType Directory -Force -ErrorAction Stop | Out-Null
    Copy-Item $exe $tools/hd0/$filename -ErrorAction Stop
    $filename | Out-File $tools/hd0/S/startup-sequence -ErrorAction Stop
    fs-uae $tools/fs-uae/$config.fs-uae
    if (! $?) { Throw "Execution failure" }
}


Export-ModuleMember -Function Build-Devpac
Export-ModuleMember -Function Invoke-AmigaExecutable
