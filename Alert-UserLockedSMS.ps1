param($webhookdata)

$Connection = Get-AutomationConnection -Name 'Twilio Demo'
$from = "+12565105545" #Twilio phone number

$Connection | ft 

# Get Webhook Data
$RequestBody = ConvertFrom-JSON $WebhookData.RequestBody

# Searching Webhook Data for Value Results
$SearchResults = $RequestBody.SearchResults
$SearchResultsValue = $SearchResults.value
Foreach ($item in $SearchResultsValue)
{
    $UserName = $item.TargetUserName

    $UserAD = get-aduser -Filter "SamAccountName -eq '$UserName'" -Properties MobilePhone

    $to = $UserAD.MobilePhone
	
	Send-TwilioSMS -Connection $COnnection -from $from -to $to -Message "Your account has been locked. Please reply UNLOCK to unlock your account"
}


