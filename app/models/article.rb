class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum:30} 
    validates :description, presence: true, length: {minimum: 10, maximum:1000} 
    validates :user_id, presence: true #application wonnt work anymore because we need user_id in our create method
end
