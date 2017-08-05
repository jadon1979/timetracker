require 'rails_helper'

RSpec.describe Feature, type: :model do
  it { should validate_presence_of(:summary) }
  it { should validate_numericality_of(:story_points) }

  it { should belong_to(:creator) }
  it { should belong_to(:project) }
  it { should have_many(:tasks) }

  describe '#total_tasks' do
    subject! { create(:feature) }
    let!(:tasks) { create_list(:task, 5, feature: subject) }

    it { expect(subject.total_tasks).to eq(5) }
  end
end
