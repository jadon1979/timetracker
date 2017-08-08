class FeaturesSerializer < ActiveModel::Serializer
  attributes :id, :summary, :creator, :story_points,
     :total_tasks, :created_at, :updated_at

  belongs_to :creator, each_serializer: EmployeeSerializer
end
