FactoryBot.define do
  factory :message do
    header { 'Message Header' }
    body { 'Message Body' }
    type { 'SchoolMessage'}
  end
end
