class ArticlesController < ApplicationController
   before_action :find_article, only:[:show, :edit, :update, :destroy]
   before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  def index
    @article = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "GOOD JOB♨發表成功"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "文章更新成功"
      render :show
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "文章已刪除"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end

end
