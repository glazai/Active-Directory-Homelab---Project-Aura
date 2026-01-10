Now that we have locked the security, we will implement an Automated Drive Mapping GPO. The strategy is that every department will have its own drive.

But before GPO can map a drive, the folder must exist and be shared.

Steps:
1. Create a folder in C:\Shares\SalesData
2. Right Click > Properties > Sharing > Advanced Sharing
3. Check Share folder
4. We set the Share name to SalesData$
    - Adding $, will make the folder to be hidden. Users can not browse the folder by accident , but the GPO can still map it.
5. Set "Everyone" to Full Control

![alt text](/images/share_sales.PNG)    ![alt text](/images/permissions_share.PNG)


Now it is time to configure the GPO with Item-Level Targetting

Steps:
1. Open Group Policy Management
2. Creat a new GPO : MAP-Global-NetworkDrives
3. Edit it and navigate to: User Configuration > Preferences > Windows Settings > Drive Maps
4. Right Click > New > Mapped Drive
5. General Tab:
    - Action: Update(This ensures it maps every time)
    - Location: \\Aura-DC01\SalesData$
    - Label as: Sales Department
    - Drive Letter: S
6. Common Tab:
    - Check Item-level targeting
    - Click Targeting
    - Click New Item > Security Group
    - Select SG-Sales-Staff

![alt text](/images/target.PNG)    ![alt text](/images/newDriveProperties.PNG)

We will follow the same procedure for the rest of the departments.

Here is the Network Resource Schema

![alt text](/images/networkSchema.PNG)