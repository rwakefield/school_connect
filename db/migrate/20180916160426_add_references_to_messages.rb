class AddReferencesToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :school, foreign_key: true
  end
end
