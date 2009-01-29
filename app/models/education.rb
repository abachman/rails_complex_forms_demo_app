class Education < ActiveRecord::Base
  has_one :address
  belongs_to :job_application
end
