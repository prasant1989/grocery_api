class UserSerializer < ActiveModel::Serializer
  attributes :username,:email, :contact, :roles

  def roles
    object.roles.map(&:name)
  end
end
