require_dependency "heartlike/application_controller"

module Heartlike
  class HeartsController < ApplicationController
    before_action :set_heart, only: :destroy

    # POST /hearts
    def create
      @heart = Heart.new(heart_params)

      if @heart.save
        redirect_to @heart, notice: 'Heart was successfully created.'
      else
        render :new
      end
    end

    # DELETE /hearts/1
    def destroy
      @heart.destroy
      redirect_to hearts_url, notice: 'Heart was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_heart
      @heart = Heart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def heart_params
      params.fetch(:heart, {})
    end
  end
end
