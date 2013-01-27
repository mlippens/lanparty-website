class Compo < ActiveRecord::Base
	attr_accessible :date_time, :slots, :match_id, :group_size, :game_id, :featured, :description
	validates_presence_of :date_time
	validates_presence_of :slots
	validates_presence_of :group_size
	validates_presence_of :game

	belongs_to :game
	has_many :prices
	has_many :rounds
	has_many :teams

	mount_uploader :participation_badge, BadgeUploader
	mount_uploader :winning_badge, BadgeUploader

	scope :featured, where(featured: true)

	def has_won?(team)
		#stub
		false
	end

	def name
		return game.name
	end
end
