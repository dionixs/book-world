require 'rails_helper'

RSpec.describe BooksController, type: :request do

  describe "GET #index" do
    let!(:book1) { FactoryBot.create(:book) }
    let!(:book2) { FactoryBot.create(:book) }

    context "when requesting HTML format" do
      it "returns http success" do
        get "/books"
        expect(response).to have_http_status(:success)
      end

      it "assigns all books to @books" do
        get "/books"
        expect(assigns(:books)).to eq([book1, book2])
      end

      it "renders the index template" do
        get "/books"
        expect(response).to render_template(:index)
      end
    end

    context "when requesting JSON format" do
      it "returns http success" do
        get "/books.json"
        expect(response).to have_http_status(:success)
      end

      it "returns all books as JSON" do
        get "/books.json"
        expect(response.body).to eq([book1, book2].to_json)
      end
    end
  end

  describe "GET #show" do
    let!(:book) { FactoryBot.create(:book) }

    context "when requesting HTML format" do
      it "returns http success" do
        get "/books/#{book.id}"
        expect(response).to have_http_status(:success)
      end

      it "assigns the requested book to @book" do
        get "/books/#{book.id}"
        expect(assigns(:book)).to eq(book)
      end

      it "renders the show template" do
        get "/books/#{book.id}"
        expect(response).to render_template(:show)
      end

      it "assigns the reviews for the requested book to @reviews" do
        review1 = FactoryBot.create(:review, book: book)
        review2 = FactoryBot.create(:review, book: book)
        get "/books/#{book.id}"
        expect(assigns(:reviews)).to eq([review2, review1])
      end
    end

    context "when requesting JSON format" do
      it "returns http success" do
        get "/books/#{book.id}.json"
        expect(response).to have_http_status(:success)
      end

      it "returns the requested book as JSON" do
        get "/books/#{book.id}.json"
        expect(response.body).to eq(book.to_json)
      end
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get "/books/new"
      expect(response).to have_http_status(:success)
    end

    it "assigns a new book as @book" do
      get "/books/new"
      expect(assigns(:book)).to be_a_new(Book)
    end

    it "renders the new template" do
      get "/books/new"
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { { title: "Book Title", author: "Author Name", description: "Book Description", rating: 4 } }
    let(:invalid_attributes) { { title: "", author: "", description: "", rating: nil } }

    context "with valid parameters" do
      it "creates a new book" do
        expect {
          post "/books", params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post "/books", params: { book: valid_attributes }
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post "/books", params: { book: valid_attributes }
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new book" do
        expect {
          post "/books", params: { book: invalid_attributes }
        }.to_not change(Book, :count)
      end

      it "assigns a newly created but unsaved book as @book" do
        post "/books", params: { book: invalid_attributes }
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        post "/books", params: { book: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "private #book_params" do
    it "permits valid parameters" do
      expect {
        post "/books", params: { book: { title: "Book Title", author: "Author Name", description: "Book Description", rating: 4 } }
      }.to change(Book, :count).by(1)
    end
  end

  describe "GET #edit" do
    let!(:book) { FactoryBot.create(:book) }

    it "returns http success" do
      get "/books/#{book.id}/edit"
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested book to @book" do
      get "/books/#{book.id}/edit"
      expect(assigns(:book)).to eq(book)
    end

    it "renders the edit template" do
      get "/books/#{book.id}/edit"
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    let!(:book) { FactoryBot.create(:book) }

    context "with valid parameters" do
      let(:new_attributes) { { title: "New Book Title" } }

      it "updates the requested book" do
        put "/books/#{book.id}", params: { book: new_attributes }
        book.reload
        expect(book.title).to eq("New Book Title")
      end

      it "assigns the requested book as @book" do
        put "/books/#{book.id}", params: { book: new_attributes }
        expect(assigns(:book)).to eq(book)
      end

      it "redirects to the book" do
        put "/books/#{book.id}", params: { book: new_attributes }
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { title: "" } }

      it "assigns the book as @book" do
        put "/books/#{book.id}", params: { book: invalid_attributes }
        expect(assigns(:book)).to eq(book)
      end

      it "does not update the book" do
        expect {
          put "/books/#{book.id}", params: { book: invalid_attributes }
          book.reload
        }.to_not change(book, :title)
      end

      it "re-renders the 'edit' template" do
        put "/books/#{book.id}", params: { book: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:book) { FactoryBot.create(:book) }

    it "destroys the requested book" do
      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      delete "/books/#{book.id}"
      expect(response).to redirect_to(books_url)
    end
  end
end
