module JobApplicationsHelper
  def fields_for_address(address, &block)
    prefix = address.new_record? ? 'new' : 'existing'
    fields_for("job_application[#{prefix}_address_attributes]", address, &block)
  end

#  def add_task_link(name) 
#    link_to_function name do |page| 
#      page.insert_html :bottom, :tasks, :partial => 'task', :object => Task.new 
#    end 
#  end as one

end
