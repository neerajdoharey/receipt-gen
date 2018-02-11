class AddUserColumns < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :logo, :string, default: ""
  	add_column :users, :address1, :string, default: ""
  	add_column :users, :address2, :string, default: ""
  	add_column :users, :city, :string, default: ""
  	add_column :users, :state, :string, default: ""
  	add_column :users, :pincode, :string, default: ""
  	add_column :users, :gstin, :string, default: ""
  end
end
