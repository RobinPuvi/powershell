Get-Service | select Name, Status, StartType | ConvertTo-Html | Out-File -FilePath .\Services.html
