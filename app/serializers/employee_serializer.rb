class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
    :created_at, :updated_at

  attribute :role_name do
    object.role.name
  end
end
