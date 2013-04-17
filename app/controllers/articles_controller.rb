class ArticlesController < ApplicationController
  inherit_resources

  def index
  	if params[:tag]
      @articles = Article.tagged_with(params[:tag]).page params[:page]
    else
      @articles = Article.order('created_at DESC').page params[:page]
    end
  end
end
