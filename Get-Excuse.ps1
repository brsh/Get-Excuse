
<#PSScriptInfo
.VERSION 1.0
.GUID ef337e9a-bef7-4c44-b03b-d21d0ba33cb2
.AUTHOR bsheaffer
.COMPANYNAME none
.COPYRIGHT
.TAGS
.LICENSEURI file://./LICENSE.md
.PROJECTURI
.ICONURI
.EXTERNALMODULEDEPENDENCIES
.REQUIREDSCRIPTS
.EXTERNALSCRIPTDEPENDENCIES
.RELEASENOTES
#>

<#
.SYNOPSIS
Pulls a random excuse

.DESCRIPTION
Randonmly gets an excuse from the "Bastard Operator From Hell"-style excuse generator data file

.PARAMETER Format
Puts the excuse in context

.EXAMPLE
Get-Excuse.ps1

.LINK
http://pages.cs.wisc.edu/~ballard/bofh/

.LINK
http://pages.cs.wisc.edu/~ballard/bofh/excuses

#>
param (
	[switch] $Format = $false
)

[string] $ScriptPath = Split-Path (get-variable myinvocation -scope script).value.Mycommand.Definition -Parent

$file = Get-Content -Path (Join-Path $ScriptPath excuses.txt)
[string] $random = Get-Random -InputObject $file
if ($Format) {
	if ( -not ($random.Substring(0, 2).ToUpper() -cmatch $random.Substring(0, 2))) {
		$random = "$($random.substring(0,1).tolower())$($random.substring(1))"
	}
	"It's not working? Probably $random"
} else {
	if ( -not ($random.Substring(0, 2).ToUpper() -cmatch $random.Substring(0, 2))) {
		$random = "$($random.substring(0,1).toupper())$($random.substring(1))"
	}
	$random
}
