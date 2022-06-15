function StoppedServices(){
    Get-Service | Where-Object {$_.Status -EQ "Stopped"}
}

function A_Services(){
    Get-Service A*
}

function StoppedServices(){
    Get-Service | Where-Object {$_.StartType -EQ "Automatic"}
}

function ServiceToTxt() {
    Get-Service | select Name, Status | Out-File -FilePath .\Services.txt
}

function ServiceToHtml() {
    Get-Service | select Name, Status, StartType | ConvertTo-Html | Out-File -FilePath .\Services.html
}

function SendEmail() {
    if (Get-Service 'Steam Client Service' | Where-Object {$_.Status -EQ "Stopped"}) {
        $From = Read-Host -Prompt 'From: '
        $To = Read-Host -Prompt 'To: '
        $Subject = Read-Host -Prompt "Email: "
        $Body = "Steam Client Service Winmgmt has stopped!"
        $SMTPServer = "smtp.gmail.com"
        $SMTPPort = "587"
        Send-MailMessage -From $From -to $To -Subject $Subject `
        -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
        -Credential (Get-Credential)
    }
}

try {
    Clear-Host
    Show-Logo
    SendEmail
    Read-Host -Prompt "Press any key to close"
} catch {
    $e = $_
    Write-Error $e.Exception.Message
    Write-Error "Stack trace:`n$($e.ScriptStackTrace)"
    Write-Host "The above error occurred while running script"
    Write-Host "Parameters:"
    Write-Host "----------------------------------------------------------------------------------"
    Read-Host -Prompt "Press Enter to exit"
}