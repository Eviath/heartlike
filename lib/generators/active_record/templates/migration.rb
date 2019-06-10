# frozen_string_literal: true

class HeartlikeCreate<%= table_name.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= table_name %><%= primary_key_type %> do |t|
<% attributes.each do |attribute| -%>
t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      t.timestamps null: false
    end

end
end