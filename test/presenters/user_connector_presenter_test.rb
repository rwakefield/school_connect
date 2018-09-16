require 'test_helper'

describe 'UserConnectorPresenter' do
  describe '#can_set_school_ids?' do
    it 'will be false if the connector_params are not right' do
      user = create :user
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: {})
      presenter.can_set_school_ids?.must_equal false
    end

    it 'will be true if the connector_params are right and not emtpy' do
      user = create :user
      params = { user_connector: { school_ids: ['1'] } }
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: params)
      presenter.can_set_school_ids?.must_equal true
    end
  end

  describe '#school_mappings' do
    it 'will be empty when there are no schools' do
      user = create :user
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: {})
      presenter.school_mappings.must_be_empty
    end

    it 'will contain mappings when there are schools' do
      school = create :school
      user = create :user
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: {})
      expected_result = {
        box_id: "school_ids_#{school.id}".to_sym,
        school_id: school.id,
        school_name: school.name,
        is_enabled: false
      }
      presenter.school_mappings.must_equal [expected_result]
    end

    it 'will provide three columns of mappings' do
      10.times do
        create :school
      end
      user = create :user
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: {})
      presenter.column_one_mappings.size.must_equal 4
      presenter.column_two_mappings.size.must_equal 4
      presenter.column_three_mappings.size.must_equal 2
    end
  end

  describe '#school_ids' do
    it 'will return empty array if setup is not right' do
      user = create :user
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: {})
      presenter.school_ids.must_be_empty
    end
  end

  describe '#school_ids' do
    it 'will return school_ids if setup is right' do
      user = create :user
      params = { user_connector: { school_ids: ['1'] } }
      presenter = UserConnectorPresenter.new(presented_user: user, connector_params: params)
      presenter.school_ids.must_equal ['1']
    end
  end
end
