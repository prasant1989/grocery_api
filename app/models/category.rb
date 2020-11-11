class Category < ApplicationRecord
  has_many :catalogs

  validates :name , uniqueness: true
end
