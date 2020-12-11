class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:email, :contact
end
