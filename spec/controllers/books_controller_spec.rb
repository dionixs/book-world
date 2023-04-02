# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  include FactoryBot::Syntax::Methods

  let(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }

  describe 'GET #index' do

    let!(:books) { create_list(:book, 50) }

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns http success for an anonymous user' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns http success for an authenticated user' do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @genres with cache' do
      allow(controller).to receive(:cache)
                             .with('index_genres', expires_in: 1.day)
                             .and_return(Genre.where(parent_id: nil))
      get :index
      expect(assigns(:genres)).to eq(Genre.where(parent_id: nil))
    end

    it 'paginates books to 30 per page' do
      get :index
      expect(assigns(:books)).to eq(Book.active.with_cover_and_authors.limit(30).decorate)
      expect(assigns(:pagy).count).to eq(50)
    end

    it 'paginates the second page correctly' do
      get :index, params: { page: 2 }
      expect(assigns(:books)).to eq(Book.active.with_cover_and_authors.offset(30).limit(20).decorate)
      expect(assigns(:pagy).page).to eq(2)
    end

    it 'renders index json' do
      get :index, format: :json
      expect(response).to render_template(:index)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET #new' do
    it 'redirects anonymous user to sign in' do
      get :new, params: { id: book.id }
      expect(response).to redirect_to(routes.url_helpers.new_user_session_path)
    end

    it 'allows signed in user to access new page' do
      sign_in user

      get :new, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new book' do
        sign_in user
        expect do
          post :create, params: { book: attributes_for(:book) }
        end.to change(Book, :count).by(1)
      end

      it 'redirects to the newly created book' do
        sign_in user
        post :create, params: { book: attributes_for(:book) }
        expect(response).to redirect_to(assigns(:book))
      end

      it 'sets a success notice' do
        sign_in user
        post :create, params: { book: attributes_for(:book) }
        expect(flash[:notice]).to eq(I18n.t('books.create'))
      end

      it 'responds with a redirect status' do
        post :create, params: { book: attributes_for(:book) }
        expect(response).to have_http_status(:redirect)
      end

    end

    context 'with invalid attributes' do
      it 'does not create a new book' do
        sign_in user
        expect do
          post :create, params: { book: attributes_for(:book, :invalid) }
        end.not_to change(Book, :count)
      end

      it 'renders the new template' do
        sign_in user
        post :create, params: { book: attributes_for(:book, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'redirects anonymous user to sign in' do
      get :edit, params: { id: book.id }
      expect(response).to redirect_to(routes.url_helpers.new_user_session_path)
    end

    it 'allows signed in user to access edit page' do
      sign_in user

      get :edit, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end
end
