class EmployeesController < ApplicationController
  include Concerns::DefaultActions

  private

  def permitted_params
    params.permit(:first_name, :last_name, :email, :role_id)
  end
end
