class AddCreatedAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :created_at, :datetime
  end
end
