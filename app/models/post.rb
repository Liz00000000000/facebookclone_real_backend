class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, through: :user 
    has_many :likes, through: :user 
end
