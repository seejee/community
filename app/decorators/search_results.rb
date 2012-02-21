class SearchResults 
  attr_reader :query
  attr_reader :articles

  def initialize(query, articles)
    @query = query
    @articles = articles
  end

  def articles_header
   "#{@articles.count} search result#{ @articles.count == 1 ? "" : "s"} for: " 
  end
end
