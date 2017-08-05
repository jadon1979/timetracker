require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:summary) }
  it { should belong_to(:feature) }
end
