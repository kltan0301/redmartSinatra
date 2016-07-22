class AddForeignKeyToProducts < ActiveRecord::Migration
  def change
     add_reference :products, :brands, foreign_key: true
     add_reference :products, :categories, foreign_key: true
  end
end
