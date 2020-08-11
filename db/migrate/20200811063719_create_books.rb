class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.text :location
      t.text :description
    end
  end
end
