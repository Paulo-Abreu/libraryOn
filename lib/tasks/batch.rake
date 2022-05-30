namespace :batch do
  desc "TODO"
  task see_loans: :environment do
    puts "Follow the loans bellow..."
    @loans = BookLoan.find_by loan_type:0
    puts @loans
  end

end
