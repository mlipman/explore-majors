class Req < ActiveRecord::Base
  attr_accessible :name
  belongs_to :option
  has_many :options

  def getORCTable
  	vrow1 = [100]
  	vrow2 = [19, 20, 21, 22]
  	vrow3 = [41, 42]

  	#####################
  	# hrow1 = [A, B, C]
  	# hrow2 = [100, 19, 41]
  	# hrow3 = [nil, 20, 42]
  	# hrow4 = [nil, 21, nil]
  	# hrow5 = [nil, 22, nil]

  	#temp = [vrow1, vrow2, vrow3]
  	temp = []
  	self.options.each do |option|
  		logger.debug("option is #{option.name}")
  		vrow = []
  		vrow << option.name
  		option.reqs.each do |req|
  			vrow << req.name
  		end
  		option.courses.each do |course|
  			vrow << course.dept
  		end
  		temp << vrow
  	end


  	logger.debug("TEMP IS AS FOLLOWS: #{temp}")

  	ans = []
  	max=0
  	temp.each do |vrow|
  		if vrow.length > max then max = vrow.length end
  	end

  	logger.debug("max is #{max}")

  	(0..(max-1)).each do |i|
  		hrow = []
  		(0..(temp.length-1)).each do |j|
  			# look into temp[j] is nil
  			logger.debug("i is #{i}, j is #{j}")
  			logger.debug("temp[j] is #{temp[j]}")
  			if (i>=temp[j].length)
  				hrow<<'nll'
  			else
	  			hrow<<temp[j][i]
  			end
  		end
  		ans<<hrow
  		logger.debug(hrow)
  	end
  	return ans

  end
end
