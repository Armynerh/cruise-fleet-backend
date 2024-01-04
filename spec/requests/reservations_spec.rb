require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/reservations'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get '/reservations'
      expect(response).to render_template(:index)
    end
  end
end
