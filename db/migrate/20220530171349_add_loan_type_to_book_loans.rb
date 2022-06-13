# frozen_string_literal: true

# Add loan_type to booksloans table
class AddLoanTypeToBookLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :book_loans, :loan_type, :integer, default: 0
  end
end
