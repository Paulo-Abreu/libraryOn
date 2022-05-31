class BooksLoansController < ApplicationController
  before_action :authorize_request

  before_action :load_book, only: [:create]

  before_action :load_loan, only: [:update]

  def create
    loan = BookLoan.new(user: @current_user, book_id: @book.id, loan_until: (Date.today + 7.days))
    
    if loan.save
      render json: loan, status: 201
    else
      render json: loan.errors.messages, status: 422
    end
  end

  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors.messages, status: 422
    end
  end

  private

  def loan_params
    params.require(:book_loan).permit(:loan_type)
  end

  def load_loan
    @loan = BookLoan.find(params[:id])
  end

  def load_book
    @book = Book.find(params.dig(:book_loan, :book_id))
  end
end
