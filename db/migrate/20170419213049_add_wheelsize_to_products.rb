class AddWheelsizeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :wheelsize, :integer
  end
end
