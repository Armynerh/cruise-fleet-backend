# spec/requests/sessions_spec.rb

require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let(:user) { create(:user, email: 'test@example.com', password: 'password') }

  describe "POST #create" do
    context "with valid credentials" do
      it "creates a session and renders json with logged_in true" do
        post '/sessions', params: { user: { email: user.email, password: 'password' } }
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq('created')
        expect(json_response['logged_in']).to eq(true)
        expect(json_response['user']['id']).to eq(user.id)
      end
    end
  end

  describe "GET #logged_in" do
  context "when user is logged in" do
    before { post '/sessions', params: { user: { email: user.email, password: 'password' } } }

    it "renders json with logged_in true and user details" do
      get '/sessions/logged_in'
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['logged_in']).to eq(true)
      expect(json_response['user']['id']).to eq(user.id)
    end
  end

  context "when user is not logged in" do
    it "renders json with logged_in false" do
      get '/sessions/logged_in'
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['logged_in']).to eq(false)
    end
  end
end

  describe "DELETE #logout" do
    context "when user is logged in" do
      before { post '/sessions', params: { user: { email: user.email, password: 'password' } } }

      it "clears the session and renders json with logged_out true" do
        delete '/sessions/log_out'
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq(200)
        expect(json_response['logged_out']).to eq(true)
      end
    end
  end
end
