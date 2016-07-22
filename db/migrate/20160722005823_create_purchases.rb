class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.boolean :status
      t.timestamps
    end
    add_reference :purchases, :products, foreign_key: true
    add_reference :purchases, :users, foreign_key: true    
  end
end
