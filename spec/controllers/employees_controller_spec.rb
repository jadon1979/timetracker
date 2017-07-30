require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  describe 'GET index' do
    before do
      create_list(:employee, 5)
    end

    it 'has a 200 status code' do
      get :index
      expect(response).to be_ok
    end
  end
end
