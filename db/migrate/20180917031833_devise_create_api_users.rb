# frozen_string_literal: true

class DeviseCreateApiUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :api_users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :reset_password_token
      t.timestamps
    end
    add_index :api_users, :email, unique: true
    add_index :api_users, :reset_password_token, unique: true
  end
end
