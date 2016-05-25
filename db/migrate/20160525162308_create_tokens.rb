class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :token
      t.boolean :active

      t.timestamps null: false
    end
  end
end
