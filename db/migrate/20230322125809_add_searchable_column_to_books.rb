# frozen_string_literal: true

class AddSearchableColumnToBooks < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE books
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('russian', coalesce(title, '')), 'A') ||
        setweight(to_tsvector('russian', coalesce(description,'')), 'B')
      ) STORED;
    SQL
  end

  def down
    remove_column :books, :searchable
  end
end
