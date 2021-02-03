class Species < ActiveRecord::Base
    has_many :creations, :through => :user
end