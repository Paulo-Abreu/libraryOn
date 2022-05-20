module Api
  module V1
    class BooksController < ApplicationController
      before_action :authorize_request
    
      before_action :load_book, only: [:update, :destroy]
       
      def index
        render json: Book.all
      end
    
      def create
        book = Book.new(book_params)
        book.user = @current_user
        
        if book.save
          render json: book, status: 201
        else
          render json: book.errors.messages, status: 422
        end
      end
    
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors.messages, status: 422
        end
      end
    
      def destroy
        if @book.destroy
          render json:  { message: 'deleted successfully' }, status: 200
        else
          render json: @book.errors.messages, status: 422
        end
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :description)
      end
    
      def load_book
        @book = Book.find(params[:id])
      end
    end  
  end
end
