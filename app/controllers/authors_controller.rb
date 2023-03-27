# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_author, only: %i[show edit update archive destroy]

  # GET /authors or /authors.json
  def index
    @authors = Author.active.includes([:photo_attachment]).all
    @pagy, @authors = pagy(@authors, items: 30)
  end

  # TODO
  def by_initial_letter
    @initial = params[:initial]

    unless @initial.match?(/\A[а-яА-Яa-zA-Z]\z/)
      not_found("Invalid initial letter: #{@initial}")
      return
    end

    @authors = Author.active.includes([:photo_attachment]).by_initial_letter(@initial)
    @pagy, @authors = pagy(@authors, items: 30)
    @authors = @authors.sorted_by_name
  end

  # GET /authors/1 or /authors/1.json
  def show
    @books = @author.books.active.includes([:cover_attachment])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit; end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_url(@author), notice: t('.create') }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: t('.update') }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO
  def archive
    @author.update(status: 'archived')
    redirect_to authors_url, notice: 'Successfully Archived'
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: t('.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:name, :bio, :birth_date, :death_date,
                                   :place_of_birth, :place_of_death, :photo)
  end
end
