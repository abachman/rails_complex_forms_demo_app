class JobApplication < ActiveRecord::Base
  has_many :educations
  has_many :histories
  has_one :address, :dependent => :destroy

  after_update :save_address, :save_histories

  # history attributes, has_many
  def new_history_attributes=(attributes)
    attributes.each do |index, atts|
      histories.build atts
    end
  end
  def existing_history_attributes=(attributes)
    RAILS_DEFAULT_LOGGER.debug("Entering existing history attributes")
    histories.reject(&:new_record?).each do |history|
      RAILS_DEFAULT_LOGGER.debug("considering existing history: #{history.business_name}")
      atts = attributes[history.id.to_s]
      if atts
        RAILS_DEFAULT_LOGGER.debug("updating existing history:'#{history.business_name}' becomes:'#{atts[:business_name]}'")
        history.attributes = atts
      else
        history.delete(task)
      end
    end
  end
  def save_histories
    histories.each do |history|
      history.save false
    end
  end

  # address handlers, has_one
  def new_address_attributes=(attributes)
    build_address(attributes)
  end
  def existing_address_attributes=(attributes)
    address.attributes = attributes
  end
  def save_address
    address.save
  end
end
