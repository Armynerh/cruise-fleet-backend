require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            email: 'test@example.com',
            password: 'password123',
            password_confirmation: 'password123'
          }
        }
      end

      it 'creates a new user' do
        expect do
          post :create, params: valid_params
        end.to change(User, :count).by(1)
      end

      it 'sets the session user_id' do
        post :create, params: valid_params
        expect(session[:user_id]).to eq(User.last.id)
      end

      it 'responds with :created status and user JSON' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['status']).to eq('created')
        expect(parsed_response['user']['email']).to eq('test@example.com')
  
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            email: 'invalid-email',
            password: 'password123',
            password_confirmation: 'password456'
          }
        }
      end

      it 'does not create a new user' do
        expect do
          post :create, params: invalid_params
        end.to_not change(User, :count)
      end
    end
  end
end
