require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe 'GET /:id' do
    let!(:feature) { create(:feature) }
    let!(:tasks) { create_list(:task, 5, feature: Feature.first) }

    subject! { get "/projects/#{feature.project.id}/features/#{feature.id}" }

    it { expect(response).to be_success }
    it { expect(response).to match_response_schema('feature/resource') }
    it { expect(JSON.parse(response.body)['tasks'].count).to eq(5) }
  end

  describe 'POST /' do
    let!(:project) { create(:project) }
    let!(:creator) { create(:creator) }

    subject! { post "/projects/#{project.id}/features", params: {
      creator_id: creator.id,
      project_id: project.id,
      story_points: 5,
      summary: Faker::Lorem.sentence(3, true),
      description: Faker::Lorem.paragraph(2),
      tasks: [
        { summary: Faker::Lorem.sentence(3, true) },
        { summary: Faker::Lorem.sentence(3, true) },
        { summary: Faker::Lorem.sentence(3, true) },
        { summary: Faker::Lorem.sentence(3, true) },
        { summary: Faker::Lorem.sentence(3, true) }
      ]
    }}

    it { expect(response.status).to eq(201) }
    it { expect(response.body).to match_response_schema('feature/resource') }
    it { expect(JSON.parse(response.body)['tasks'].count).to eq(5) }
  end

  describe 'PUT /:id' do
    let!(:feature) { create(:feature) }
    let!(:tasks) { create_list(:task, 2, feature: feature) }

    subject! { put "/projects/#{feature.project.id}/features/#{feature.id}",
      params: {
        tasks: [
          {
            id: feature.tasks.first.id,
            summary: 'Test ABC'
          },
          {
            id: feature.tasks.last.id,
            _destroy: true
          }
        ]
      }
    }

    it { expect(response).to be_success }
    it { expect(response.body).to match_response_schema('feature/resource') }
    it { expect(JSON.parse(response.body)['tasks'].first['summary']).to eq 'Test ABC' }
    it { expect(JSON.parse(response.body)['tasks'].count).to eq(1) }
  end

  describe 'DELETE /:id' do
    let!(:feature) { create(:feature) }
    let!(:tasks) { create_list(:task, 5, feature: feature) }

    subject! { delete "/projects/#{feature.project.id}/features/#{feature.id}" }

    it { expect(response).to be_success }
    it { expect(Task.count).to eq(0) }
  end
end
