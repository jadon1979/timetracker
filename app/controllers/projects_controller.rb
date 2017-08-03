class ProjectsController < ApplicationController
  include Concerns::DefaultActions
  has_scope :archived, default: false

  private

  def permitted_params
    params.permit(:name, :creator_id, :project_status_id, :archived,
      :summary, :description
    )
  end
end
