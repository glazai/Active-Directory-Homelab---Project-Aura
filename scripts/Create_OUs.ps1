# Define the base OU
$BaseOU = "OU=AuraCorp,DC=auracorp,DC=local"
New-ADOrganizationalUnit -Name "AuraCorp" -Path "DC=auracorp,DC=local"

# Define Sub-OUs to create
$SubOUs = @("Departments", "Groups", "Computers", "Quarantine")
$DeptOUs = @("IT", "HR", "Sales", "Finance")

foreach ($OU in $SubOUs) {
    New-ADOrganizationalUnit -Name $OU -Path $BaseOU
    Write-Host "Created OU: $OU" -ForegroundColor Cyan
}

foreach ($Dept in $DeptOUs) {
    New-ADOrganizationalUnit -Name $Dept -Path "OU=Departments,$BaseOU"
    Write-Host "Created Department: $Dept" -ForegroundColor Green
}