class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :email, null: false, limit: 50
      t.string :address, limit: 50
      t.string :password, limit: 50, null:false
      t.string :cc_number, limit: 50, null:false
      # Add t.timestamps whenever u create a table
      t.timestamps
      #add_foreign_key :book
    end
  end
end
