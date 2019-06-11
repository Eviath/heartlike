module Heartlike
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'layouts/application'
    before_action :set_locale

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
