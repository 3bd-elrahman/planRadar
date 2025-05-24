Ruby version : ruby 3.2.2
Rails version : 8.0.2
Data base : postgres
############################################
Models: There are two models: User and Ticket

Relationship:
A User has_many Tickets ....
A Ticket belongs_to a User
##############################################
NotificationFactory Service
A service named NotificationFactory is used to create notifier objects, such as email

In the future, if you want to add other notifiers like SMS, WhatsApp, etc., you only need to add them inside NotificationFactory without changing the client code

This follows the Factory Design Pattern
################################################
Background Job
A background job named ReminderJob runs every minute to check for users who need to be notified

The main notification logic is implemented inside this job

Sidekiq and Redis are used to run this background job

