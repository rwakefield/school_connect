require 'test_helper'

describe 'SchoolLoader' do
  describe '#load_schools' do
    it 'will load schools' do
      SchoolLoader.load_schools
      assert_schools
    end

    it 'will be idempotent' do
      SchoolLoader.load_schools
      SchoolLoader.load_schools
      assert_schools
    end
  end
end

def assert_schools
  School.count.must_equal 100
end
