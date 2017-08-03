class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description, :creator, :project,
    :story_points, :created_at, :updated_at

  def creator
    return {} if object.creator.nil?
    {
      id: object.creator.id,
      name: object.creator.full_name
    }
  end

  def project
    return {} if object.project.nil?
    {
      id: object.project.id,
      name: object.project.name
    }
  end
end
