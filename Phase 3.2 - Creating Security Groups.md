After we created Users, it is important to create Security Groups. Groups allow us to assign permissions to multiple users at once.

We will implement the AGDLP Model, which stands for Accounts into Global Groups, Global groups into Domain Local Groups whith are then assigned Permissions.

By running the script create_groups.ps1, we successfully created the security groups.

![alt text](/images/groups_created.PNG)

Now lets nest our users. We will also automate this by adding anyone from a department to the respective security group(see nest_users.ps1).

![alt text](/images/nest_users.PNG)

By checking the AD Users and Computers we can verify that all the users have been successfully nested to the respective security groups.

![alt text](/images/nested_users.PNG)