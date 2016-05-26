class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token, null: false, index: true
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
