class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true, unique: true
      t.boolean :winner

      t.timestamps null: false
    end
  end
end
