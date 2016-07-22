class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :category_name, null: false
      t.timestamps
        #add_foreign_key :book
    end
  end
end
