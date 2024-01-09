# spec/controllers/items_controller_spec.rb

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:item) { create(:item) }

    it 'returns a successful response' do
      get :show, params: { id: item.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_item_attributes) { attributes_for(:item) }

    it 'creates a new item' do
      expect {
        post :create, params: { item: valid_item_attributes }, format: :json
      }.to change(Item, :count).by(1)

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Item Created Successfully!')
    end

    it 'renders errors if item creation fails' do
      invalid_attributes = { name: nil, availability: nil }

      post :create, params: { item: invalid_attributes }, format: :json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include('Item not Created!!!')
    end
  end

  describe 'DELETE #destroy' do
    let!(:item) { create(:item) }

    it 'destroys the requested item' do
      expect {
        delete :destroy, params: { id: item.id }, format: :json
      }.to change(Item, :count).by(-1)

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Item destroyed!')
    end
  end

  describe 'PATCH #update' do
    let!(:item) { create(:item) }
    let(:updated_attributes) { { name: 'Updated Name' } }

    it 'updates the requested item' do
      patch :update, params: { id: item.id, item: updated_attributes }, format: :json
      item.reload

      expect(response).to have_http_status(:success)
      expect(response.body).to include('Item updated successfully!')
      expect(item.name).to eq('Updated Name')
    end

    it 'renders errors if item update fails' do
      invalid_attributes = { name: nil }

      patch :update, params: { id: item.id, item: invalid_attributes }, format: :json
      item.reload

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include('Item not updated!!!')
    end
  end
end
