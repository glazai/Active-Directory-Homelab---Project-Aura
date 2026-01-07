We will implement a multi-layered security strategy to protect against unauthorised access.

We starting with Layer 1. An Account Lockout Policy. This applies to everyone and prevents someone from guessing passwords lots of times.

Steps
1. Open Group Policy Management
2. Create a new GPO called SEC-Global-AccountLockout
3. Edit it and navigate to Computer Configuration -> Policies -> Windows Settings -> Secutiry Settings -> Account Policies -> Account Lockout Policy
4. Configure the settings:
    - Account lockout threshold: 5 Invalid logon attempts
    - Account lockout duration: 30 minutes
    - Reset account lockout counter after: 30 minutes
5. Link it to the top-level OU

The policy should look like this:

![alt text](/images/sec_account_lockout.PNG)

Now that the policy is created and linked to the Top OU, we moving on to the next layer.

In Layer 2, we will implement a stricter passowrd policy specifically for the IT Staff via Active Directory Administrative Center instead of a GPO.

Steps
1. Open ADAC
2. Switch to Tree View, click the domain, and navigate to System -> Password Settings Container
3. Right click in empty space -> New -> Password Settings
4. Name it: PSO-IT-Strict
5. Precedence: 1
6. Settings
    - Min password length: 12
    - Password must meet complexity requirements: Enabled
    - Enforce password history: 24 passwords remembered.
7. Directly applies to: Click Add and select the group(SG-IT-Staff).

It should look the screenshot below

![alt text](/images/Pso_It_strict.PNG)

We chose to create a PSO instead of a GPO to enforce Administrative Accounts like IT Staff with a 12-character password policy without inconveniencing standard users with shorter requirements. 