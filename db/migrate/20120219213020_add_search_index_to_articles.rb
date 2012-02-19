class AddSearchIndexToArticles < ActiveRecord::Migration
  def up
    execute "
      create index articles_title_idx on articles using gin(to_tsvector('english', title));
      create index articles_body_idx on articles using gin(to_tsvector('english', body));"
  end

  def down
    execute "
      drop index articles_title_idx;
      drop index articles_body_idx;
      "
  end
end
