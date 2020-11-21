class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shippingfee, :shippingplace, :shippingday
  validates :category_id, :condition_id, :shippig_fee_id, :shipping_place_id, :shipping_day_id, numericality: { other_than: 1 }
  

end
