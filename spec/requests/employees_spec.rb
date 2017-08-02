require "rails_helper"

RSpec.describe "Employees", type: :request do
  describe 'GET /' do
    let!(:employees) { create_list(:employee, 5) }

    subject! { get '/employees' }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('employee/collection') }
    it { expect(JSON.parse(response.body)['data'].count).to eq(5) }
  end

  describe 'GET /:id' do
    let!(:employee) { create(:employee) }
    subject! { get "/employees/#{employee.id}" }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('employee/resource') }
  end

  describe 'POST /' do
    let!(:role) { create(:role) }

    subject! { post "/employees", params: {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      role_id: role.id
    }}

    it { expect(response.status).to eq(201) }
    it { expect(response.body).to match_response_schema('employee/resource') }
  end

  describe 'PUT /:id' do
    let!(:employee) { create(:employee, email: 'test@test.com') }
    let(:role) { create(:role, name: 'Admin') }

    subject! { put "/employees/#{employee.id}", params: {
      email: 'test123@test.com',
      role_id: role.id
    }}

    it { expect(response).to be_success }
    it { expect(response.body).to match_response_schema('employee/resource') }
    it { expect(JSON.parse(response.body)['email']).to eq 'test123@test.com' }
    it { expect(JSON.parse(response.body)['role_name']).to eq 'Admin' }
  end

  describe 'DELETE /:id' do
    let!(:employee) { create(:employee) }
    subject! { delete "/employees/#{employee.id}" }

    it { expect(response).to be_success }
    it { expect(Employee.count).to eq(0) }
  end
end
