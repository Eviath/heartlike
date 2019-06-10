class CreateHeartlikeHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :heartlike_hearts do |t|

      t.timestamps
    end
  end
end
