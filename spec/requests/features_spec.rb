require "rails_helper"

RSpec.describe "Features", type: :request do
  describe 'GET /' do
    let!(:project) { create(:project) }
    let!(:features) { create_list(:feature, 5, project_id: project.id) }

    subject! { get "/projects/#{project.id}/features" }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('feature/collection') }
    it { expect(JSON.parse(response.body)['data'].count).to eq(5) }
  end

  describe 'GET /:id' do
    let!(:feature) { create(:feature) }
    let!(:project) { feature.project }

    subject! { get "/projects/#{project.id}/features/#{feature.id}" }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('feature/resource') }
  end

  describe 'POST /' do
    let!(:project) { create(:project) }
    let!(:creator) { create(:creator) }

    subject! { post "/projects/#{project.id}/features", params: {
      creator_id: creator.id,
      project_id: project.id,
      story_points: 5,
      summary: Faker::Lorem.sentence(3, true),
      description: Faker::Lorem.paragraph(2)
    }}

    it { expect(response.status).to eq(201) }
    it { expect(response.body).to match_response_schema('feature/resource') }
  end

  describe 'PUT /:id' do
    let!(:feature) { create(:feature, story_points: 0) }
    let!(:project) { feature.project }
    let!(:creator) { feature.creator }

    subject! { put "/projects/#{project.id}/features/#{feature.id}",
      params: {
        story_points: 1
      }
    }

    it { expect(response).to be_success }
    it { expect(response.body).to match_response_schema('feature/resource') }
    it { expect(JSON.parse(response.body)['story_points']).to eq 1}
  end

  describe 'DELETE /:id' do
    let!(:feature) { create(:feature) }
    let!(:project) { feature.project }

    subject! { delete "/projects/#{project.id}/features/#{feature.id}" }

    it { expect(response).to be_success }
    it { expect(Feature.count).to eq(0) }
  end
end
