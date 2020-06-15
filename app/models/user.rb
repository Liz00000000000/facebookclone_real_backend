class User < ApplicationRecord
    has_many :posts 
    has_many :comments 
    has_many :friends 
    has_many :likes 

    def find_friends
        Friend.all.select do |friend|
            friend.user_id_1 == self.id || friend.user_id_2 == self.id 
        end 
    end 
end
