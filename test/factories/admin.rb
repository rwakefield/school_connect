FactoryBot.define do
  factory :admin do
    email { 'admin_user@gmail.com' }
    password { 'passw0rd!' }
    password_confirmation { 'passw0rd!' }
  end
end
