class AddColumnOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :customer_id, :integer
  end
end
