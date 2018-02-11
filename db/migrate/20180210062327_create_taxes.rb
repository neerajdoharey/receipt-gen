class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
    	t.float :tax_ratio
    	t.float :cgst_ratio
    	t.float :sgst_ratio
      t.timestamps
    end
  end
end
