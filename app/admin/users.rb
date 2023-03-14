# frozen_string_literal: true

ActiveAdmin.register User, as: 'Users' do
  permit_params :username, :email, :password,
                :password_confirmation, :tos_agreement

  index title: 'List of users' do
    selectable_column
    id_column
    column :username
    column :email
    column :created_at
    column :updated_at
    column :tos_agreement
    actions
  end

  form title: 'Create User' do |f|
    inputs 'Details' do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :tos_agreement
    end
    para 'Press cancel to return to the list without saving.'
    actions
  end
end
