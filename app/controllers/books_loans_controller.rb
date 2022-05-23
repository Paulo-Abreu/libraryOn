class BooksLoansController < ApplicationController
  before_action :authorize_request

  before_action :load_book, only: [:create]

  def create
    
    loan = BookLoan.new(user:@current_user, book_id:@book.id)
    if loan.save
      render json: loan, status: 201
    else
      render json: loan.errors.messages, status: 422
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description)
  end

  def load_book
    @book = Book.find(params.dig(:book_loan, :book_id))
  end
end
