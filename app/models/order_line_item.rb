class OrderLineItem < ApplicationRecord
	belongs_to :order
  belongs_to :product

  def calculate_gst_order_line_item

  	gst_ratio  = Tax.find_by_gst_ratio(self.gst_ratio)
  	self.total = self.total * self.quantity
  	self.cgst_ratio = gst_ratio.cgst_ratio
  	self.sgst_ratio = gst_ratio.sgst_ratio
  	self.sub_total = breakup_cost(self.total, gst_ratio.cgst_ratio, gst_ratio.sgst_ratio).round(2)
  	self.gst_amount = (self.total - self.sub_total).round(2)
  	self.sub_total += self.discount
  	self.rate = (self.sub_total / self.quantity).round(2)
  end

  def breakup_cost(final, cgst_ratio, sgst_ratio)
	  cgst_percentage = cgst_ratio
	  sgst_percentage = sgst_ratio
	  total_gst =  cgst_percentage + sgst_percentage
	  final/((total_gst/100) + 1)
	end

end
