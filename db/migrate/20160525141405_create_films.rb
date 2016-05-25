class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.text :cast
      t.text :crew
      t.references :category, null: false, index: true

      t.timestamps null: false
    end
  end
end
