class CatalogSerializer < ActiveModel::Serializer
  attributes :id,:name,:unit,:price, :category
end
