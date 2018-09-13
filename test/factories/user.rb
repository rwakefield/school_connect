FactoryBot.define do
  factory :user do
    email { 'russellwakefield4@gmail.com' }
    password { 'passw0rd!' }
    password_confirmation { 'passw0rd!' }

    trait :admin do
      admin { true }
    end
  end
end
