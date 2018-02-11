class Product < ApplicationRecord
	validates :sku, presence: true
	validates :name, presence: true
	validates :description, presence: true
end
