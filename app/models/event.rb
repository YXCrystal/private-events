class Event < ApplicationRecord
    belongs_to :user
    has_many :scheduled_events
    has_many :attended_by, through: :scheduled_events, source: :user
end
