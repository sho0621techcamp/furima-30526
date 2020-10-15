class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :user
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_region_id
    validates :shipping_days_id
  end

  VALID_PRICE_REGEX = /\A([1-9]\d*,)*[1-9]\d*\z/.freeze
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX },
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999 }

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_region_id
    validates :shipping_days_id
  end

  has_one :order
  belongs_to :user
  has_many_attached :image
end
