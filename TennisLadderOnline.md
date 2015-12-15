#Tennis Ladder Online for STLC
DEMO:http://tennis-ladder.appspot.com

**I am open to contract position on Groovy/Grails/Java consulting**

![http://code.google.com/images/code_sm.png](http://code.google.com/images/code_sm.png)

[mailto:will.han@gmail.com](mailto:will.han@gmail.com)

# Introduction #

The biggest advantage for moving it online is TO LET USER **report result online** instead of sending emails, once user reported result, everyone will be able to see the standing change right away as well as the result report, so no need to wait for 'weekly' result anymore, in another words, the ladder will be 'realtime' once it's been moved online.


# Details #

A 'realtime' ladder will also show who's taken challenge, who's available for challenge at realtime, so that the ladder could 'manage' by itself.

I break down the functions into 3 phases:

  1. release 1: player registration , basic messaging. (on April 16)
  1. release 2: realtime ladder, match result list, challenger issue challenge, defender accept challenge and winner report result (aim for MAY 10)
  1. release 3: enhancement: email notifying, and on going enhancement (TBD)

To the end users they can benefit from all these above and no more efforts will be made than before. I also have backup plans if the online plan fails, we can just keep the way it was running last year.

# Architecture & Decision #
# The app is implemented in grails as a little pet project, originally I was thinking to put it into google appengine, since it's free, has a nice admin interface with a free domain name,sadly after couple days of trying even simplest template app can not work properly on GAE. .. But I still love GAE and I have to find a good solution with free hosting and domain names... Then I turn it to a Java app portal on GAE and can be dynamically directed to a Virtualbox linux VM server at my home.

# grails mockDomain has very outstanding productivity allows me to unit test domain object without a db, however it doesn't support criteria which will be needed to run complex queries. since the application only have limited users, i decided to stick with dynamic finders and use code join/filter to have the benefit of running a dynamic ladder without db.