require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_uniqueness_of(:email) }

  it { should belong_to(:role) }

  it { should have_many(:task_resources) }
  it { should have_many(:tasks) }
end
