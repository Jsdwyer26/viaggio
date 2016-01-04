class AddCityIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :city_id, :integer
  end
end
