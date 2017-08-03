FactoryGirl.define do
  factory :feature do
    summary { Faker::Lorem.sentence(3, true) }
    description { Faker::Lorem.paragraph(2) }
    story_points { Faker::Number.digit }
    project
    creator
  end
end
