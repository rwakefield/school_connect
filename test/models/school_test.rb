require 'test_helper'

describe 'School' do
  it 'must be valid' do
    school = build :school
    school.valid?.must_equal true
  end

  describe 'relations' do
    it 'must have many users through user connectors' do
      create :user_connector
      school = School.first
      user = User.first

      school.users.must_equal [user]
      School.count.must_equal 1
      User.count.must_equal 1
    end
  end

  describe 'dependent data' do
    it 'must remove related user_connectors when self is destroyed' do
      create :user_connector
      school = School.first
      school.destroy
      UserConnector.count.must_equal 0
    end
  end

  describe 'validations' do
    it 'must validate the presence of name' do
      school = build :school, name: nil
      school.valid?.must_equal false
      school.errors.full_messages.must_equal ["Name can't be blank"]
    end
  end
end
