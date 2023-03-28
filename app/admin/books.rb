# frozen_string_literal: true

ActiveAdmin.register Book do
  menu label: I18n.t('active_admin.menu.book')

  permit_params :title, :rating, :description

  filter :title
  filter :status
  filter :cover_url
  filter :author
  filter :genre
  filter :description
  filter :rating
  filter :created_at
  filter :updated_at

  controller do
    def scoped_collection
      super.includes(:authors, :genres)
    end
  end

  index title: I18n.t('active_admin.resources.book.index') do
    selectable_column
    id_column
    column :title
    column :author
    column :genre
    column :description
    column :rating
    column :status
    column :cover_url
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :status
      f.input :rating
      f.input :cover_url
      f.input :description
    end
    f.actions
  end
end