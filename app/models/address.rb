class Address < ActiveRecord::Base
  belongs_to :job_applications
  belongs_to :educations
end
