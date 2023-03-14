# frozen_string_literal: true

ActiveAdmin.register User do
  menu label: I18n.t('active_admin.menu.users')

  permit_params :username, :email, :password,
                :password_confirmation, :tos_agreement

  breadcrumb do
    %w[admin users]
  end

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

  form do |f|
    inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :tos_agreement
    end
    para I18n.t('active_admin.resources.user.para')
    actions do
      button I18n.t('active_admin.resources.user.save'), class: 'action input_action '
      cancel_link
    end
  end

  filter :username
  filter :email
  filter :created_at
  filter :updated_at

  csv do
    column(:username, humanize_name: false)
    column(:email, humanize_name: false)
    column(:created_at, humanize_name: false)
    column(:updated_at, humanize_name: false)
  end
end
