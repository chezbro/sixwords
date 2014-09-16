class AddMadeByToWords < ActiveRecord::Migration
  def change
    remove_column :words, :made_by, :string
    add_column :words, :made_by, :integer
  end
end
