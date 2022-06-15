Get-Process svchost | Where-Object { $_.WorkingSet -gt 100000*1024 } | Sort-Object -Property WorkingSet -Descending | Select-Object -First 8 | Export-Csv svc.csv
