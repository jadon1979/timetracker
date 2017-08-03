class FeaturesSerializer < ActiveModel::Serializer
  attributes :id, :summary, :creator, :story_points,
     :created_at, :updated_at

  def creator
    return {} if object.creator.nil?
    {
      id: object.creator.id,
      name: object.creator.full_name
    }
  end
end
