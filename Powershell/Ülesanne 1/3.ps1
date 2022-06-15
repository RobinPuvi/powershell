$fileList = Get-ChildItem -Name -Recurse -Path (Join-Path $PSScriptRoot "PS_Demo") -File

$fail = Join-Path $PSScriptRoot "PS_Demo" "FailideIndeks.txt"
if(Test-Path -Path $fail -PathType "leaf") {
  Write-Host "Fail juba olemas"
} else {
  New-Item -ItemType "file" -Path (Join-Path $PSScriptRoot "PS_Demo") -Name "FailideIndeks.txt"
}

Set-Content -Path $fail -Value $fileList

# delete TypeA
foreach($file in $fileList) {
  if($file.ToString().Contains("TypeA")) {
    Remove-Item (Join-Path $PSScriptRoot "PS_Demo" $file) 
  }
}

Write-Host $fileList