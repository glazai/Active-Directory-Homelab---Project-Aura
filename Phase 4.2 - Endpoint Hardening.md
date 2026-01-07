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