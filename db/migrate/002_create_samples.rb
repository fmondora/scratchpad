class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :sample do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sample
  end
end
