class ArticlesController < ApplicationController

  before_action :authenticate_user!

  #verify :method => :post, :only => [ :destroy, :create, :update ],
  #  :redirect_to => { :action => :index }

  def index
    authorize Article

    respond_to do |format|
      format.json {
        @articles = Article.includes(:user).order('created_at DESC')
        render 'index', formats: 'json', handlers: 'jbuilder'
      }
      format.html
    end
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
    article = Article.find(params[:id])
    authorize article
    if article.update_attributes(article_params)
      render :json => article
    else
      render :json => article.errors.full_messages, :status => :bad_request
    end
  end


  def destroy
    article = Article.find(params[:id])
    authorize article
    if article.destroy
      head :no_content
    else
      render :json => { error: "No se pudo eliminar" }, :status => :bad_request
    end
  end

  private

  def article_params
    params.require(:article).permit(:text)
  end

end
