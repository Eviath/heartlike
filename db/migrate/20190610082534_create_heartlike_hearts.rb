class CreateHeartlikeHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :heartlike_hearts do |t|
      t.references :user
      t.references :article

      # Heart token, needed to remember guest user liked the article
      t.string :heart_token, index: { unique: true }
      t.timestamps
    end
  end
end
