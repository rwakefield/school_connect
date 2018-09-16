class UserConnectorPresenter
  attr_accessor :column_one_mappings, :column_two_mappings, :column_three_mappings

  def initialize(presented_user:, connector_params:)
    @presented_user = presented_user
    @connector_params = connector_params
    @column_one_mappings = []
    @column_two_mappings = []
    @column_three_mappings = []
    place_schools_in_columns
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
    @school_mappings ||= School.all.order(:name).map { |school| get_mapping_for_school(school) }
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

  def place_schools_in_columns
    per_column = School.count / 3
    school_mappings.each_with_index do |school_mapping, index|
      if index <= per_column
        column_one_mappings.push(school_mapping)
      elsif index <= (per_column * 2) + 1
        column_two_mappings.push(school_mapping)
      else
        column_three_mappings.push(school_mapping)
      end
    end
  end

  attr_reader :presented_user, :connector_params
end
