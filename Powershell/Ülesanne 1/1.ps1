# new folder
if (Test-Path -Path (Join-Path $PSScriptRoot "PS_Demo")) {
    Write-Host "Kaust olemas"
} else {
    New-Item -Path "$PSScriptRoot" -Name "PS_Demo" -ItemType Directory
}

# subfolders and files
for ($i = 1; $i -le 3; $i++) {
    $folderName = "Alamkaust" + $i
    $newSubFolder = Join-Path $PSScriptRoot "PS_Demo" $folderName
    switch ($i) {
        1 { $fileLetter = "A" }
        2 { $fileLetter = "B" }
        3 { $fileLetter = "C" }
    }
    
    if (Test-Path -Path $newSubFolder) {
        Write-Host "Alamkataloog $i olemas"
    } else {
        New-Item -Path (Join-Path $PSScriptRoot "PS_Demo") -Name $folderName -ItemType Directory
    }

    for ($j = 1; $j -le 50; $j++) {
        $fileName = "Type$($fileLetter)Test$("$($j+$i*50-50)".PadLeft(3,'0')).txt"

        if(Test-Path -Path (Join-Path $newSubFolder $fileName) -PathType "leaf") {
            Write-Host "Fail $fileName olemas"
        } else {
            New-Item -Path $newSubFolder -Name $fileName -ItemType "file"
        }
    }
}