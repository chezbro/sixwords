class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
