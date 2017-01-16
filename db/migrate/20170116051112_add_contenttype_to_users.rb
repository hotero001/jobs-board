class AddContenttypeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :contenttype, :string 
  end
end
