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

  describe '#story_points' do
    subject! { create(:project) }
    let!(:features) { create_list(:feature, 5, story_points: 1, project_id: subject.id) }

    it { expect(subject.story_points).to eq(5) }
  end
end
