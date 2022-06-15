if(Test-Path (Join-Path $PSScriptRoot "PS_Demo")) {
    $files = Get-ChildItem -Name -Recurse -Path (Join-Path $PSScriptRoot "PS_Demo") -File
  } else {
    Write-Host "No files"
  }
  
  foreach($file in $files) {
    if(([int]($file.ToString().Remove(0,20).Remove(3)) % 2) -ne 0) {
      # paaritu
      Move-Item -Path (Join-Path $PSScriptRoot "PS_Demo" $file) -Destination (Join-Path $PSScriptRoot "PS_Demo" "Alamkaust1")
    } else {
      # paaris
      Move-Item -Path (Join-Path $PSScriptRoot "PS_Demo" $file) -Destination (Join-Path $PSScriptRoot "PS_Demo" "Alamkaust2")
    }
  }
  
  Rename-Item -Path (Join-Path $PSScriptRoot "PS_Demo" "Alamkaust1") -NewName (Join-Path $PSScriptRoot "PS_Demo" "PaaritudFailid")
  Rename-Item -Path (Join-Path $PSScriptRoot "PS_Demo" "Alamkaust2") -NewName (Join-Path $PSScriptRoot "PS_Demo" "PaarisFailid")