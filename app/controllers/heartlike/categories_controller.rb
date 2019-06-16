require_dependency "heartlike/application_controller"

module Heartlike
  class CategoriesController < ApplicationController
    before_action :find_category, only: :show
    def index
      @categories = Category.all
    end

    def show
    end


    protected

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
