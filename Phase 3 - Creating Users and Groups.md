It is time to add new Users and Groups.

We will begin by adding a User manually just to showcase how it is done.

The new User will join the IT department and the steps are as followed:

1. RightClick on IT OU -> "New" -> "User"
2. Fill in user information
3. Set Password, Make sure to check "User must change password at next logon"
4. Finish

Following the above steps we should see something like this:

![alt text](/images/user_creation.PNG)
![alt text](/images/final_user_creation.PNG)

The user is now created and under AD Users and Computers we should see this:

![alt text](/images/user_groups.PNG)

Manual User Creation is inefficient and leads to data inconsistency. During manual entry, mistakes can be made.

To tackle this problem we developed a powershell script to automate user provisioning via CSV, enforcing a standard naming convention(FirstInitial + LastName) and ensuring users are placed in their respective departmental OUs automatically.

After successfully running the script, the users are automatically created.

![alt text](/images/bulk_import_success.PNG)

Verifying the script worked, we check if the users are actually created under AD Users and Computers.

![alt text](/images/final_user.PNG)

Finally we set -ChangePasswordAtLogon as True. This is a security best practice. As an admin, We should not know the user's permanent password. So set a temporary one, and Active Directory forces them to choose their own private password the moment they sit down at their desk. 