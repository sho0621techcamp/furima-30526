class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day
  

  validates :name,               presence: true
  validates :text,               presence: true
  validates :price,              presence: true
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
  has_one_attached :image

end
