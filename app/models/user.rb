class User < ActiveRecord::Base
    
    has_many  :creations
    
    has_secure_password

    validates :username, uniqueness: true, presence: true
    
end