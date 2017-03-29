class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :sex, :string
  end
end
