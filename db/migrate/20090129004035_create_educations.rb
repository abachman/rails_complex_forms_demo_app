class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.string :school_name
      t.string :school_type
      t.references :job_application

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
