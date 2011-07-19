class CreateMedicions < ActiveRecord::Migration
  def self.up
    create_table :medicions do |t|
      t.float :valor
      t.integer :fecha_id
      t.integer :indicador_id

      t.timestamps
    end
  end

  def self.down
    drop_table :medicions
  end
end
