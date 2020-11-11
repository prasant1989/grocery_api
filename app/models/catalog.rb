class Catalog < ApplicationRecord
  has_one_attached :image
  belongs_to :category, optional: true
  before_validation(on: :create) do
    self.unit = unit.upcase if attribute_present?("unit")
  end

  validates :unit , presence: true, inclusion: { in: UNIT_TYPES}
  validates :name , presence: true
  validates :name , uniqueness: true
  validates :price, presence: true

  scope :sorted, -> { order(name: 'asc') }
end
