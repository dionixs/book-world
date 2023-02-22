# frozen_string_literal: true

class AddIndexToActiveStorageAttachmentsRecordTypeAndRecordId < ActiveRecord::Migration[7.0]
  def change
    add_index :active_storage_attachments, [:record_type, :record_id]
  end
end
