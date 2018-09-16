FactoryBot.define do
  factory :user_connector do
    association :user
    association :school
  end
end
