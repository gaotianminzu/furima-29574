class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_place
  belongs_to :shipping_days
  belongs_to :shipping_fee
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 1, message: 'Slect' }
    validates :condition_id, numericality: { other_than: 1, message: 'status Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'status Select' }
    validates :shipping_place_id, numericality: { other_than: 1, message: 'status Select' }
    validates :shipping_days_id, numericality: { other_than: 1, message: 'Select' }
    validates :cost, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'is out of setting range' }
  end
end
