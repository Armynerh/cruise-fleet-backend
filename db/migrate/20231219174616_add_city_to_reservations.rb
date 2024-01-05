class AddCityToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :city, :string
  end
end
