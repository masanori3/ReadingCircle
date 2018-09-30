class Circle < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :title, presence: true
  validates :reserved_at, presence: true
  validates :attend, presence: true
  validates :user_id, presence: true
  validates :minutes, presence: true
  
end
