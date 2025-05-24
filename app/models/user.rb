class User < ApplicationRecord
    has_many  :tickets
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
