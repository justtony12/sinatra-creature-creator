class User < ActiveRecord::Base
    
    has_many  :creations
    
    has_secure_password
    
end