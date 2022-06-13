# frozen_string_literal: true

namespace :batch do
  desc 'TODO'
  task see_loans: :environment do
    puts 'Follow the loans bellow...'
    @loans = BookLoan.where('loan_until > ?', Date.today)
    puts @loans
    puts ' '
    puts 'Follow the LATE loans bellow...'
    @late_loans = BookLoan.where('loan_until < ?', Date.today)
    puts @late_loans
  end

end
