#requires -version 2
<#
.SYNOPSIS
  Creates a backup of the No Man's Sky save files
.DESCRIPTION
  Backs up the current No Man's Sky save location to C:\Admin\Backup\NMS\Saves
.OUTPUTS
  Creates a directory in C:\Admin\Backup\NMS\Saves based on the current date and time
.NOTES
  Version:        1.0
  Author:         Jason Ware
  Creation Date: 4 Feb 2022
  Purpose/Change: Initial script development
  
.EXAMPLE
  .\NMSSaveBackup.ps1
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
#. "C:\Scripts\Functions\Logging_Functions.ps1"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$sScriptVersion = "1.0"

#Log File Info
$sLogPath = "C:\Admin\Log\NMS"
$sLogName = "NMSSaveBackup.log"
$sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName

#-----------------------------------------------------------[Functions]------------------------------------------------------------

<#
Function <FunctionName>{
  Param()
  
  Begin{
    Log-Write -LogPath $sLogFile -LineValue "<description of what is going on>..."
  }
  
  Process{
    Try{
      <code goes here>
    }
    
    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }
  
  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}
#>

#-----------------------------------------------------------[Execution]------------------------------------------------------------

$filename = "NMS_Save_" + (Get-Date -Format "yyyyMMddTHHmmssffff")
mkdir C:\Admin\Backup\NMS\Saves\$filename
robocopy C:\Users\jware.XCH\AppData\Roaming\HelloGames C:\Admin\Backup\NMS\Saves\$filename /e /z /ETA
