require 'rails_helper'

module Heartlike
  RSpec.describe ArticlesController, type: :controller do
    routes { Heartlike::Engine.routes }



    describe 'GET index' do
      it 'assigns @articles' do
        article = create(:article)
        get :index
        expect(assigns(:articles)).to eq([article])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET show' do
      it 'renders article show action' do
        article = FactoryBot.create(:article)
        get :show, params: { id: article.id }
        expect(response).to render_template('show')
      end
    end

    describe 'post CREATE' do
      context 'with good params' do
        before(:each) do
          sign_in create(:user)
          @user = subject.current_user
          @category = create(:category)
        end

        it 'creates article' do
          expect { post :create, params: { article: { title: 'New article', body: 'new article desc', user_id: @user.id, category_id: @category.id } } }.to change { Article.all.count }.by(1)
          expect(Article.last.title).to eq('New article')
        end

        it 'redirects to article' do
          post :create, params: { article: { title: 'New article', body: 'new article desc', user_id: @user.id, category_id: @category.id } }
          expect(response).to redirect_to(article_path(Article.last))
        end
      end

      context 'without title' do
        it 'renders new template' do
          expect { post :create, params: { article: { title: "", body: 'Article', user_id: User.first.id } } }.to_not change { Article.all.count }
          expect(response).to render_template('new')
        end
      end


      context 'without title' do
        it 'renders new template' do
          expect { post :create, params: { article: { title: "", body: 'Article', user_id: User.first.id } } }.to_not change { Article.all.count }
          expect(response).to render_template('new')
        end
      end

      context 'without body' do
        it 'renders new template' do
          expect { post :create, params: { article: { title: "New article", body: '', user_id: User.first.id } } }.to_not change { Article.all.count }
          expect(response).to render_template('new')
        end
      end

      context 'without user' do
        it 'renders new template' do
          expect { post :create, params: { article: { title: "New article", body: 'Article', user_id: nil } } }.to_not change { Article.all.count }
          expect(response).to render_template('new')
        end
      end
    end
  end
end
