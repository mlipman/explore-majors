class Chunk < ActiveRecord::Base
	attr_accessible :name, :opt_parent
	belongs_to :option
	belongs_to :chunk
	has_many :chunks
	has_many :reqs

  def status(viewre)
    if viewre.completeCh(self)
      return "completed"
    else 
      return "todo" 
    end
  end
end
