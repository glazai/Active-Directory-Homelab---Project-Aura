After we created Users, it is important to create Security Groups. Groups allow us to assign permissions to multiple users at once.

We will implement the AGDLP Model, which stands for Accounts into Global Groups, Global groups into Domain Local Groups whith are then assigned Permissions.

By running the script create_groups.ps1, we successfully created the security groups.

![alt text](/images/groups_created.PNG)

Now lets nest our users. We will also automate this by adding anyone from a department to the respective security group(see nest_users.ps1).

![alt text](/images/nest_users.PNG)

By checking the AD Users and Computers we can verify that all the users have been successfully nested to the respective security groups.

![alt text](/images/nested_users.PNG)

Finally, we will create a service account. This type of account is typically used for applications and services. In this case we create a back service account to further harden the security of the system.

See scripts/service_account.ps1

The service account is successfully created. However, we do not want the svc_backup do be a domain admin. That is too much power. Instead we will use Windows's built-in group called Backup Operators. Members of this group can bypass file permissions solely for the purpose of backing up data.

We can this the following command to do that:

Add-ADGroupMember -Identity "Backup Operators" -Members "svc_backup"

![alt text](/images/service_account.PNG)

In practice, a service account should never be allowed to sit down at a computer and log in to a desktop. It should only run in the background. We will enforce this in the next phase of Group Policy later on.