class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email,
    :role, :created_at, :updated_at

end
