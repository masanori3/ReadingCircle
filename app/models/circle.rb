class Circle < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  has_many :microposts
  
  has_many :circles_users
  has_many :users, through: :circles_users
  
  has_many :keeps
  has_many :keep_users, through: :keeps, source: :user
  
  has_many :entries
  has_many :entry_users, through: :entries, source: :user
  
  
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :title, presence: true
  validates :reserved_at, presence: true
  validates :attend, presence: true
  validates :user_id, presence: true
  validates :minutes, presence: true
  
end
