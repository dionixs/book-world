# frozen_string_literal: true

class AddIndexToActiveStorageAttachmentsName < ActiveRecord::Migration[7.0]
  def change
    add_index :active_storage_attachments, :name
  end
end
