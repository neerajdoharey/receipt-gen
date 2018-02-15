class CreateOrderLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_line_items do |t|
    	t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.float :gst_ratio
      t.float :cgst_ratio
      t.float :sgst_ratio
      t.float :gst_amount
      t.float :discount
      t.float :sub_total
      t.timestamps
    end
  end
end
