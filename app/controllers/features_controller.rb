class FeaturesController < ApplicationController
  include Concerns::DefaultActions
  before_action :deconvolute_param_names, only: [:create, :update]

  private

  def deconvolute_param_names
    params.tap { |param| param[:tasks_attributes] = param[:tasks] }
  end

  def permitted_params
    params.permit(:summary, :description, :creator_id,
      :project_id, :story_points,
      tasks_attributes: [:id, :summary, :completed, :_destroy]
    )
  end
end
