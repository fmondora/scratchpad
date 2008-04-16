class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profile do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :profile
  end
end
