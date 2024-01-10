class AddCostFieldsToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :day_cost, :float
    add_column :reservations, :total_days, :integer
    add_column :reservations, :total_cost, :float
  end
end
