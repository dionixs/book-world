# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :username, :email

  index do
    selectable_column
    id_column
    column :username
    column :full_name
    column :last_name
    column :email
    column :created_at
    column :updated_at
    actions
  end
end