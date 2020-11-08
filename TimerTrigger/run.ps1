# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format.
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' property is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

# Write an information log with the current time.
Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"

$Unapproved = Get-YnabTransaction -Budget "Adam 2.0" -Type unapproved -Token $env:YNAB_API_KEY
$Uncategorised = Get-YnabTransaction -Budget "Adam 2.0" -Type uncategorized -Token $env:YNAB_API_KEY

$SendPushoverSplat = @{
    UserKey     = $env:PUSHOVER_USER_KEY
    AppToken    = $env:PUSHOVER_API_KEY
    Device      = "pixel3a"
    Title       = "YNAB"
}

$Message = @("There are")

if ($Unapproved.Count -gt 0) {
    $Message += "{0} transactions pending approval" -f $Unapproved.Count
}

if ($Uncategorised.Count -gt 0) {
    $Message += "{0} transactions pending categorisation" -f $Uncategorised.Count
}

if ($Message.Count -gt 1) {
    $Message = $Message[0] + " " + [String]::Join(" and ", $Message[1..2])
    Send-Pushover @SendPushoverSplat -Message $Message
}

Write-Host $Message
