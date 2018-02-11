class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.float :grand_total
      t.timestamps
    end
  end
end
