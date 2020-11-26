function Get-Events {
 If ($UserID) {
        $sids = ForEach ($item in $UserID) {
            Try {
                $sid = [System.Security.Principal.SecurityIdentifier]($item)
                $sid = $sid.Translate([System.Security.Principal.SecurityIdentifier])
            } Catch [System.Management.Automation.RuntimeException] {
                If ($Error[0].CategoryInfo.Category -eq 'InvalidArgument') {
                    Try {
                        $user = [System.Security.Principal.NTAccount]($item)
                        $sid = $user.Translate([System.Security.Principal.SecurityIdentifier])
                    } Catch { Throw $Error[0] }
                } Else { Throw $Error[0] }
            } Catch { Throw $Error[0] }
            $sid.Value
        }
}}
Export -ModuleMember -Function @('Get-Events')