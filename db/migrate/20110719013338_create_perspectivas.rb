class CreatePerspectivas < ActiveRecord::Migration
  def self.up
    create_table :perspectivas do |t|
      t.string :nombre
      t.integer :dimension_id

      t.timestamps
    end
  end

  def self.down
    drop_table :perspectivas
  end
end
