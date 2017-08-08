require 'rails_helper'

RSpec.describe TaskResource, type: :model do
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:hours) }
  it { should validate_numericality_of(:hours) }

  it { should belong_to(:employee) }
  it { should belong_to(:task) }
end
