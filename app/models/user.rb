class User < ApplicationRecord
  has_secure_password
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  mount_uploader :image, ImageUploader
  
  has_many :microposts
  has_many :created_circles, class_name: "Circle"
  has_many :circles_users
  has_many :circles, through: :circles_users
  has_many :keeps
  has_many :keep_circles, through: :keeps, source: :circle
  has_many :entries
  has_many :entry_circles, through: :entries, source: :circle
  
  def keep(circle)
    self.keeps.find_or_create_by(circle_id: circle.id)
  end
  
  def unkeep(circle)
    keep = self.keeps.find_by(circle_id: circle.id)
    keep.destroy if keep
  end
  
  def keep?(circle)
    self.keep_circles.include?(circle)
  end
    
  def entry(circle)
    self.entries.find_or_create_by(circle_id: circle.id)
  end
  
  def unentry(circle)
    entry = self.entries.find_by(circle_id: circle.id)
    entry.destroy if entry
  end
  
  def entry?(circle)
    self.entry_circles.include?(circle)
  end
end
