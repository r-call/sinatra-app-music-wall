class Track < ActiveRecord::Base
  validates :song, presence: true
  validates :artist, presence: true
end