namespace :batch do
  desc "TODO"
  task see_loans: :environment do
    puts "Follow the loans bellow..."
    @loans = BookLoan.all
    puts @loans
  end

end
