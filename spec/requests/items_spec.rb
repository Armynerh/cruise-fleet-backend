# spec/controllers/items_controller_spec.rb

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:item) { FactoryBot.create(:item) }

    it 'returns a success response' do
      get :show, params: { id: item.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      { item: { name: 'New Item', availability: true, photo: 'item.jpg', cost: 10.99, description: 'Description' } }
    end

    context 'with valid parameters' do
      it 'creates a new Item' do
        expect do
          post :create, params: valid_attributes, format: :json
        end.to change(Item, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    let(:item) { FactoryBot.create(:item) }

    context 'with valid parameters' do
      let(:new_attributes) do
        { item: { name: 'Updated Item' } }
      end

      it 'updates the requested item' do
        put :update, params: { id: item.to_param }.merge(new_attributes), format: :json
        item.reload
        expect(item.name).to eq('Updated Item')
      end
    end
  end
end
