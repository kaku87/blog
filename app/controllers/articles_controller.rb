class ArticlesController < ApplicationController
  inherit_resources

  def index
    @articles = Article.order('created_at DESC').page params[:page]
  end

end
