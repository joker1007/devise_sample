# frozen_string_literal: true

class DeviseCreateUserRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_registrations do |t|
      ## Confirmable
      t.string   :confirmation_token,  null: false
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.string   :email

      t.timestamps null: false
    end

    add_index :user_registrations, :confirmation_token, unique: true
    add_index :user_registrations, :unconfirmed_email, unique: true
  end
end
