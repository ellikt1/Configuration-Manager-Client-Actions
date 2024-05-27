# Define a script block to trigger SCCM client actions
$SCCMPolices = {
    # Array of SCCM action GUIDs
    $SCCMActions = @( 
        "{00000000-0000-0000-0000-000000000021}",  # MachinePolicy
        "{00000000-0000-0000-0000-000000000003}",  # DiscoveryData
        "{00000000-0000-0000-0000-000000000121}",  # AppDeployment
        "{00000000-0000-0000-0000-000000000001}",  # HardwareInventory
        "{00000000-0000-0000-0000-000000000108}",  # UpdateDeployment
        "{00000000-0000-0000-0000-000000000113}",  # UpdateScan
        "{00000000-0000-0000-0000-000000000002}"   # SoftwareInventory
    )

    # Loop through each action GUID and trigger it
    foreach ($action in $SCCMActions) {  
        Invoke-WmiMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule -ArgumentList $action
    }
}

# Invoke the script block to perform the SCCM client actions
Invoke-Command -ScriptBlock $SCCMPolices
