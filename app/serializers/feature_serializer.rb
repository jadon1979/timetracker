class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description, :creator, :project,
    :story_points, :total_tasks, :created_at, :updated_at

  belongs_to :creator, each_serializer: EmployeeSerializer
  belongs_to :project, each_serializer: ProjectSerializer
  has_many :tasks, each_serializer: TasksSerializer
end
