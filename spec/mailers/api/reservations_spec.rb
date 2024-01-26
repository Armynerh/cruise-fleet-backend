require 'swagger_helper'

describe 'Reservations API' do
  def common_response_tests
    produces 'application/json'
    response '200', 'reservations found' do
      run_test!
    end
  end

  def reservation_parameters
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
      required: %w[user_id item_id start finish day_cost total_days total_cost]
    }
  end

  path '/reservations' do
    describe 'GET' do
      it 'Retrieves a list of reservations' do
        tags 'Reservations'
        common_response_tests
      end
    end

    describe 'POST' do
      it 'Creates a new reservation' do
        tags 'Reservations'
        consumes 'application/json'
        reservation_parameters

        response '201', 'reservation created' do
          run_test!
        end

        response '422', 'invalid request' do
          let(:reservation) { { user_id: 1, item_id: 1, start: '2024-01-01', finish: '2024-01-10' } }
          run_test!
        end
      end
    end
  end
end
