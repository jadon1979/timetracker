require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe 'GET /' do
    let!(:projects) { create_list(:project, 5) }

    subject! { get '/projects' }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('project/collection') }
    it { expect(JSON.parse(response.body)['data'].count).to eq(5) }
  end

  describe 'GET /:id' do
    let!(:project) { create(:project) }
    subject! { get "/projects/#{project.id}" }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('project/resource') }
  end

  describe 'POST /' do
    let!(:creator) { create(:creator) }
    let!(:project_status) { create(:project_status) }

    subject! { post "/projects", params: {
      name: Faker::Beer.name,
      creator_id: creator.id,
      project_status_id: project_status.id,
      summary: Faker::Lorem.sentence(3, true),
      description: Faker::Lorem.paragraph(2)
    }}

    it { expect(response.status).to eq(201) }
    it { expect(response.body).to match_response_schema('project/resource') }
  end

  describe 'PUT /:id' do
    let!(:project) { create(:project, name: 'test') }
    let!(:creator) { create(:creator) }
    let!(:project_status) { create(:project_status) }

    subject! { put "/projects/#{project.id}", params: { name: 'test abc' }}

    it { expect(response).to be_success }
    it { expect(response.body).to match_response_schema('project/resource') }
    it { expect(JSON.parse(response.body)['name']).to eq 'test abc' }
  end

  describe 'DELETE /:id' do
    let!(:project) { create(:project) }
    subject! { delete "/projects/#{project.id}" }

    it { expect(response).to be_success }
    it { expect(Project.count).to eq(0) }
  end
end
