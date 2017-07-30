class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  attribute :role_name do
    object.role.name
  end  
end
