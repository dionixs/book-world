require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:book) { FactoryBot.create(:book) }
  let!(:review1) { FactoryBot.create(:review, book: book) }
  let!(:review2) { FactoryBot.create(:review, book: book) }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { book_id: book.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index, params: { book_id: book.id }
      expect(response).to render_template(:index)
    end

    it "assigns @book" do
      get :index, params: { book_id: book.id }
      expect(assigns(:book)).to eq(book)
    end

    it "assigns @reviews" do
      get :index, params: { book_id: book.id }
      expect(assigns(:reviews)).to match_array([review1, review2])
    end

    it "orders the reviews by most recent first" do
      get :index, params: { book_id: book.id }
      expect(assigns(:reviews)).to eq([review2, review1])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { book_id: book.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new, params: { book_id: book.id }
      expect(response).to render_template(:new)
    end

    it "assigns @book" do
      get :new, params: { book_id: book.id }
      expect(assigns(:book)).to eq(book)
    end

    it "assigns @review" do
      get :new, params: { book_id: book.id }
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "GET #show" do
    let!(:review2) { FactoryBot.create(:review, book: book) }

    it "returns http success" do
      get :show, params: { book_id: book.id, id: review1.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params: { book_id: book.id, id: review1.id }
      expect(response).to render_template(:show)
    end

    it "assigns @book" do
      get :show, params: { book_id: book.id, id: review1.id }
      expect(assigns(:book)).to eq(book)
    end

    it "assigns @review" do
      get :show, params: { book_id: book.id, id: review1.id }
      expect(assigns(:review)).to eq(review1)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new review" do
        expect {
          post :create, params: { book_id: book.id, review: { title: 'Test review', body: "Test review" } }
        }.to change(Review, :count).by(1)
      end

      it "redirects to the book page" do
        post :create, params: { book_id: book.id, review: { title: 'Test review', body: "Test review" } }
        expect(response).to redirect_to("#{book_url(book)}#review-#{assigns(:review).id}")
      end

      it "sets a success flash message" do
        post :create, params: { book_id: book.id, review: { title: 'Test review', body: "Test review" } }
        expect(flash[:success]).to eq('Review was successfully created.')
      end
    end

    context "with invalid attributes" do
      it "does not create a new review" do
        expect {
          post :create, params: { book_id: book.id, review: { body: "" } }
        }.to_not change(Review, :count)
      end

      it "renders the new template" do
        post :create, params: { book_id: book.id, review: { body: "" } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let!(:review) { FactoryBot.create(:review, book: book) }

    it "returns http success" do
      get :edit, params: { book_id: book.id, id: review.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get :edit, params: { book_id: book.id, id: review.id }
      expect(response).to render_template(:edit)
    end

    it "assigns @book" do
      get :edit, params: { book_id: book.id, id: review.id }
      expect(assigns(:book)).to eq(book)
    end

    it "assigns @review" do
      get :edit, params: { book_id: book.id, id: review.id }
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "PATCH #update" do
    let!(:review) { FactoryBot.create(:review, book: book) }
    let(:valid_attributes) do
      { title: "Updated Title", body: "Updated Body" }
    end
    let(:invalid_attributes) do
      { title: "", body: "" }
    end

    context "with valid params" do
      it "updates the requested review" do
        patch :update, params: { book_id: book.id, id: review.id, review: valid_attributes }
        review.reload
        expect(review.title).to eq("Updated Title")
        expect(review.body).to eq("Updated Body")
      end

      it "redirects to the book" do
        patch :update, params: { book_id: book.id, id: review.id, review: valid_attributes }
        expect(response).to redirect_to("#{book_path(book)}#review-#{review.id}")
      end
    end

    context "with invalid params" do
      it "does not update the review" do
        patch :update, params: { book_id: book.id, id: review.id, review: invalid_attributes }
        review.reload
        expect(review.title).not_to eq("")
        expect(review.body).not_to eq("")
      end

      it "renders the edit template" do
        patch :update, params: { book_id: book.id, id: review.id, review: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:book) { FactoryBot.create(:book) }
    let!(:review) { FactoryBot.create(:review, book: book) }

    it 'destroys the requested review' do
      expect {
        delete :destroy, params: { book_id: book.id, id: review.id }
      }.to change(Review, :count).by(-1)
    end

    it 'redirects to the book page' do
      delete :destroy, params: { book_id: book.id, id: review.id }
      expect(response).to redirect_to(book_path(book))
    end

    it 'sets a flash message' do
      delete :destroy, params: { book_id: book.id, id: review.id }
      expect(flash[:success]).to eq('Review was successfully destroyed.')
    end
  end
end