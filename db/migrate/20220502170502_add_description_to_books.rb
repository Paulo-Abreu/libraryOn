# frozen_string_literal: true

# Add descripiton to books table
class AddDescriptionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :description, :string
  end
end
