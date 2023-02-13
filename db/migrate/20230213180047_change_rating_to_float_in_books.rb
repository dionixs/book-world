class ChangeRatingToFloatInBooks < ActiveRecord::Migration[7.0]
  def up
    change_column :books, :rating, :float, default: 0.00
  end

  def down
    change_column :books, :rating, :integer, default: 0
  end
end
