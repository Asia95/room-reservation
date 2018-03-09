class RenameColumnDataInReservations < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :data, :start_date
  end
end
