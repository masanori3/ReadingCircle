class ToCircles < ActiveRecord::Migration[5.0]
  def change
    add_column :circles, :code, :string
    add_column :circles, :name, :string
    add_column :circles, :url, :string
    add_column :circles, :image_url, :string
  end
end
