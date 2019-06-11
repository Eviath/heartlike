require 'rails_helper'

module Heartlike
  RSpec.describe HeartsController, type: :controller do
    routes { Heartlike::Engine.routes }

    before(:each) do
      @article = Article.first
    end

    describe 'heart' do
      context 'with user signed in' do
        it 'creates heart on article with user association' do
          sign_in User.first
          expect { post :heart, params: { article_id: @article.id, id: @article.id } }.to change { [@article.hearts.count, subject.current_user.hearts.count] }.by([1, 1])
        end
      end

      context 'without user' do
        it 'creates heart on article without user' do
          expect { post :heart, params: { article_id: @article.id, id: @article.id } }.to change { @article.hearts.count }.by(1)
        end

        it 'redirects back to article after save' do
          post :heart, params: { article_id: @article.id, id: @article.id }
          expect(response).to redirect_to article_path(@article)
        end

        it 'saves heart token with article_id to cookies' do
          post :heart, params: { article_id: @article.id, id: @article.id }
          expect(cookies.encrypted["heart_token_#{@article.id}"]).to eq(@article.hearts.last.heart_token)
        end
      end
    end

    describe 'unheart' do
      context 'with user' do
        before(:each) do
          sign_in User.first
          Heart.create!(article_id: @article.id, user_id: subject.current_user.id)
        end

        it 'destroys heart on article with user association' do
          # For some reason i cant do that in one line like i did in create action on line #15
          # First check if heart is created and associated
          expect([@article.hearts.count, subject.current_user.hearts.count]).to eq([1, 1])
          # Send delete request
          delete :unheart, params: { article_id: @article.id, id: @article.id, heart_token: nil }
          # Check again if record have been destroyed, article and user shouldn't have associated hearts
          expect([@article.hearts.count, subject.current_user.hearts.count]).to eq([0, 0])
        end
        it 'redirects to article page' do
          delete :unheart, params: { article_id: @article.id, id: @article.id, heart_token: nil }
          expect(response).to redirect_to article_path(@article)
        end
      end

      context 'without user' do
        before(:each) do
          heart = Heart.create(article_id: @article.id)
          cookies.encrypted["heart_token_#{@article.id}"] = heart.heart_token
        end

        it 'destroys heart on article and removes token cookie' do
          expect { delete :unheart, params: { article_id: @article.id, id: @article.id, heart_token: cookies.encrypted["heart_token_#{@article.id}"] } }.to change { @article.hearts.count }.by(-1)
          expect(response.cookies["heart_token_#{@article.id}"]).to eq(nil)
        end

        it 'redirects back to article' do
          delete :unheart, params: { article_id: @article.id, id: @article.id, heart_token: cookies.encrypted["heart_token_#{@article.id}"] }
          expect(response).to redirect_to article_path(@article)
        end
      end
    end

  end
end

