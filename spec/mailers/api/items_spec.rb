# spec/requests/items_spec.rb

require 'swagger_helper'

describe 'Items API' do
  path '/items' do
    get 'Retrieves a list of items' do
      tags 'Items'
      produces 'application/json'

      response '200', 'items found' do
        run_test!
      end
    end

    post 'Creates a new item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          availability: { type: :boolean },
          photo: { type: :string },
          cost: { type: :float },
          description: { type: :string }
        },
        required: ['name', 'availability', 'cost']
      }

      response '201', 'item created' do
        run_test!
      end

      response '422', 'invalid request' do
        let(:item) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/items/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a specific item' do
      tags 'Items'
      produces 'application/json'

      response '200', 'item found' do
        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a specific item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          availability: { type: :boolean },
          photo: { type: :string },
          cost: { type: :float },
          description: { type: :string }
        },
        required: ['name', 'availability', 'cost']
      }

      response '200', 'item updated' do
        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a specific item' do
      tags 'Items'
      response '200', 'item deleted' do
        run_test!
      end

      response '404', 'item not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
