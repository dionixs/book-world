# frozen_string_literal: true

ActiveAdmin.register_page 'Import Books' do
  menu label: I18n.t('active_admin.menu.books')

  content title: I18n.t('active_admin.resources.books.import') do
    render 'admin/import_books'
  end

  page_action :import, method: :post do
    file = params[:file].tempfile

    BookImportService.new(file).import

    redirect_to admin_books_path, I18n.t('books.import')
  end
end
