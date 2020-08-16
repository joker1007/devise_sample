# frozen_string_literal: true

class DeviseCreateUserDatabaseAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_database_authentications do |t|
      t.references :user, foreign_key: true, dependent: :destroy,  index: {unique: true}
      ## Database authenticatable
      t.string :email,              null: false
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end

    add_index :user_database_authentications, :email, unique: true
  end
end
