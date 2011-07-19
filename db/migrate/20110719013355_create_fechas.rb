class CreateFechas < ActiveRecord::Migration
  def self.up
    create_table :fechas do |t|
      t.integer :mes
      t.integer :anho

      t.timestamps
    end
  end

  def self.down
    drop_table :fechas
  end
end
