Now that both Users and Groups are created, we move on to the most important part of an AD, The Group Policy Objects(GPO).

Through the Group Policy Management Console we can configure thousands of computers at once. 

GPOs let you configure and enforce settings across a domain. Settings like:
- Security Policies
- Software deployment 
- User environment
- Computer configuration

However, before we start creating any, we need to understand how they are applied. We follow the LSDOU order of precedence. When multiple policies conflict , the one applied last wins.

1. Local(The individual machine's settings)
2. Site(Physical locations)
3. Domain(Setting for the entire auracorp.local)
4. OU(The most specific)

In this scenario, we will focus more on the security aspect and we will implement 5 GPO, each one representing a different category.
