class Item < ApplicationRecord
  has_many :item_images
  accepts_nested_attributes_for   :item_images
  has_many :messages
  belongs_to :user, optional: true
end
