# frozen_string_literal: true

# BooksLoans table
class CreateBookLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :book_loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
