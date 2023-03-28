# frozen_string_literal: true

ActiveAdmin.register Genre do
  menu label: I18n.t('active_admin.menu.genre')

  permit_params :name_en, :name_ru, :parent_id

  filter :genre_slug
  filter :name_ru
  filter :name_en
  filter :parent_id

  index title: I18n.t('active_admin.resources.genre.index') do
    selectable_column
    id_column
    column :genre_slug
    column :name_en
    column :name_ru
    column :parent_id
    actions
  end
end
