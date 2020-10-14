class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  validates :name,  presence: true
  validates :text,  presence: true
  validates :price, presence: true

end
