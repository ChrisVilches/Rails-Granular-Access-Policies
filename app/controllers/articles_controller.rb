class ArticlesController < ApplicationController

  before_action :authenticate_user!


  #verify :method => :post, :only => [ :destroy, :create, :update ],
  #  :redirect_to => { :action => :index }

  def index
    authorize Article
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def show
    authorize Article
    render :json => Article.find(params[:id])
  end

  def create
    authorize Article
    article = Article.new(article_params)
    article.user = current_user
    if article.save
      render :json => article
    else
      render :json => article.errors.full_messages, :status => :bad_request
    end
  end

  def update
  end

  def destroy
    article = Article.find(params[:id])
    authorize article
    article.destroy!
    head :no_content
  end

  private

  def article_params
    params.require(:article).permit(:text)
  end

end
