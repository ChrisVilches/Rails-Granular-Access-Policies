class ArticlesController < ApplicationController

  before_action do
    authenticate_user!
    authorize Article
  end


  #verify :method => :post, :only => [ :destroy, :create, :update ],
  #  :redirect_to => { :action => :index }

  def index
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def show
    render :json => Article.find(params[:id])
  end

  def create
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
  end

  private

  def article_params
    params.require(:article).permit(:text)
  end

end
