class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
