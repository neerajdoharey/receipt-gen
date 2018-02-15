class AddcolumnsOrderLineitems < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_line_items, :rate, :float
  	add_column :order_line_items, :total, :float
  end
end
