class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest
      t.boolean :judge
      t.string :judge_token
      t.boolean :organizer
      t.string :organizer_token

      t.timestamps null: false
    end
  end
end
