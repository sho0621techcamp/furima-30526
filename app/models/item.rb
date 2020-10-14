class Item < ApplicationRecord
  validates :name,  presence: true
  validates :text,  presence: true
  validates :price, presence: true
  
end
