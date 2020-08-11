class AddPurchasedToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :purchased, :boolean
  end
end
