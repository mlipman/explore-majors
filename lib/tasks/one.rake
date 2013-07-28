desc "Loads symsys data from testSS"
task :doit => :environment do
	data = IO.readlines('testSS.txt')
	symsys = Option.find_by_name("Symbolic Systems")
	process(0, data, symsys)

end

def process(i, data, parent)
	puts "Processing on line:#{i} with parent:#{parent.inspect}"

	while (i<(data.length))
		line = data[i]
		pieces = line.split(' ')
		puts "pieces: #{pieces}"
		if pieces[0]=='R'
			req = Req.new(:name => pieces[1])
			req.option = parent
			req.save
			puts "Saved R #{pieces[1]} at i=#{i}"
			endline = process(i+1, data, req)
			i = endline
		elsif pieces[0]=='O'
			opt = Option.new(:name => pieces[1])
			opt.req = parent
			opt.save
			puts "Saved O #{pieces[1]} at i=#{i}"
			endline = process(i+1, data, opt)
			i = endline
		elsif pieces[0]=='OR'
			# one line, where the name is an option
			# and a req of that option
			opt = Option.new(:name => pieces[1])
			opt.req = parent
			opt.save
			puts "Save O of OR #{pieces[1]} at i=#{i}"
			req = Req.new(:name => pieces[1])
			req.option = opt
			req.save
			puts "Saved R of OR #{pieces[1]} at i=#{i}"
			i+=1
		###########
		# Next put it some auto end recognition
		# Especially on changes from R to O
		# possible on whitespace, buy prob not


		else # pieces[0]=='end'
			puts "returning #{i+1} at i=#{i}"
			return i+1
		end
	end
	puts "returning done"
end



	# if (i==data.length-1)
	# 	return
	# end
	# line = data[i]
	# pieces = line.split(' ')
	# if pieces[0]=='R'
	# 	#process inner





# 	else
# 		(0..data.length-1).each do |i|
# 			line = data[i]
# 			pieces = line.split(' ')
# 			if pieces[0]=='R'
# 				req = Req.new(:name => pieces[1])
# 				req.option = parent
# 				req.save
# 				remainder = data.length-(i+1)
# 				process(data.slice(-remainder,remainder), req)
# 			elsif pieces[0]=='O'
# 				opt = Otption.new(:name => pieces[1])
# 				opt.req = parent
# 				opt.save

# end

# make and save reqs, opts when you find them. change parent when you find an end

# looking at testData
# parent is symsys
# 'R core1'make and save core1 as R, parent as symsys
# parent is core1(r)
# make and save blad as O, parent as core1
# parent is now blad(o)
# make and save blad as R, parent as blad(o)
# parent is now blad(r)
# 'end' parent is now blad(r)'s parent, blad(o)
# 'end' parent is now blad(o)'s parent, core1
# 'O blood' make and save blood as O, parent as core1
# parent is now blood(o)
# 'R blood' make and save blood as R, parent as blood(o)
# etc


# 		parent = Option.find_by_name("Symbolic Systems")
# 		puts parent.inspect
# 		while line = f.gets
# 			pieces = line.split(' ')
# 			if pieces[0]=='R'
# 				# make req
# 				req = Req.new(:name => pieces[1])
# 				req.option = parent
# 				req.save
# 				parent = req
# 				while ((line = f.gets) && (line!="end\n")
# 					#make opt
# 				reqs<<pieces[1]
# 			elsif pieces[0]=='O'
# 				opts<<pieces[1]
# 			elsif pieces[0]=='OR'
# 				opts<<pieces[1]
# 				reqs<<pieces[1]
# 			else
# 				puts "Line: #{line} has an improper starting code, ignored"
# 			end
# 		end
# 		puts "Contents: #{reqs.length} reqs and #{opts.length} opts"
# 		puts opts.inspect
# 		puts reqs.inspect
# 	end
# end



# add reqs to symsys from test testdata 

# line1: R core1, add to symsys
# add opts to core1 from remainder until end
