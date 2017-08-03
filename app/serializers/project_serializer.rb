class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_status, :creator, :summary,
    :description, :story_points, :total_features,
    :created_at, :updated_at

  def creator
    return {} if object.creator.nil?
    {
      id: object.creator.id,
      name: object.creator.full_name
    }
  end
end
