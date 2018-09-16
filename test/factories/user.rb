FactoryBot.define do
  factory :user do
    email { 'russellwakefield4@gmail.com' }
    password { 'passw0rd!' }
    password_confirmation { 'passw0rd!' }

    trait :connected do
      schools { [FactoryBot.create(:school)] }
    end
  end
end
