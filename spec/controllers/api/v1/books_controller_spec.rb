# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  describe 'GET /books' do
    let(:user) { create(:user) }
    let!(:book) { create(:book, user: user) }

    it 'returns all books' do
      authorize user
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /books' do
    let!(:book) { create(:book, user: user) }
    let(:user) { create(:user) }

    context 'when success' do
      it 'create a new book' do
        post :create, params: { book: { title: book.title, description: book.description} }
        expect(response).to have_http_status(:created)
      end
    end

    context 'when error' do
      it 'create a new book' do
        authorize user
        post :create, params: { book: { title: book.title, description: book.description} }
        expect(response).to have_http_status(422)
      end
    end
  end
end
