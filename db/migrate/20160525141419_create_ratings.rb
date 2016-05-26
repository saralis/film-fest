class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :value, null: false, default: 0.0
      t.references :user, null: false, index: true
      t.references :film, null: false, index: true

      t.timestamps null: false
    end
  end
end
