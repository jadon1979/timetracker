require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:summary) }

  it { should belong_to(:feature) }

  it { should have_many(:task_resources) }
  it { should have_many(:employees) }

  describe '#total_hours' do
    subject! { create(:task) }
    let!(:task_resources) {
      create_list(:task_resource, 4, task: subject, hours: 2.5)
    }

    it { expect(subject.total_hours).to eq(10) }
  end

  describe '#total_hours_by_employee' do
    subject! { create(:task) }
    let!(:employee) { create(:employee) }

    before do
      5.times do |i|
        employee = i < 3 ? Employee.first : Employee.last
        create(:task_resource, task: subject, employee: employee, hours: i+1)
      end
    end

    it { expect(subject.total_hours_by_employee(Employee.first.id)).to eq(6) }
    it { expect(subject.total_hours_by_employee(Employee.last.id)).to eq(9) }
  end
end
