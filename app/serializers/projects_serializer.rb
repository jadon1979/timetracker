class ProjectsSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_features, :created_at, :updated_at
end
