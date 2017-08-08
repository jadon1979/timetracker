class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_status, :summary,
    :description, :story_points, :total_features,
    :created_at, :updated_at

  belongs_to :creator, each_serializer: EmployeeSerializer
end
