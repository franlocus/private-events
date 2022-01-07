class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'Event'
  belongs_to :attended_event, class_name: 'User'
end
