require 'swagger_helper'

describe 'Items API' do
  def common_response_tests
    produces 'application/json'
    response '200', 'item found' do
      run_test!
    end

    response '404', 'item not found' do
      let(:id) { 'invalid' }
      run_test!
    end
  end

  def item_parameters
    parameter name: :item, in: :body, schema: {
      type: :object,
      properties: {
        name: { type: :string },
        availability: { type: :boolean },
        photo: { type: :string },
        cost: { type: :float },
        description: { type: :string }
      },
      required: %w[name availability cost]
    }
  end

  path '/items/{id}' do
    parameter name: :id, in: :path, type: :integer

    context 'GET' do
      get 'Retrieves a specific item' do
        tags 'Items'
        common_response_tests
      end
    end

    context 'PUT' do
      put 'Updates a specific item' do
        tags 'Items'
        consumes 'application/json'
        item_parameters

        response '200', 'item updated' do
          run_test!
        end

        common_response_tests
      end
    end

    context 'DELETE' do
      delete 'Deletes a specific item' do
        tags 'Items'
        common_response_tests
      end
    end
  end
end
