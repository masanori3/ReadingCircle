class CreateCirclesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :circles_users do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :circle, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :circle_id], unique: true
    end
  end
end
