
function Build-Devpac
{
    param([String] $out, [String[]] $files)

    vc -devpac +aos68k -O2 -notmpfile -nostdlib -o $out $files
}

function Invoke-AmigaExecutable
{
    param([String] $exe, [String] $config)

    $filename = Split-Path $exe -leaf
    Copy-Item $exe ../../tools/hd0/$filename
    New-Item ../../tools/hd0/S -ItemType Directory -Force
    $filename | Out-File ../../tools/hd0/S/startup-sequence
    fs-uae ../../tools/fs-uae/$config.fs-uae
}

Export-ModuleMember -Function Build-Devpac
Export-ModuleMember -Function Invoke-AmigaExecutable
