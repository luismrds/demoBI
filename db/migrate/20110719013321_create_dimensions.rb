class CreateDimensions < ActiveRecord::Migration
  def self.up
    create_table :dimensions do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :dimensions
  end
end
