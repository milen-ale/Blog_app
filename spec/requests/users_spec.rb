require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users#index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'to have template index for all users' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'Body incudes correct placeholder text: Users' do
      get '/users/'
      expect(response.body).to include('User#index')
    end
  end

  describe 'GET users#show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end

    it 'to have template show for one user' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'Body includes correct placeholder text' do
      get '/users/1'
      expect(response.body).to include('Users#show')
    end
  end
end
