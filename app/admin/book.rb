ActiveAdmin.register_page "Import Books" do
  content do
    render "admin/import_books"
  end

  page_action :import, method: :post do
    file = params[:file].tempfile

    BookImportService.new(file).import

    redirect_to admin_books_path, notice: "Books imported successfully."
  end
end