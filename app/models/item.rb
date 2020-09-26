class Item < ApplicationRecord
  has_many :items_imgs
  belongs_to :user
  belongs_to :category
end
