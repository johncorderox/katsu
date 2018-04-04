class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :level, :integer
    add_column :users, :bio, :text
    add_column :users, :birthday, :date
  end
end
