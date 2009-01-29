class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.string :business_name
      t.date :start_date
      t.date :end_date
      t.references :job_application

      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end
