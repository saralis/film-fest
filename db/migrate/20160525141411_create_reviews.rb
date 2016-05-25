class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false, index: true
      t.text :body
      t.references :film, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
