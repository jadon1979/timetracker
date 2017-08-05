FactoryGirl.define do
  factory :task do
    summary { Faker::Lorem.sentence(3, true) }
    completed false
    feature
  end
end
