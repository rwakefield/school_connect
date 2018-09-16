class UserConnectorPresenter
  def initialize(presented_user:, connector_params:)
    @presented_user = presented_user
    @connector_params = connector_params
  end

  def can_set_school_ids?
    return false unless connector_params
    return false unless connector_params[:user_connector]
    return false unless connector_params[:user_connector][:school_ids]
    connector_params[:user_connector][:school_ids].size >= 1 ? true : false
  end

  def school_ids
    return [] unless can_set_school_ids?
    connector_params[:user_connector][:school_ids]
  end

  def school_mappings
    School.all.map { |school| get_mapping_for_school(school) }
  end

  private

  def get_mapping_for_school(school)
    mapping = {}
    mapping[:box_id] = "school_ids_#{school.id}".to_sym
    mapping[:school_id] = school.id
    mapping[:school_name] = school.name
    mapping[:is_enabled] = presented_user.schools.include?(school)
    mapping
  end

  attr_reader :presented_user, :connector_params
end
