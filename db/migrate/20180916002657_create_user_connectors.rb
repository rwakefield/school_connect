class CreateUserConnectors < ActiveRecord::Migration[5.0]
  def change
    create_table :user_connectors do |t|
      t.integer :user_id
      t.integer :school_id

      t.timestamps
    end

    add_index :user_connectors, [:user_id, :school_id]
  end
end
