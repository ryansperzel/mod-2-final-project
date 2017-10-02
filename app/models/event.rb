class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {in: 10..500}, uniqueness: {scope: :host_id, message: "You already have an event that day!"}
  validates :date, presence: true




  belongs_to :host, optional: true
  has_many :events_entertainers
  has_many :entertainers, through: :events_entertainers


end
