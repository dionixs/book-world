# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :rating, :description
end
