require 'rails_helper'
RSpec.describe ArticlesController, :type => :controller do

  # Tests the index method
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  # Tests getting the new function as a regular user.
  describe 'GET #new as user' do
    login_user
    it 'redirects to root path with alert message' do
      get :new
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to be_present
    end
  end

  # Tests getting the new function as an Admin.
  describe 'GET #new as admin' do
    login_admin
    it 'responds with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end
end
