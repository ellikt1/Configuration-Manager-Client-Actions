# Define the computer name
$ComputerName = "ComputerName"

# Define an array of SCCM action GUIDs
$SCCMActions = @(
    "{00000000-0000-0000-0000-000000000021}",  # MachinePolicy
    "{00000000-0000-0000-0000-000000000022}",  # MachinePolicy Evaluation Cycle
    "{00000000-0000-0000-0000-000000000001}",  # Hardware Inventory 
    "{00000000-0000-0000-0000-000000000002}",  # Software Inventory
    "{00000000-0000-0000-0000-000000000003}",  # DiscoveryData
    "{00000000-0000-0000-0000-000000000113}",  # Software Updates Scan
    "{00000000-0000-0000-0000-000000000114}",  # Software Updates Deployment
    "{00000000-0000-0000-0000-000000000031}",  # Software Metering Usage Report
    "{00000000-0000-0000-0000-000000000121}",  # Application Deployment Evaluation
    "{00000000-0000-0000-0000-000000000032}",  # Windows Installer Source List Update
    "{00000000-0000-0000-0000-000000000010}"   # File Collection
)

# Loop through each action GUID and trigger it
foreach ($action in $SCCMActions) {
    Invoke-WmiMethod -ComputerName $ComputerName -Namespace root\ccm -Class sms_client -Name TriggerSchedule -ArgumentList $action
}

# Confirm completion
Write-Output "All specified SCCM client actions have been triggered on $ComputerName."
