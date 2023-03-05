# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :rating, :description

  index do
    selectable_column
    id_column
    column :title
    column :authors
    column :description
    column :cover
    column :published_at
    column :rating
    actions
  end
end
