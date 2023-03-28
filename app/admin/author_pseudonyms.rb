# frozen_string_literal: true

ActiveAdmin.register AuthorPseudonym do
  menu label: 'Author Pseudonyms'

  permit_params :name, :author_id

  filter :name
  filter :created_at
  filter :updated_at

  index title: 'Список псевдонимов' do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  # TODO
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
