# spec/requests/reservations_spec.rb

require 'swagger_helper'

describe 'Reservations API' do
  path '/reservations' do
    get 'Retrieves a list of reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservations found' do
        run_test!
      end
    end

    post 'Creates a new reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          item_id: { type: :integer },
          start: { type: :string, format: :date },
          finish: { type: :string, format: :date },
          city: { type: :string },
          day_cost: { type: :float },
          total_days: { type: :integer },
          total_cost: { type: :float }
        },
        required: ['user_id', 'item_id', 'start', 'finish', 'day_cost', 'total_days', 'total_cost']
      }

      response '201', 'reservation created' do
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { user_id: 1, item_id: 1, start: '2024-01-01', finish: '2024-01-10' } }
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a specific reservation' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservation found' do
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a specific reservation' do
      tags 'Reservations'
      response '200', 'reservation deleted' do
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
