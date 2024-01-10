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
