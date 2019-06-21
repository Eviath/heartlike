require_dependency "heartlike/application_controller"

module Heartlike
  class CategoriesController < ApplicationController
    before_action :find_category, only: :show
    def index
      @categories = Category.all
    end

    def show
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to request.referrer
      else
        render :new
      end
    end

    protected

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
