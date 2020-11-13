class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :is_active, :catalogs
end
