class ChangeDatatypeCapacityOfCircles < ActiveRecord::Migration[5.0]
  def change
    change_column :circles, :capacity, :string
  end
end
