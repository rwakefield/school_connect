FactoryBot.define do
  factory :school_message do
    header { 'Message Header' }
    body { 'Message Body' }
    association :school
  end
end
