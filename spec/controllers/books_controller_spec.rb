require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let!(:book) { FactoryBot.create(:book) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns @books" do
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "returns JSON" do
      get :index, format: :json
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params: { id: book.id }
      expect(response).to render_template(:show)
    end

    it "assigns @book" do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

    it "assigns @reviews" do
      review = FactoryBot.create(:review, book: book)
      get :show, params: { id: book.id }
      expect(assigns(:reviews)).to eq([review])
    end

    it "returns JSON" do
      get :show, params: { id: book.id }, format: :json
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns @book" do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new book" do
        expect {
          post :create, params: { book: FactoryBot.attributes_for(:book) }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, params: { book: FactoryBot.attributes_for(:book) }
        expect(response).to redirect_to(Book.last)
      end

      it "sets a success flash message" do
        post :create, params: { book: FactoryBot.attributes_for(:book) }
        expect(flash[:success]).to eq('Book was successfully created.')
      end

      it "returns JSON" do
        post :create, params: { book: FactoryBot.attributes_for(:book) }, format: :json
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "returns a created status code" do
        post :create, params: { book: FactoryBot.attributes_for(:book) }, format: :json
        expect(response.status).to eq(201)
      end

      it "includes the book information in the JSON response" do
        post :create, params: { book: FactoryBot.attributes_for(:book) }, format: :json
        book_json = JSON.parse(response.body)
        expect(book_json['title']).to eq(Book.last.title)
        expect(book_json['author']).to eq(Book.last.author)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        post :create, params: { book: FactoryBot.attributes_for(:book, title: nil) }
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "renders the new template" do
        post :create, params: { book: FactoryBot.attributes_for(:book, title: nil) }
        expect(response).to render_template(:new)
      end

      it "returns JSON with errors" do
        post :create, params: { book: FactoryBot.attributes_for(:book, title: nil) }, format: :json
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('title')
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get :edit, params: { id: book.id }
      expect(response).to render_template(:edit)
    end

    it "assigns @book" do
      get :edit, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the book" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }
        book.reload
        expect(book.title).to eq("New Title")
      end

      it "redirects to the updated book" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }
        expect(response).to redirect_to(book)
      end

      it "sets a success flash message" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }
        expect(flash[:success]).to eq('Book was successfully updated.')
      end

      it "returns JSON" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }, format: :json
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "returns an OK status code" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }, format: :json
        expect(response.status).to eq(200)
      end

      it "includes the updated book information in the JSON response" do
        patch :update, params: { id: book.id, book: { title: "New Title" } }, format: :json
        book_json = JSON.parse(response.body)
        expect(book_json['title']).to eq("New Title")
        expect(book_json['author']).to eq(book.author)
      end
    end

    context "with invalid params" do
      it "assigns the book as @book" do
        patch :update, params: { id: book.id, book: { title: "" } }
        expect(assigns(:book)).to eq(book)
      end

      it "renders the edit template" do
        patch :update, params: { id: book.id, book: { title: "" } }
        expect(response).to render_template(:edit)
      end

      it "returns JSON with errors" do
        patch :update, params: { id: book.id, book: { title: "" } }, format: :json
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('title')
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the book" do
      expect {
        delete :destroy, params: { id: book.id }
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books index page" do
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to(books_url)
    end

    it "sets a success flash message" do
      delete :destroy, params: { id: book.id }
      expect(flash[:success]).to eq('Book was successfully destroyed.')
    end
  end
end
