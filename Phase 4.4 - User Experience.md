This hypothetical company would not be a company without having an identity. In the next GPO, we are implementing a "corporate" wallpaper GPO to ensure a consistent look and feel accross all company workstations.

For us to apply a wallpaper, the computer must be able to reach the image file over the network. Therefore the wallpaper itself must be located in a shared drive.

Firstly we need to prepare the image and share it.

1. Create folder: C:/Shares/Public
2. Add the wallpaper there
3. Share the folder. Share it as Public and ensure that "Everyone" has Read access.
4. UNC Path: \\Aura-DC01\Public\AuraCorp-Wallpaper.jpg

Now it is time to configure the GPO

Steps:
1. In Group Policy Management, create a new GPO: UI-Global-Wallpaper
2. Edit it and navigate to: User Configuration > Policies > Administrative Templates > Desktop > Desktop
3. Double-click the Desktop wallpaper Setting
4. Select Enabled
5. Under Wallpaper name: Paste your UNC Path
6. Wallpaper Style: Select Fill
7. Click Ok.

Next we need to Link the GPO by dragging the GPO to the appropriate OU. In our case is AuraCorp OU.

After forcing the update and signing out and in we should now see the corporate wallpaper.
  
![alt text](/images/Wallpaper.PNG)