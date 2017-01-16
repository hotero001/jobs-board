class AddFilecontentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :filecontents, :string
  end
end
