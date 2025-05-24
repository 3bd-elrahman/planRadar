class ReminderJob
  include Sidekiq::Worker
  sidekiq_options queue: :default
  def perform(*args)
    puts "################### reminder job running #####################################"
    tickets = Ticket.where("due_date >= ?", Date.today).includes(:user).all
    tickets.each do |ticket|
      user = ticket.user
      next unless user.send_due_date_reminder

      ticket_due_date = ticket.due_date
      next unless day_to_send_reminder_to_user?(user.due_date_reminder_interval,ticket_due_date)
    
      next unless send_reminder_now?(user)


      email = user.email
      notifier = 'email' # notifier type should save as a config in DB 
      message = "this is a reminder for due ticket with id #{ticket.id}"
      notifier_object = Notifications::NotificationFactory.build(notifier)
      notifier_object.send(user,message)
    end
  end

  def day_to_send_reminder_to_user?(interval,ticket_due_date)
    ticket_due_date - interval  == Date.today
  end

  def send_reminder_now?(user)
    Time.now.in_time_zone(user.time_zone).strftime("%H:%M") == user.due_date_reminder_time.strftime("%H:%M")
  end
end
