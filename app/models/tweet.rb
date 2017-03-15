class Tweet < ApplicationRecord
	belongs_to :user
	validates_presence_of :description
	validates_length_of :description, :maximum =>200
end
