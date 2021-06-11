$FileName="E:\Users\UserA\Desktop\Filename.csv"
$accountSkuId="contoso:<SkuID>"
$plans=@("EXCHANGE_S_STANDARD","<Plan name>")
$userlist=Import-Csv $FileName
$updateLicense=New-MsolLicenseOptions -AccountSkuId $accountSkuId -DisabledPlans $plans
ForEach ($user in $userlist)
{
	$upnName=$user.UserPrincipalName
	Set-MsolUserLicense -UserPrincipalName $upnName -LicenseOptions $updatelicense -ErrorAction SilentlyContinue
}
	