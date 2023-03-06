# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :rating, :description

  index do
    selectable_column
    id_column
    column :title
    column :authors
    column :description
    column :rating
    column :created_at
    column :updated_at
    actions
  end
end
