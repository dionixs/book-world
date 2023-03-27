# frozen_string_literal: true

ActiveAdmin.register_page 'Import Books' do
  menu label: I18n.t('active_admin.menu.books')

  content title: I18n.t('active_admin.resources.books.import') do
    render 'admin/import_books'
  end

  page_action :import, method: :post do
    # if params[:file].nil?
    #   flash[:error] = 'File not found'
    #   redirect_to admin_import_books_path
    #   return
    # end

    filepath = params[:file].tempfile.path

    # if !File.exist?(filepath) || File.empty?(filepath)
    #   flash[:error] = 'File does not exist or is empty'
    #   redirect_to admin_import_books_path
    #   return
    # end
    #
    # unless File.extname(filepath) == '.csv'
    #   flash[:error] = 'Invalid file format. Please upload a CSV file.'
    #   redirect_to admin_import_books_path
    #   return
    # end

    ImportBooksJob.perform_later(filepath)

    redirect_to admin_books_path, notice: I18n.t('books.import')
  end
end