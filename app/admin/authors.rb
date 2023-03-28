# frozen_string_literal: true

ActiveAdmin.register Author do
  menu label: 'Authors'

  permit_params :bio, :birth_date, :death_date, :place_of_birth,
                :short_name, :full_name, :photo_url, :seo_description, :status

  filter :short_name
  filter :full_name
  filter :bio
  filter :birth_date
  filter :death_date
  filter :place_of_birth
  filter :photo_url
  filter :seo_description
  filter :status
  filter :created_at
  filter :updated_at

  index title: 'Список авторов' do
    selectable_column
    id_column
    column :short_name
    column :full_name
    column :pseudonyms
    column :bio
    column :birth_date
    column :death_date
    column :place_of_birth
    column :photo_url
    column :seo_description
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :bio
      f.input :birth_date
      f.input :death_date
      f.input :place_of_birth
      f.input :short_name
      f.input :full_name
      f.input :photo_url
      f.input :seo_description
      f.input :status
    end
    f.actions
  end
end
