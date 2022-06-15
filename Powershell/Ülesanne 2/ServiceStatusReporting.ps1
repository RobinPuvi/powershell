
$From = ''
$To = ''
$service = "ssh-agent"

$userpassword = Read-Host -AsSecureString -Prompt "Enter password: "
$encryptpassword = ConvertTo-SecureString $userpassword -AsPlainText -Force
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From,$encryptpassword

if (Get-Service $service | Where-Object {$_.Status -EQ "Stopped"}) {
    $Subject = "Urgent! $(service) report"
    $Body = "$(service) has stopped! $(Get-Date)"
    $SMTPServer = "smtp.gmail.com"
    $SMTPPort = "587"
    Send-MailMessage -From $From -to $To -Subject $Subject `
    -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
    -Credential (Get-Credential)
}