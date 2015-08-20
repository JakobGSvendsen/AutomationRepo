workflow Test-JSONOutput
{
    [OutputType([string])]

    #Do work
    $Now = Get-Date

    #Create return object
	$Result = New-Object -TypeName PSObject
    Add-Member -InputObject $Result -MemberType NoteProperty  -Name "Status" -Value "Created"
    Add-Member -InputObject $Result -MemberType NoteProperty  -Name "Message" -Value "The user jgs@coretech.dk was created"
    Add-Member -InputObject $Result -MemberType NoteProperty  -Name "Timestamp" -Value "$Now"
	
	$Result | ConvertTo-Json
}
#Test-JSONOutput