class User < ApplicationRecord
    has_secure_password
  
    # Validations
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :first_name, presence: true
    validates :last_name, presence: true
  
    has_many :tasks
    has_many :sessions

    
end
  
