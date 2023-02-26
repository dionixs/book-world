require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  before(:each) do
    @book = FactoryBot.create(:book)
    @review = FactoryBot.create(:review, book: @book)
  end

  describe 'GET /index' do
    it 'renders the index template' do
      get book_reviews_path(@book)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get book_review_path(@book, @review)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders the new template' do
      get new_book_review_path(@book)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new review' do
        expect do
          post book_reviews_path(@book), params: { review: FactoryBot.attributes_for(:review) }
        end.to change { Review.count }.by(1)

        expect(response).to redirect_to("#{book_path(@book)}#review-#{assigns(:review).id}")
        follow_redirect!
        expect(response.body).to include('Review was successfully created.')
      end

      it 'returns a JSON response with the new review' do
        post book_reviews_path(@book, format: :json), params: { review: FactoryBot.attributes_for(:review) }
        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body)
        expect(json['title']).to eq('My Review')
        expect(json['body']).to eq('This is a great book!')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new review' do
        expect do
          post book_reviews_path(@book), params: { review: { title: nil, body: nil } }
        end.to_not change { Review.count }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end

      it 'returns a JSON response with errors' do
        post book_reviews_path(@book, format: :json), params: { review: { title: nil, body: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body)
        expect(json['title']).to include("can't be blank")
        expect(json['title']).to include("is too short (minimum is 1 character)")
        expect(json['body']).to include("can't be blank")
        expect(json['body']).to include("is too short (minimum is 10 characters)")
      end
    end
  end

  describe 'GET /edit' do
    it 'renders the edit template' do
      get edit_book_review_path(@book, @review)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT /update' do
    it 'updates the review' do
      put book_review_path(@book, @review), params: { review: { title: 'Updated Title' } }
      expect(response).to redirect_to("#{book_path(@book)}#review-#{@review.id}")
      expect(@review.reload.title).to eq('Updated Title')
    end

    it 'renders the edit template with errors if review is invalid' do
      put book_review_path(@book, @review), params: { review: { title: nil, body: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the review' do
      expect do
        delete book_review_path(@book, @review)
      end.to change { Review.count }.by(-1)
      expect(response).to redirect_to(book_path(@book))
    end
  end
end