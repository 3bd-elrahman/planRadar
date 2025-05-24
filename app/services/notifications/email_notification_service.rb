class Notifications::EmailNotificationService < NotificationService

    def send(user, message)
        UserMailer.reminder_email(user, message).deliver_now
    end



end