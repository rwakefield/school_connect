class CreateMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :header
      t.string :body
      t.string :type
      t.timestamps
    end
  end
end
