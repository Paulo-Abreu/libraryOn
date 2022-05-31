class AddLoanUntilToBookLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :book_loans, :loan_until, :datetime
  end
end
