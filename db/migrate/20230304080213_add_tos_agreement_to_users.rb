# frozen_string_literal: true

class AddTosAgreementToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tos_agreement, :boolean
  end
end
