class RemoveDescriptionFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :description, :text
  end
end
