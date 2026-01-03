We are now ready to build the structure of the company.

I implemented a tiered OU structure to facilitate Group Policy application and Administrative Delegation. By seperating Users, Groups, and Computers into distinct OUs, the environment follows the Principle of Least Privilege and is prepared for enterprise-scale management.

In addition, I created a Quarantine OU. The purpose of this organisational unit is to act as a holding cell. This OU is designed to house compromised or stale objects. I have prepared it to receive a "Deny-All" Group Policy, ensuring that any object moved there is logically isolated from the rest of the production environment.

The "Create-OUs.ps1" script was developed to implement the OU structure.

![alt text](/images/create_ous.PNG)

![alt text](/images/ou_structure.PNG)