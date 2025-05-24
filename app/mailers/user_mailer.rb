class UserMailer < ApplicationMailer
    def reminder_email(user, message)
        @user = user
        @message = message

        mail(
        to: @user.email,
        subject: "🔔 Reminder: Ticket Due Soon"
        )
  end
end
