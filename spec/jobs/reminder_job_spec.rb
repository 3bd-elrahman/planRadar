require 'rails_helper'


describe ReminderJob, type: :job do
    include ActiveSupport::Testing::TimeHelpers

    let(:user){ User.create(   email: 'user@example.com', send_due_date_reminder: true, due_date_reminder_interval: 2, due_date_reminder_time: Time.zone.parse('15:30'), time_zone: 'Europe/Vienna' )}
    let!(:ticket1){Ticket.create(  user: user,title: 'Ticket due soon',due_date: Date.today + 2.days )}
    let!(:ticket2){Ticket.create(  user: user,title: 'Ticket not due soon',due_date: Date.today + 5.days )}

    let(:notifier_object) { instance_double('Notifier') }


    before do
     allow(Notifications::NotificationFactory).to receive(:build).with('email').and_return(notifier_object)
     allow(notifier_object).to receive(:send)
      
    end

    # after do
    #   travel_back
    # end

    
    it 'sends reminder only for tickets due based on interval and time' do
      travel_to Time.find_zone('Europe/Vienna').parse('15:30')

      ReminderJob.new.perform
      expect(notifier_object).to have_received(:send).with(user, 'this is a reminder for due ticket').once
    end
    
    it 'does not send reminder if current time does not match due_date_reminder_time' do
      travel_to Time.find_zone('Europe/Vienna').parse('16:00')
      ReminderJob.new.perform

      expect(notifier_object).not_to have_received(:send)
    end






end