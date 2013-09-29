desc "Read in courses from an array of hashes"
task :readcourses => :environment do
	data = IO.readlines('FirstData.txt')
	arr = JSON.parse(data[0])
	count = 0
	arr.each do |crs|
		count += 1
		if (count%1000==0) then puts "Count is #{count}" end
		tmp_crs = Course.new(crs)
		tmp_crs.save
	end
end

desc "Destroy all courses"
task :destroycourses => :environment do
	Course.destroy_all
	puts "destroyed"
end


desc "Custom tasks"
task :custumz => :environment do
	mic = User.find(1)
	data = IO.readlines('testData.txt')
	data.each do |line|
		words = line.split
		if (words.length<2)
			puts "Only one word"
			next
		end
		code = words[0].upcase
		num = words[1]
		myCourse = Course.where("deptCode = ? AND deptNum = ?", code, num)
		puts myCourse
		mic.courses << myCourse
	end
end

desc "Second custom task"
task :cus2 => :environment do
	Option.destroy_all
	Req.destroy_all
	Chunk.destroy_all
	puts "orch destroyed"
end
