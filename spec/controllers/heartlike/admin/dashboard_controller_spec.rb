require 'rails_helper'

module Heartlike
  module Admin
    RSpec.describe DashboardController, type: :controller do
      routes { Heartlike::Engine.routes }

      describe "GET #index" do
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
          binding.pry
        end
      end

    end
  end
end
