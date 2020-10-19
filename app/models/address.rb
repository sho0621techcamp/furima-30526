class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  with_options presence: true do
    validates :post_code
    validates :prefecture_id,  numericarity: { other_than: 1}
    validates :city
    validates :address
    validates :phone_number
    validates :order
  end
  


  belongs_to :order
end
