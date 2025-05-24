require 'rails_helper'

describe User, type: :model do

    context 'create new user' do    
         let!(:user){User.create(email:'example@example.com')}
        # let!(ticket1){Ticket.create(user:user,title:'title')}
        # let!

        it 'can has many tickets' do
            user1 = User.create(name:'user_1',email:'example@email.com')
            ticket1 = Ticket.create(user:user,title:'title')
            ticket2 = Ticket.create(user:user,title:'title')
            expect(user.tickets).to include(ticket1, ticket2)
            expect(user.tickets.count).to eq(2)
        end

        it 'email is uniq' do
            user1 = User.new(email:'example@example.com')
            user2 = User.new(email:'example@gmail.com')
            expect(user1).not_to be_valid
            expect(user2).to be_valid
        end


    end




end