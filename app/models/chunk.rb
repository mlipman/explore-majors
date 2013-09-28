class Chunk < ActiveRecord::Base
	attr_accessible :name, :opt_parent
	belongs_to :option
	belongs_to :chunk
	has_many :chunks
	has_many :reqs

	# needs a status
	def status(viewer)
		return "todo" # for now
	end
end
