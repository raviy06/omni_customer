class AddBranchToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :branch, :string
  end
end
