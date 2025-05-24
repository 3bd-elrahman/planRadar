class Notifications::NotificationFactory

    def self.build(notifier)
        case notifier
        when 'email'
            Notifications::EmailNotificationService.new
        else
            raise "Unknown notifier"

        end





    end



end