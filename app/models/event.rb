class Event < ApplicationRecord
  
  validates :event_id, presence: true, uniqueness: true
  
  validate :check_event_type, on: :create

  def check_event_type
    errors.add(:event_type, " is not the correct one.") unless (self.event_type == "PushEvent" || self.event_type == "ReleaseEvent" || self.event_type == "WatchEvent")
  end
   
end
