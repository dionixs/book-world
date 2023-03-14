# frozen_string_literal: true

ActiveAdmin.register Genre do
  permit_params :name_en, :name_ru, :parent_id
end
