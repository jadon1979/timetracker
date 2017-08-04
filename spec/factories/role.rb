FactoryGirl.define do
  factory :role do
    name { Faker::Name.unique.title }
  end
end
