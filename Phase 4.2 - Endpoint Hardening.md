After securing the Identity, we now need to secure the Endpoints. In this phase, we are going to implement 2 GPO. One for Restricted Groups and another for Blocking USB Storage.

Restricted Groups ensures that only IT Staff have local Admin rights on workstations. By implementing this policy we are preventing "Admin Creep" and mitigating lateral movement by attackers.

Steps:
1. In Group Policy Management, create a new GPO named: SEC-Workstation-RestrictedGroups
2. Edit it and navigate to: Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups
3. Right-click the empty panel on the right and select Add Group
4. Type Administrators(exactly as it appears on a local Windows machine)
5. In the "Members of this group" section, click Add and add:
    - DOMAIN/Administrator
    - DOMAIN/SG-IT-Staff
6. Click OK.

Even if a user manages to get a local admin right by using exploits, the GPO refresh, which happens every 90 minutes, will see the unauthorised user and instantly kick them out.

It should look like this:

![alt text](/images/admins_restrictedGroups.PNG)

The second GPO we will implement is Blocking USB Storage. This is a DLP(Data Loss Prevention) method. The goal here is to disable Read/Write access to removable disks for non IT-Users. We want to prevent employees from plugging in unauthorised USB drives that could contain malware or be used to steal company data.

Steps:
1. Create a new GPO called: SEC-Workstation-USBBlock
2. Edit it and navigate to: Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access
3. Find the setting: All Removable Storage classes: Deny all access
4. Set it to enabled
5. Link the GPO to the Workstations OU except the IT OU.

![alt text](/images/Usb.PNG)

![alt text](/images/usb_link.PNG)

By not linking the GPO to IT, we ensure that server operations and IT toubleshooting remain unaffected. 