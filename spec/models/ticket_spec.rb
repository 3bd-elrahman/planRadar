require 'rails_helper'

describe Ticket, type: :model do

    context 'create new ticket' do  
        let!(:user) { User.create(email:'example@example.com')}
        let!(:ticket) { Ticket.create(user: user,title:'test title')}

        it 'belongs to user' do
            expect(ticket.user).to eql user
        end


        it 'title must be presented' do
            ticket1 = Ticket.new(user: user,title:'test title')
            ticket2 = Ticket.new(user: user)

            expect(ticket1).to be_valid
            expect(ticket2).not_to be_valid

        end
      
      

    end




end