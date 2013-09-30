class Req < ActiveRecord::Base
  # added opt_parent flag and belongs to chunk
  attr_accessible :name, :opt_parent, :numReqd
  belongs_to :option
  belongs_to :chunk
  has_many :options

  # Something like:
  # belongs_to :req
  # has_many :reqs

  # and an attribute like parent_type that is either option or req






  def getORCTable
  	temp = []
  	self.options.each do |option|
  		logger.debug("option is #{option.name}")
  		vrow = []
  		vrow << option
  		option.reqs.each do |req|
  			vrow << req
  		end
  		option.courses.each do |course|
  			vrow << course
  		end
  		temp << vrow
  	end


  	logger.debug("TEMP IS AS FOLLOWS: #{temp}")

  	ans = []
  	max=0
  	temp.each do |vrow|
  		if vrow.length > max then max = vrow.length end
  	end

  	#logger.debug("max is #{max}")

  	(0..(max-1)).each do |i|
  		hrow = []
  		(0..(temp.length-1)).each do |j|
  			# look into temp[j] is nil
  			#logger.debug("i is #{i}, j is #{j}")
  			#logger.debug("temp[j] is #{temp[j]}")
  			if (i>=temp[j].length)
  				hrow<<'nll'
  			else
	  			hrow<<temp[j][i]
  			end
  		end
  		ans<<hrow
  		#logger.debug(hrow)
  	end
  	return ans
  end

  def status(viewre)
    if viewre.completeReq(self)
      return "completed"
    else 
      return "todo" 
    end
  end
end
