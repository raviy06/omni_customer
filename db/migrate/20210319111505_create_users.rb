class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :name
      t.datetime :date_of_birth
      t.string :gender
      t.string :phone_number
      t.string :uid, index: true
      t.integer :role_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
