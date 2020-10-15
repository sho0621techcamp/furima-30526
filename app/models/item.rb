class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day
  
  validates :image,              presence: true
  validates :name,               presence: true
  validates :text,               presence: true

  VALID_PRICE_REGEX = /\A([1-9]\d*,)*[1-9]\d*\z/
  validates :price,              presence: true, format: { with: VALID_PRICE_REGEX},
  numericality: { 
  only_integer: true,
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9999999 }
  
  
  validates :user,               presence: true
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :shipping_fee_id,    presence: true
  validates :shipping_region_id, presence: true
  validates :shipping_days_id,   presence: true


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,        numericality: { other_than: 1 }
  validates :status_id,          numericality: { other_than: 1 }
  validates :shipping_fee_id,    numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 0 }
  validates :shipping_days_id,   numericality: { other_than: 1 }


  has_one :order
  belongs_to :user
  has_many_attached :image

end
