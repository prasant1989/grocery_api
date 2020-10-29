class Catalog < ApplicationRecord
  before_validation(on: :create) do
    self.unit = unit.upcase if attribute_present?("unit")
  end
  UNIT_TYPES = ['KG', 'L', 'UNIT']
  validates :unit , presence: true, inclusion: { in: UNIT_TYPES}
  validates :name , presence: true
  validates :name , uniqueness: true
end
