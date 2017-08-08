FactoryGirl.define do
  factory :task_resource do
    summary { Faker::Lorem.sentence(3, true) }
    hours { Faker::Number.digit }
    employee
    task
  end
end
