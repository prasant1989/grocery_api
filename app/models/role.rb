class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, -> { order(:name).distinct }, through: :user_roles

  validates :name, presence: true, uniqueness: true
end
