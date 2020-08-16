# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false

      t.timestamps null: false
    end

    add_index :users, :nickname, unique: true
  end
end
