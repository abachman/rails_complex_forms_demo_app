class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.references :job_application
      t.references :education

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
