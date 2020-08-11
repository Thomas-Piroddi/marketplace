class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :users, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true
      t.string :stripe_transaction_id
    end
  end
end
