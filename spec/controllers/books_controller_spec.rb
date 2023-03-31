# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  include FactoryBot::Syntax::Methods

  let(:user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }

  describe 'GET #index' do

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
  end

  describe 'GET #edit' do
    it 'redirects anonymous user to sign in' do
      get :edit, params: { id: book.id }
      expect(response).to redirect_to(routes.url_helpers.new_user_session_path)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

end
