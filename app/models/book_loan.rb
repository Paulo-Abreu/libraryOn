class BookLoan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum loan_type: [:not_returned, :returned]

end
