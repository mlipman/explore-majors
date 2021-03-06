class Option < ActiveRecord::Base
  attr_accessible :name
  belongs_to :req
  has_many :reqs
  has_and_belongs_to_many :courses

  # added
  has_many :chunks

  def status(viewre)
    if viewre.completeOpt(self)
      return "completed"
    else 
      return "todo" 
    end
  end


end
