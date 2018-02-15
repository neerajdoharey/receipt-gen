class Order < ApplicationRecord
	belongs_to :customer
  has_many :order_line_items, dependent: :destroy

  accepts_nested_attributes_for :order_line_items, allow_destroy: true

  def contains_valid_line_items
  	grand_total = 0
  	order_line_items.map do |i|
      i.calculate_gst_order_line_item
      grand_total += i.total
    end
    self.grand_total = grand_total
  end
end
