# frozen_string_literal: true

ActiveAdmin.register Book do
  menu label: I18n.t('active_admin.menu.book')

  permit_params :title, :rating, :description

  index title: I18n.t('active_admin.resources.book.index') do
    selectable_column
    id_column
    column :title
    column :author
    column :genre
    column :description
    column :rating
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :rating
      f.input :description
    end
    f.actions
  end
end