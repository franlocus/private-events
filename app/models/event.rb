class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
