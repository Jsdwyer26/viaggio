class AddCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_city, :string
  end
end
