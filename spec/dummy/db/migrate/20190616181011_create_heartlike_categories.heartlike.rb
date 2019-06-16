# This migration comes from heartlike (originally 20190616174518)
class CreateHeartlikeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :heartlike_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
