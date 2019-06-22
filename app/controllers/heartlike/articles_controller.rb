require_dependency "heartlike/application_controller"

module Heartlike
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET /articles
    def index
      @articles = Article.with_attached_thumbnail.includes(:user, :hearts, :category).all.order(created_at: :DESC)
      if params[:column_size]
        cookies.permanent[:column_size] = params[:column_size]
      end
      respond_to do |format|
        format.html
        format.js
      end
    end

    # GET /articles/1
    def show
    end

    # GET /articles/new
    def new
      @article = Article.new
      respond_to do |format|
        format.html
        format.js
      end
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
        respond_to do |format|
          format.html do
            redirect_to @article, notice: 'Article was successfully created.'
          end
          format.js
        end
      else
        render :new
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :body, :thumbnail, :category_id, :user_id, :created_at, :updated_at)
    end
  end
end
