class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :circle
  
  validates :content, presence: true
end
