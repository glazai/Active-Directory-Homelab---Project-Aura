Now that we have locked the security, we will implement an Automated Drive Mapping GPO. The strategy is that every department will have its own drive.

But before GPO can map a drive, the folder must exist and be shared.

Steps:
1. We created a folder in C:\Shares\SalesData
2. Right Click > Properties > Sharing > Advanced Sharing
3. Check Share folder
4. We set the Share name to SalesData$
    - Adding $, will make the folder to be hidden. Users can not browse the folder by accident , but the GPO can still map it.
5. Set "Everyone" to Full Control

![alt text](/images/share_sales.PNG)    ![alt text](/images/permissions_share.PNG)