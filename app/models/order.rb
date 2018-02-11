class Order < ApplicationRecord
	belongs_to :customer
  has_many :order_line_items, dependent: :destroy
end
