# frozen_string_literal: true

# Add user_typer to users table
class AddUserTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_type, :integer, default: 0
  end
end
