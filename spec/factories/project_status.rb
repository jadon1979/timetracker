FactoryGirl.define do
  factory :project_status do
    name { Faker::Lorem.unique.word }
  end
end
