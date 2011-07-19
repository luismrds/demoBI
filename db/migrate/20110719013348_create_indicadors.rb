class CreateIndicadors < ActiveRecord::Migration
  def self.up
    create_table :indicadors do |t|
      t.string :nombre
      t.integer :perspectiva_id

      t.timestamps
    end
  end

  def self.down
    drop_table :indicadors
  end
end
