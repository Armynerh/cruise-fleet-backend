require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    let!(:items) { create_list(:item, 3) }

    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @items and @item_image_urls' do
      get :index
      expect(assigns(:items)).to eq(items)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:item) { create(:item) }

    it 'returns a successful response' do
      get :show, params: { id: item.id }
      expect(response).to be_successful
    end

    it 'assigns @item' do
      get :show, params: { id: item.id }
      expect(assigns(:item)).to eq(item)
    end

    it 'renders the show template' do
      get :show, params: { id: item.id }
      expect(response).to render_template(:show)
    end

    it 'renders JSON with the item' do
      get :show, params: { id: item.id }, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['result']['item']).to_not be_empty
    end
  end

  # Add tests for other controller actions like create, destroy, and update
end
