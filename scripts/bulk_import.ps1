# Import the AD Module
Import-Module ActiveDirectory

# Path to your CSV
$CSVPath = "C:\LabResources\employees.csv"

# Default Password (Users must change this at first logon)
$Password = ConvertTo-SecureString "P@ssword123!" -AsPlainText -Force

# Read the CSV
$Users = Import-Csv -Path $CSVPath

foreach ($User in $Users) {
    # Define the SamAccountName (e.g., sconnor)
    $Username = ($User.firstname.substring(0,1) + $User.lastname).ToLower()
    
    # Define the Target OU Path based on the CSV "Department" column
    $TargetOU = "OU=$($User.department),OU=Departments,OU=AuraCorp,DC=auracorp,DC=local"
    
    # Check if the user already exists
    if (Get-ADUser -Filter "SamAccountName -eq '$Username'") {
        Write-Host "User $Username already exists. Skipping..." -ForegroundColor Yellow
    } else {
        # Create the user
        New-ADUser -Name "$($User.firstname) $($User.lastname)" `
                   -SamAccountName $Username `
                   -GivenName $User.firstname `
                   -Surname $User.lastname `
                   -Title $User.jobtitle `
                   -Department $User.department `
                   -Path $TargetOU `
                   -AccountPassword $Password `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true
        
        Write-Host "Successfully created user: $Username in $TargetOU" -ForegroundColor Green
    }
}