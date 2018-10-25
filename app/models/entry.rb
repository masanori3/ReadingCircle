class Entry < CirclesUser
  def self.capacity_diff
    self.group(:user_id).count(:user_id)
  end
end
