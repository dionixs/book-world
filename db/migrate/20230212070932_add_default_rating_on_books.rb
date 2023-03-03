# frozen_string_literal: true

class AddDefaultRatingOnBooks < ActiveRecord::Migration[7.0]
  def up
    change_column_default(:books, :rating, 0)
  end

  def down
    change_column_default :books, :rating, nil
  end
end
