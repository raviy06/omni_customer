class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
