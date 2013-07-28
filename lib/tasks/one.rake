desc "Loads symsys data from symsys_data"
task :doit => :environment do
	data = IO.readlines('symsys_data.txt')
	symsys = Option.find_by_name("Symbolic Systems")
	process(0, data, symsys)

end

def process(i, data, parent)
	puts "Processing on line:#{i} with parent:#{parent.inspect}"

	# i is current line number
	while (i<(data.length))
		line = data[i]
		pieces = line.split(' ')
		puts "pieces: #{pieces}"
		if pieces[0]=='R'
			puts "heer with parent is #{parent}"
			# making a new req parent was passed in
			req = Req.new(:name => pieces[1])
			req.option = parent
			req.save
			puts "Saved R #{pieces[1]} at i=#{i}"
			endline = process(i+1, data, req)
			i = endline
		elsif pieces[0]=='C'
			full = pieces[1]
			# for now, just put full into dept
			# TODO put first group of letters into dept and remainder into num
			course = Course.new(:dept => full)
			parent.courses << course
			parent.save
			puts "Saved C #{pieces[1]} at i=#{i}"
			i+=2
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

		elsif pieces[0] == 'OC'
			opt = Option.new(:name => pieces[1])
			opt.req = parent
			opt.save
			puts "Save O of OC #{pieces[1]} at i=#{i}"


			full = pieces[1]
			# for now, just put full into dept
			# TODO put first group of letters into dept and remainder into num
			course = Course.new(:dept => full)
			opt.courses << course
			opt.save
			puts "Save C of OC #{pieces[1]} at i=#{i}"

			i+=1
		else # pieces[0]=='end'
			puts "returning #{i+1} at i=#{i}"
			return i+1
		end
	end
	puts "returning done"
end