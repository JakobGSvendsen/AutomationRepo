workflow Test-JSONOutput
{
	
	$Result = Get-Date
	
	$Result | ConvertTo-Json
}