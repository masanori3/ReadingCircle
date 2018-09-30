class CreateCircles < ActiveRecord::Migration[5.0]
  def change
    create_table :circles do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :title
      t.datetime :reserved_at
      t.integer :attend
      t.integer :online
      t.string :online_detail
      t.string :offline_detail
      t.integer :capacity
      t.integer :minutes
      t.text :content

      t.timestamps
    end
  end
end
