class AddLatitudeAndLongitudeToProgrammer < ActiveRecord::Migration
  def change
    add_column :programmers, :latitude, :float

    add_column :programmers, :longitude, :float

  end
end
