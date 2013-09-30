class Loadmajors < ActiveRecord::Migration
	def up
		Req.reset_column_information
		Option.reset_column_information
		Chunk.reset_column_information
		major = Req.new(:name => "Major", :numReqd => 1)
		major.save

		data = IO.readlines('symsys_data.txt')
		process_chunks(0, data, major, 'req')

		data2 = IO.readlines('ElectricalEngineering.txt')
		process_chunks(0, data2, major, 'req')
	end

	def down
		Req.destroy_all
		Option.destroy_all
		Chunk.destroy_all
	end


	def process_chunks(i, data, parent, parent_type)
		while (i<(data.length))
			puts i
			line = data[i]
			pieces = line.split(' ')
			puts "pieces: #{pieces}"
			case pieces[0]
			when 'O'
				opt = Option.new(:name => pieces[1])
				opt.req = parent
				opt.save
				puts "Saved O #{pieces[1]} at i=#{i}"
				i = process_chunks(i+1, data, opt, 'opt')
			when 'Ch'
				chunk = Chunk.new(:name => pieces[1])
				if (parent_type=='opt')
					chunk.opt_parent = 1
					chunk.option = parent
				else
					chunk.opt_parent = 0
					chunk.chunk = parent
				end
				chunk.save
				puts "Saved Ch #{pieces[1]} at i=#{i}"
				i = process_chunks(i+1, data, chunk, 'chunk')
			when 'R'
				reqq = Req.new(:name => pieces[1])
				if (pieces.length>2)
					numR = pieces[2]
				else
					numR = 1
				end
				# numR = pieces.length>2 ? pieces[2] : 1
				if (parent_type=='opt')
					reqq.opt_parent = 1
					reqq.option = parent
				else
					reqq.opt_parent = 0
					reqq.chunk = parent
				end
				reqq.numReqd = numR
				reqq.save
				puts "Saved R #{pieces[1]}, numReqd: #{numR} at i=#{i}"
				i = process_chunks(i+1, data, reqq, 'req') # parent type isn't used
			when 'C'
				code = pieces[1].upcase
				num = pieces[2]
				myCourse = Course.where("deptCode = ? AND deptNum = ?", code, num)
				parent.courses << myCourse
				parent.save
				puts "Added C #{myCourse} at i=#{i}"
				i+=1
			when 'OC'
				opt = Option.new(:name => (pieces[1]+pieces[2]))
				opt.req = parent
				code = pieces[1].upcase
				num = pieces[2]
				myCourse = Course.where("deptCode = ? AND deptNum = ?", code, num)
				opt.courses << myCourse
				opt.save
				puts "Added C #{myCourse} at i=#{i}"
				puts "Saved O of OC #{pieces[1]+pieces[2]} at i=#{i}"
				i+=1
			else
				puts "end returning #{i+1}"
				return i+1
			end
		end
		return i
	end
	    
end
