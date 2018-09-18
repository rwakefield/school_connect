FactoryBot.define do
  factory :api_user do
    email { 'russellwakefield4@gmail.com' }
    password { 'passw0rd!' }
    password_confirmation { 'passw0rd!' }
  end
end
