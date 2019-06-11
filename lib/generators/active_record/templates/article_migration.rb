class HeartlikeCreateArticles < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :heartlike_articles<%= primary_key_type %> do |t|
    t.
    t.timestamps null: false
    end

end
end