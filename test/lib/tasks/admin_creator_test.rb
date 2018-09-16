require 'rake'
require 'test_helper'

describe 'AdminCreator' do
  before do
    Rake::Task.clear
    SchoolConnect::Application.load_tasks
  end

  subject { Rake::Task['admin_creator:create'] }

  describe '#create' do
    it 'will raise errors when not passed valid input' do
      assert_raises(ActiveRecord::RecordInvalid) do
        subject.invoke
      end
    end

    it 'will create admin when passed valid arguments' do
      subject.invoke('email@email.com', 'password')
    end
  end
end
