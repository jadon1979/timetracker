require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:creator) }
  it { should belong_to(:project_status) }
  it { should have_many(:features) }

  describe 'Project#archived' do
    before do
      5.times do |i|
        is_archived = i < 3 ? true : false
        create(:project, archived: is_archived)
      end
    end

    it { expect(Project.archived(true).count).to eq(3) }
  end

  describe 'Project#status' do
    before do
      create(:project_status, name: 'New')
      create(:project_status, name: 'Completed')

      5.times do |i|
        project_status = i < 3 ? ProjectStatus.first : ProjectStatus.last
        create(:project, project_status: project_status)
      end
    end

    it { expect(Project.status('New').count).to eq(3) }
    it { expect(Project.status('Completed').count).to eq(2) }
  end

  describe '#story_points' do
    subject! { create(:project) }
    let!(:features) { create_list(:feature, 5, story_points: 1, project_id: subject.id) }

    it { expect(subject.story_points).to eq(5) }
  end

  describe '#total_features' do
    subject! { create(:project) }
    let!(:features) { create_list(:feature, 5, project: subject) }

    it { expect(subject.total_features).to eq(5) }
  end
end
