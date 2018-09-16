require 'test_helper'

describe 'SchoolMessage' do
  it 'must be valid' do
    school_message = build :school_message
    school_message.valid?.must_equal true
  end

  describe 'relations' do
    it 'must belong_to school' do
      school_message = create :school_message
      school = School.first
      school_message.school.must_equal school
      Message.count.must_equal 1
      School.count.must_equal 1
    end
  end
end
