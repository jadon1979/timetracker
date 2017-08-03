class FeaturesController < ApplicationController
  include Concerns::DefaultActions

  private

  def permitted_params
    params.permit(:summary, :description, :creator_id,
      :project_id, :story_points
    )
  end
end
