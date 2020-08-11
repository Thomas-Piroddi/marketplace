class AddConditionIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :condition, null: false, foreign_key: true
  end
end
