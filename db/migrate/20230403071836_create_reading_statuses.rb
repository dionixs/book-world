# frozen_string_literal: true

class CreateReadingStatuses < ActiveRecord::Migration[7.0]

  def up
    create_enum_type
    create_reading_statuses_table
  end

  def down
    drop_table :reading_statuses
    execute <<-SQL.squish
      DROP TYPE IF EXISTS reading_status;
    SQL
  end

  private

  def create_enum_type
    execute <<-SQL.squish
      CREATE TYPE reading_status AS ENUM ('want_to_read', 'rereading',
                                          'reading', 'finished',
                                          'unfinished')
    SQL
  end

  def create_reading_statuses_table
    create_table :reading_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.column :status, :reading_status, null: false

      t.timestamps
    end
  end
end
