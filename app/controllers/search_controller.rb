class SearchController < ApplicationController
  respond_to :html

  def index
    @articles = Article.search_with_index(params[:query]).paginate(:page => params[:page])
    @articles = @articles.public_only unless signed_in?
    @articles = ArticleDecorator.decorate(@articles)
  end
end
