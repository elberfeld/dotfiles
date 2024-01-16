
# List all Chrome Profiles with Id and Display Name 
# Useful to identify the Profile for big folders with huge amount of Data 

[void][System.Reflection.Assembly]::LoadWithPartialName('System.Web.Extensions')
$jsser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$jsser.MaxJsonLength = $jsser.MaxJsonLength * 10

$chromeStateFile = "C:\Users\${env:USERNAME}\AppData\Local\Google\Chrome\User Data\Local State"
$chromeState = Get-Content $chromeStateFile

$chromeProfiles = $jsser.DeserializeObject($chromeStateRaw).profile.info_cache
$chromeProfilesList = @()

foreach ($chromeProfile in $chromeProfiles.Keys) {

  $profile = New-Object -TypeName psobject -Property @{
    'Id'   = $chromeProfile
    'Name' = $chromeProfiles[$chromeProfile].name
  }
  $chromeProfilesList += $profile

}

$chromeProfilesList | Format-Table
