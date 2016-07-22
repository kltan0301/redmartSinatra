class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :name, null: false
      # t.references :brands, null: false
      # t.references :categories, null: false
      t.float :price, null: false
      # Add t.timestamps whenever u create a table

      t.timestamps
      #add_foreign_key :book
      # add_reference :products, :brands, foreign_key: true
      # add_reference :products, :categories, foreign_key: true
    end
  end
end
