require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'GET #index' do

    it 'should respond with 200 OK' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end

  end

  describe 'GET #new as Guest' do
    it 'should redirect to sign in page' do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #new as User' do
    login_user

    it 'should respond with 200 ok' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it 'should render the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'Lock thread as Guest' do

    it 'should redirect to sign_in page' do
      @post = FactoryGirl.create(:post)
      post :lock, :id => @post.id

      expect(response).to have_http_status(302)
      expect(response).to_not have_http_status(200)
      expect(response).to redirect_to(new_user_session_path)
      expect(@post.locked).to eql(false)
    end
  end

  describe 'Lock thread as User' do
    login_user

    it 'should redirect to sign_in page' do
      @post = FactoryGirl.create(:post)
      post :lock, :id => @post.id

      expect(response).to redirect_to(post_path(@post))
      expect(@post.locked).to eql(false)
    end
  end

  describe 'Lock thread as Admin' do
    login_admin

    it 'should redirect and thread should be locked' do
      @post = FactoryGirl.create(:post)
      post :lock, :id => @post.id
      expect(response).to redirect_to(post_path(@post))
    end
  end

end
