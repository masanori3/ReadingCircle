class ChangeDatatypeCapacityOfCirclesVer2 < ActiveRecord::Migration[5.0]
  def change
    change_column :circles, :capacity, :integer
  end
end
