FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.unique.word }
    summary { Faker::Lorem.sentence(3, true) }
    description { Faker::Lorem.paragraph(2) }
    project_status
    creator
  end
end
